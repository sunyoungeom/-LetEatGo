package searchbymap;

import java.io.IOException;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet("/person/personmap/searchperson")
public class PersonSearchServlet extends HttpServlet{
	private ReviewService reviewService = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object attribute = req.getSession().getAttribute("user");
		User user = (User) attribute;
		int user_id = user.getUser_id();
		UserService service = new UserService();
		String userAddress = service.getUserAddress(user_id);
		userAddress = userAddress.replaceAll("\\([^\\(]*\\)", "").trim();

		System.out.println(userAddress);

		UserService userService = new UserService();
		List<User> allUsers = userService.getAllUsersExceptMe(user_id);

		// 각 사용자의 주소를 수정하여 ()와 안의 ()안의 값을 제거
		for (User currentUser : allUsers) {
			String address = currentUser.getAddress();
			address = address.replaceAll("\\([^\\(]*\\)", "").trim();
			currentUser.setAddress(address);
			reviewService.getAverageRatingByUserId(currentUser.getUser_id());
		}
	    List<User> sortedUsers = allUsers.stream()
	            .sorted(Comparator.comparingDouble(ratinguser -> -reviewService.getAverageRatingByUserId(user.getUser_id())))
	            .collect(Collectors.toList());
		
		
		Map<String, Object> total = new HashMap<String, Object>();
		total.put("userAddress", userAddress);
		total.put("allUsers", allUsers);
		total.put("user", user);
		total.put("sortedUsers", sortedUsers);
				
		
		ServletUtil.sendJsonBody(total, resp);
	
	}

}
