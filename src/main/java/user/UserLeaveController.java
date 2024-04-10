package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.bytebuddy.dynamic.TypeResolutionStrategy.Passive;
import util.ServletUtil;

@WebServlet("/leave")
public class UserLeaveController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/user/userDelete.jsp").forward(req, resp);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String body = ServletUtil.readBody(request);
		System.out.println(body);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = mapper.readTree(body);

		String inputId = jsonNode.get("id").asText();
		String inputPassword = jsonNode.get("password").asText();

		
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			// 입력된 비밀번호와 사용자의 비밀번호를 비교하여 일치하면 회원을 삭제하고 세션을 무효화
			if (user.getId().equals(inputId) && user.getPassword().equals(inputPassword)) {
				System.out.println("일치");
				UserService userService = new UserService();
				userService.deleteUser(user.getId());

				session.invalidate(); // 세션 무효화
				response.setStatus(HttpServletResponse.SC_OK); // 성공 응답 반환
			} else {
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 비밀번호 불일치 오류 응답 반환
				response.getWriter().write("비밀번호가 올바르지 않습니다.");
			}
		} else {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 세션 불일치 오류 응답 반환
			response.getWriter().write("세션이 만료되었습니다. 다시 로그인해주세요.");
		}
	}
}
