package person;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet("/person/personlist")
public class PersonListServlet  extends HttpServlet{
	UserService userService = new UserService();
	ReviewService reviewService = new ReviewService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> userList = userService.getAllUsers();
		
		Collections.sort(userList, (user1, user2) -> {
	        double rating1 = reviewService.getAverageRatingByUserId(user1.getUser_id());
	        double rating2 = reviewService.getAverageRatingByUserId(user2.getUser_id());
	        return Double.compare(rating2, rating1); // 내림차순으로 정렬
	    });
		
		ServletUtil.sendJsonBody(userList, resp);

		
	}
	
}
