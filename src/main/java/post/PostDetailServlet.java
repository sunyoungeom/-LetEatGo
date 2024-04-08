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
import post_review.ReviewMapper;
import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet(urlPatterns = {"/post/detail", "/post/addReview"})
public class PostDetailServlet extends HttpServlet {
	private PostService postService = new PostService();
	private UserService userService = new UserService();
	private ReviewService reviewService =new ReviewService();

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
            User user = userService.getUser(post.getWriteUser_Id());
            List<Object> list = new ArrayList<Object>();
            list.add(post);
            list.add(user);

            // JSON 형태로 변환하여 응답합니다.
            ObjectMapper mapper = new ObjectMapper();
            resp.setContentType("application/json");
            mapper.writeValue(resp.getWriter(), list);
        } else if (requestURI.endsWith("/post/addReview")) {
            // 리뷰 추가 요청 처리
            // 나머지 리뷰 관련 로직을 작성하세요.
        	String requestBody = ServletUtil.readBody(req);
        	ObjectMapper mapper = new ObjectMapper();
        	Review review = mapper.readValue(requestBody, Review.class);
        	reviewService.addReview(review);
            resp.setStatus(HttpServletResponse.SC_OK); // 성공적으로 처리되었다는 응답 코드를 반환합니다.
        }
    }
}
