package myinfo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.FriendShip;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet("/getFriendsList")
public class ShowFriendsListServlet extends HttpServlet {
	UserService service = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object attribute = req.getSession().getAttribute("user");
		User user = (User) attribute;
		int user_id = user.getUser_id();

		List<FriendShip> frinedsList = service.getFriendsList(user_id);
		List<User> friendUsers = new ArrayList<>(); // 유저 정보를 담을 리스트
		System.out.println("목록: "+ frinedsList);
		for (FriendShip f : frinedsList) {
			// 친구의 user1_id로 해당 유저 정보를 가져와 리스트에 추가
			User friendUser = service.getUserNickNameAndIdentify(f.getUser1_id());
			if (friendUser != null) { // 유저 정보가 있는 경우에만 리스트에 추가
				friendUsers.add(friendUser);
			}
		}
		System.out.println("목록2:" +friendUsers);
		ServletUtil.sendJsonBody(friendUsers, resp);

	}
}
