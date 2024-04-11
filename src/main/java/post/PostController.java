package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import post_review.ReviewDTO;
import post_review.ReviewService;
import util.ServletUtil;

@WebServlet(urlPatterns = { "/post/list", "/review/list" })
public class PostController extends HttpServlet {
	private PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET 요청을 처리합니다.
		request.getRequestDispatcher("/WEB-INF/post/postlist.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POST 요청을 처리합니다.
		// 새로운 게시물 생성 등의 작업을 수행할 수 있습니다.
//		int page = Integer.parseInt(request.getParameter("page"));
//		int pagePer = Integer.parseInt(request.getParameter("pagePer"));
		String requestURI = request.getRequestURI();
		int page = request.getParameter("page") != null && !request.getParameter("page").isEmpty()
				? Integer.parseInt(request.getParameter("page"))
				: 1;
		int pagePer = request.getParameter("pagePer") != null && !request.getParameter("pagePer").isEmpty()
				? Integer.parseInt(request.getParameter("pagePer"))
				: 1;


		// JSON 형태로 변환하여 응답합니다.
		if (requestURI.equals("/review/list")) {
			ReviewDTO reviews = ReviewService.getReviewPage(page, pagePer);
			ServletUtil.sendJsonBody(reviews, response);
		} else if (requestURI.equals("/post/list")) {
			PostDTO posts = postService.getPostPage(page, pagePer);
			ServletUtil.sendJsonBody(posts, response);
		}
	}
}
