package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(req, resp);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = userService.getUserById(username);

		if (user != null && user.getPassword().equals(password)) {
			userService.checkAttendance(username);
			user = userService.getUserById(username);
			// 인증 성공 시 세션에 사용자 정보를 설정
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			// 로그인 성공 후 인덱스 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			// 인증 실패 시 다시 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}
}
