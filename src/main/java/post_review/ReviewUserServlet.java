package post_review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import user.User;
import util.ServletUtil;

@WebServlet("/user/userReview")
public class ReviewUserServlet extends HttpServlet{
	ReviewService reviewService = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/ratingTest.jsp").forward(req, resp);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 접속중인 유저 == 작성자
		User user = (User)req.getSession().getAttribute("user");
		
		// 요청 바디를 읽어옴
        String requestBody = ServletUtil.readBody(req);

        // JSON 데이터 파싱
        JSONObject jsonRequest = new JSONObject(requestBody);

        // 텍스트 내용과 별점 추출
        String review = jsonRequest.getString("reviewText");
        int rating = jsonRequest.getInt("starValue");

        // 리뷰 객체 생성 및 초기화
        Review saveReview = new Review();
        saveReview.setWriteUserId(user.getUser_id());
        saveReview.setReview(review);
        saveReview.setRating(rating);
        
        System.out.println(saveReview);
        // 디비 저장
        reviewService.addReview(saveReview);
	}
	
}
