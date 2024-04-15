package post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServletUtil;

@WebServlet("/menu/search")
public class SearchServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PostService postService = new PostService();
		List<Post> allPosts = postService.getAllPosts();
		for(Post p : allPosts) {
			p.getTitle();
		}
		ServletUtil.sendJsonBody(allPosts, resp);
	
	}
	
}
