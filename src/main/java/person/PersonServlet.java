package person;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import post.Post;
import post.PostDTO;
import post.PostService;
import post_review.Review;
import post_review.ReviewMapper;
import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet(urlPatterns = { "/person", "/person/detail", "/person/activepostlist", "/person/completedpostlist",
		"/person/personinfo", "/person/totalpersoninfo" })
public class PersonServlet extends HttpServlet {
	private UserService userService = new UserService();
	private PostService postService = new PostService();
	private ReviewService reviewService = new ReviewService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 요청을 처리합니다.
		String requestURI = req.getRequestURI();
		if (requestURI.equals("/person")) {
			req.getRequestDispatcher("/WEB-INF/person/person.jsp").forward(req, resp);
		} else if (requestURI.equals("/person/detail")) {
			String userId = req.getParameter("userid");
	        req.setAttribute("userId", userId);
			req.getRequestDispatcher("/WEB-INF/person/persondetail.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = req.getParameter("page") != null && !req.getParameter("page").isEmpty()
				? Integer.parseInt(req.getParameter("page"))
				: 1;
		int pagePer = req.getParameter("pagePer") != null && !req.getParameter("pagePer").isEmpty()
				? Integer.parseInt(req.getParameter("pagePer"))
				: 1;

		int userid = Integer.parseInt(req.getParameter("userid"));

		User user = userService.getUser(userid);

		List<Post> total = postService.getUserPostList(userid);

		List<Post> progressing = new ArrayList();
		List<Post> completed = new ArrayList();

		for (Post p : total) {
			if (p.getStatus() == 0) {
				progressing.add(p);
			} else if (p.getStatus() == 1) {
				completed.add(p);
			}
		}

		String requestURI = req.getRequestURI();

		if (requestURI.equals("/person/activepostlist")) {
			
			PostDTO posts = postService.getactivePostPage(page, pagePer,userid, progressing.size(),progressing);
			posts.setItems(progressing);
			ServletUtil.sendJsonBody(posts, resp);
		} else if (requestURI.equals("/person/completedpostlist")) {
			PostDTO posts = postService.getactivePostPage(page, pagePer,userid, completed.size(),completed);
			posts.setItems(completed);
			ServletUtil.sendJsonBody(posts, resp);
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		if (requestURI.equals("/person/personinfo")) {
			int userid = Integer.parseInt(req.getParameter("userid"));

			double rating = reviewService.getAverageRatingByUserId(userid);
			User user = userService.getUser(userid);

			Map<String, Object> userinfo = new HashMap();
			userinfo.put("rating", rating);
			userinfo.put("user", user);

			ServletUtil.sendJsonBody(userinfo, resp);
		} else if (requestURI.equals("/person/totalpersoninfo")) {
		    List<User> userList = userService.getAllUsers();

		    // 사용자 리스트를 평점에 따라 내림차순으로 정렬
		    Collections.sort(userList, (user1, user2) -> {
		        double rating1 = reviewService.getAverageRatingByUserId(user1.getUser_id());
		        double rating2 = reviewService.getAverageRatingByUserId(user2.getUser_id());
		        return Double.compare(rating2, rating1); // 내림차순으로 정렬
		    });

		    // 클라이언트에게 전송
		    ServletUtil.sendJsonBody(userList, resp);
		}

	}

}