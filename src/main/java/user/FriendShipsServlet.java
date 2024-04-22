package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import util.ServletUtil;

@WebServlet("/add_friend")
public class FriendShipsServlet extends HttpServlet {
	UserService service = new UserService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Object attribute = request.getSession().getAttribute("user");
		User user = (User) attribute;
		int user_id_Send = user.getUser_id();

		// 클라이언트로부터 받은 JSON 데이터를 읽기
		String requestData = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);

		// JSON 데이터 파싱
		JSONObject jsonRequest = new JSONObject(requestData);
		String user_id_Recieve = jsonRequest.getString("userId");

		int recieve_id = Integer.parseInt(user_id_Recieve);
		FriendShip friendships = service.findFriendships(user_id_Send, recieve_id);
		FriendShip friendships2 = service.findFriendships(recieve_id, user_id_Send);
		if (friendships ==  null && friendships2 == null) {
			service.insertFriendships(user_id_Send, recieve_id);
			ServletUtil.sendJsonBody("친구 요청 완료.", response);
		} else if (friendships.getStatus() == 0||friendships.getStatus() == 1 && friendships2 != null) {
			ServletUtil.sendJsonBody("이미친구요청을 보냈거나 이미 친구입니다.", response);
		} 
	}
}
