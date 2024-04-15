package person;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.Post;
import post.PostService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet("/recent/person")
public class RecentPersonServlet extends HttpServlet {
	PostService postService = new PostService();
	UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/person/recent_person.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user =  (User) req.getSession().getAttribute("user");
		List<Post> postList = postService.getUserPostList(user.getUser_id());
		int lastIndex = postList.size() - 1; // 리스트의 마지막 인덱스 계산
		
		System.out.println("값확인" + postList);
		if (lastIndex >= 0) { // 리스트가 비어있지 않은 경우
			Post lastPost = postList.get(lastIndex); // 리스트의 마지막 요소 가져오기
		    List<Integer> guestIdList = postService.getGuestUserIdByPostId(lastPost.getPost_Id());
		    List<User> userList = new ArrayList<User>();
		    for(Integer i : guestIdList) {
		    	User guestuser = userService.getUser(i);
		    	userList.add(guestuser);
		    }
		    
		    System.out.println("값확인"+ userList);
		    ServletUtil.sendJsonBody(userList, resp);
		    
		} else {
			//TODO: 리스트가 비어있는 경우에 대한 처리
			
		}
		
		
		
		
		
	}
}
