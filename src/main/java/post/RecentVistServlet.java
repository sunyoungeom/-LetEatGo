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
	PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/post/recent_vist.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object attribute = req.getSession().getAttribute("user");
		User user = (User) attribute;
		int writeuser_id = user.getUser_id();
		List<Post> placeByIdList = postService.getPlaceById(writeuser_id);
		
		ServletUtil.sendJsonBody(placeByIdList, resp);
	}


	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = req.getParameter("page") != null && !req.getParameter("page").isEmpty()
				? Integer.parseInt(req.getParameter("page"))
				: 1;
		int pagePer = req.getParameter("pagePer") != null && !req.getParameter("pagePer").isEmpty()
				? Integer.parseInt(req.getParameter("pagePer"))
				: 1;
		
		PostDTO posts = postService.getactivePage(page, pagePer);
		
		ServletUtil.sendJsonBody(posts, resp);

	}
	

}
