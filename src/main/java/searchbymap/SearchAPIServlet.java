package searchbymap;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import listener.MyWebContextListener;
import post.Post;
import post.PostService;
import user.User;
import user.UserMapper;
import user.UserService;
import util.ServletUtil;

@WebServlet(name = "SearchAPIServlet", urlPatterns = { "/map/keyword", "/map/search", "/map/search/createpost",
      "/map/search/createpost/dialog" })
public class SearchAPIServlet extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String requestURI = req.getRequestURI();
    
         if (requestURI.endsWith("/map/keyword")) {

            Object attribute = req.getSession().getAttribute("user");
            User user = (User) attribute;
            int user_id = user.getUser_id();
            UserService service = new UserService();
            String userAddress = service.getUserAddress(user_id);
            userAddress = userAddress.replaceAll("\\([^\\(]*\\)", "").trim();
            resp.getWriter().write(userAddress);

         } else if (requestURI.endsWith("/map/search")) {
            // '/map/search' 요청에 대한 처리
            String keyword = req.getParameter("keyword");
            List<SearchResult> list = SearchAPI.searchBlogAsJson(keyword);
            
            PostService postService = new PostService();
            String title = req.getParameter("title");
            System.out.println("타이틀: "+title);
            List<Post> ingList = new ArrayList<Post>();
            List<Post> endList = new ArrayList<Post>();
            
            List<Post> postsByPlace = postService.getPostsByPlace(title);
            for(Post p :postsByPlace ) {
            	if(p.getStatus()==0) {
            		ingList.add(p);
            	}else if(p.getStatus()==1) {
            		endList.add(p);
            	}
            }
            Map<String, Object> total = new HashMap<>() ;
            
            total.put("ing", ingList);
            total.put("end", endList);
            total.put("blog", list);
            
            ServletUtil.sendJsonBody(total, resp);
            
         } else if (requestURI.endsWith("/map/search/createpost")) {
            req.getRequestDispatcher("/WEB-INF/post/createpost.jsp").forward(req, resp);
            String title = req.getParameter("title");
            
            ServletUtil.sendJsonBody(title, resp);
         } else {

            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
         }
      } 
   }

