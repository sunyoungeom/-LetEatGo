package post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import user.User;
import user.UserService;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private PostService postService = new PostService();
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// GET 요청을 처리합니다.
		request.getRequestDispatcher("/WEB-INF/post/post_detail.html").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int postId = Integer.parseInt(req.getParameter("post_Id"));
		Post post = postService.getPostById(postId);
		User user = userService.getUser(post.getWriteUser_Id());
		List<Object> list = new ArrayList<Object>();
		list.add(post);
		list.add(user);

		// JSON 형태로 변환하여 응답합니다.
		ObjectMapper mapper = new ObjectMapper();
		resp.setContentType("application/json");
		mapper.writeValue(resp.getWriter(), list);
	}
	
}
