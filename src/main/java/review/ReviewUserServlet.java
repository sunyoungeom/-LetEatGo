package review;

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
		//페이지 이동
		req.getRequestDispatcher("/ratingTest.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 유저 별점 추가?
		// 접속중인 유저 == 작성자
		User user = (User)req.getSession().getAttribute("user");
		
		// 요청 바디를 읽어옴
        String requestBody = ServletUtil.readBody(req);

        // JSON 데이터 파싱
        JSONObject jsonRequest = new JSONObject(requestBody);

        // 텍스트 내용과 별점 추출
        String review = jsonRequest.getString("reviewText");
        int rating = jsonRequest.getInt("starValue");

        // TODO: 친구 추가시 후 채팅시 post_id가 필요없음 새 테이블 또는 포레인키 제거 고민, 메소드 따로 이용?
        // 리뷰 객체 생성 및 초기화
        Review saveReview = new Review();
        saveReview.setWriteUserId(user.getUser_id());
        saveReview.setReview(review);
        saveReview.setRating(rating);
        // 모임 끝났을때 게시글 알아내서 포스트 id 넣어주기
        //saveReview.setPostId(postId);
        
        System.out.println(saveReview);
        // 디비 저장
        reviewService.addReview(saveReview);
	}
	
}
