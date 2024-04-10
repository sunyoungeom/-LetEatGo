package post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import util.ServletUtil;

@WebServlet("/recent")
public class RecentVistServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/post/recent_vist.jsp").forward(req, resp);
		
		Object attribute = req.getSession().getAttribute("user");
		User user = (User) attribute;
		int writeUser_id = user.getUser_id();
		
		PostService postService = new PostService();
		List<Post> placeByIdList = postService.getPlaceById(writeUser_id);
		ServletUtil.sendJsonBody(placeByIdList, resp);
	}

}
