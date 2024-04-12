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

import post_review.Review;
import post_review.ReviewDTO;
import post_review.ReviewService;
import user.User;
import util.ServletUtil;

@WebServlet(urlPatterns = { "/post/list", "/review/list", "/post/mypostlist"})
public class PostController extends HttpServlet {
	private PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET 요청을 처리합니다.
		String requestURI = request.getRequestURI();
		if(requestURI.equals("/post/list")) {
			request.getRequestDispatcher("/WEB-INF/post/postlist.jsp").forward(request, response);
		} else if(requestURI.equals("/post/mypostlist")) {
			request.getRequestDispatcher("/WEB-INF/myinfo/MyPost.jsp").forward(request, response);
		}
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

		User user = (User) request.getSession().getAttribute("user");

		// JSON 형태로 변환하여 응답합니다.
		if (requestURI.equals("/post/list")) {
			PostDTO posts = postService.getPostPage(page, pagePer);
			ServletUtil.sendJsonBody(posts, response);
		} else if (requestURI.equals("/review/list")) {
			ReviewDTO reviews = ReviewService.getMyReviewPage(page, pagePer, user.getUser_id());
			System.out.println(reviews.getItems().toString());
			ServletUtil.sendJsonBody(reviews, response);
		} else if (requestURI.equals("/post/mypostlist")) {
			PostDTO posts = postService.getMyPostPage(page, pagePer, user.getUser_id());
			ServletUtil.sendJsonBody(posts, response);
		}
	}
}
