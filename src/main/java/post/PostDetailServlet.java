package post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import post_review.Review;
import post_review.ReviewMapper;
import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet(urlPatterns = { "/post/detail", "/post/addReview", "/post/getUserId", "/post/deleteReview/*", "/post/updateReview/*" })
public class PostDetailServlet extends HttpServlet {
	private PostService postService = new PostService();
	private UserService userService = new UserService();
	private ReviewService reviewService = new ReviewService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// GET 요청을 처리합니다.
		
		request.getRequestDispatcher("/WEB-INF/post/post_detail.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		
		
		if (requestURI.endsWith("/post/detail")) {
			// 게시물 상세 정보 요청 처리
			int postId = Integer.parseInt(req.getParameter("post_Id"));
			Post post = postService.getPostById(postId);
			
			postService.increasePostViews(postId);
			List<PostWithGuestUserIdDTO> DTOList = postService.getPostsWithStatusAndGuestUserId();
			
			User user = userService.getUser(post.getWriteUser_Id());
			String place = postService.getPlaceByPostId(postId);
			PostTag tag = postService.getPostTagbyPostId(postId);
			System.out.println("장소 : " + place);
			System.out.println("태그 : " + tag);
			// 해당 게시물의 리뷰 목록도 함께 가져옵니다.
			List<Review> reviews = reviewService.getReviewsByPostId(postId);
			// 게시물과 리뷰 목록을 함께 담아 JSON 형태로 응답합니다.
			Map<String, Object> responseMap = new HashMap<>();
			responseMap.put("post", post);
			responseMap.put("user", user);
			responseMap.put("reviews", reviews);
			responseMap.put("place", place);
			responseMap.put("tags", tag);
			responseMap.put("DTOList", DTOList);
			// JSON 형태로 변환하여 응답합니다.
			ServletUtil.sendJsonBody(responseMap, resp);
		} else if (requestURI.endsWith("/post/addReview")) {
			// 리뷰 추가 요청 처리
			String requestBody = ServletUtil.readBody(req);
			ObjectMapper mapper = new ObjectMapper();
			Review review = mapper.readValue(requestBody, Review.class);
			reviewService.addReview(review);
			
		} 
		else if (requestURI.endsWith("/post/getUserId")) {
			User user = (User) req.getSession().getAttribute("user");
			resp.setContentType("application/json");
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(resp.getWriter(), user);
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pathInfo = req.getPathInfo();
	    String[] pathParts = pathInfo.split("/");
	    String reviewId = pathParts[1];
		
	    reviewService.deleteReview(Integer.parseInt(reviewId));
	    resp.setStatus(HttpServletResponse.SC_OK);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pathInfo = req.getPathInfo();
	    String[] pathParts = pathInfo.split("/");
	    String reviewId = pathParts[1];
	    
	    String requestBody = ServletUtil.readBody(req);
	    
	 // JSON 데이터를 Review 객체로 변환
	    ObjectMapper mapper = new ObjectMapper();
	    Review review = mapper.readValue(requestBody, Review.class);
	    System.out.println(review);
	    reviewService.updateReview(review);
	    
	}
	
	
	
}
