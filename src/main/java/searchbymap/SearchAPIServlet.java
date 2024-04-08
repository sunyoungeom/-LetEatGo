package searchbymap;

import java.io.IOException;
import java.util.List;

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
import searchbymap.SearchAPI.SearchResult;
import user.User;
import user.UserMapper;
import user.UserService;

@WebServlet(name = "SearchAPIServlet", urlPatterns = { "/map/keyword","/map/search","/map/search/createpost","/map/search/createpost/dialog" })
public class SearchAPIServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			String requestURI = req.getRequestURI();
			System.out.println(requestURI);
			if (requestURI.endsWith("/map/keyword")) {
				// '/map/keyword' 요청에 대한 처리
				UserService service = new UserService();
				resp.getWriter().write(service.getUserAddress(1));
			} else if (requestURI.endsWith("/map/search")) {
				// '/map/search' 요청에 대한 처리
				String keyword = req.getParameter("keyword");
				List<SearchResult> list = SearchAPI.searchBlogAsJson(keyword);

				// 검색 결과를 JSON 형식으로 변환
				ObjectMapper mapper = new ObjectMapper();
				resp.setContentType("application/json");

				// JSON 형식으로 응답
				mapper.writeValue(resp.getWriter(), list);
			} else if(requestURI.endsWith("/map/search/createpost")){
				req.getRequestDispatcher("/WEB-INF/post/createpost.html").forward(req, resp);
				
			}else {
			
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
			}
		
	}
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String requestURI = req.getRequestURI();
//	    if (requestURI.endsWith("/map/search/createpost/dialog")) {
//	        // 다이얼로그를 열기 위한 HTML 코드를 생성합니다.
//	        String dialogContent = "<div id='dialog' class='dialog'>"
//	                              + "<p>다이얼로그 내용</p>"
//	                              + "<button id='close'>닫기</button>"
//	                              + "</div>";
//
//	        // 생성한 HTML 코드를 클라이언트로 전송합니다.
//	        resp.setContentType("text/html");
//	        resp.getWriter().write(dialogContent);
//	    } else {
//	        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
//	    }
//	}
}