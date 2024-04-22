package post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServletUtil;

@WebServlet(urlPatterns = { "/post/posttotal", "/post/activatedpost", "/post/closedpost" })
public class PostTotalServlet extends HttpServlet {
	PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/post/posttotal.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String reqURI = req.getRequestURI();
		if (reqURI.endsWith("activatedpost")) {
			int page = req.getParameter("page") != null && !req.getParameter("page").isEmpty()
					? Integer.parseInt(req.getParameter("page"))
					: 1;
			int pagePer = req.getParameter("pagePer") != null && !req.getParameter("pagePer").isEmpty()
					? Integer.parseInt(req.getParameter("pagePer"))
					: 1;
			
			PostDTO posts = postService.getactivePage(page, pagePer);
			ServletUtil.sendJsonBody(posts, resp);
		} else if (reqURI.endsWith("closedpost")) {
			int page = req.getParameter("page") != null && !req.getParameter("page").isEmpty()
					? Integer.parseInt(req.getParameter("page"))
					: 1;
			int pagePer = req.getParameter("pagePer") != null && !req.getParameter("pagePer").isEmpty()
					? Integer.parseInt(req.getParameter("pagePer"))
					: 1;
			PostDTO posts = postService.getPostPage(page, pagePer);
			ServletUtil.sendJsonBody(posts, resp);

		}

	}

}
