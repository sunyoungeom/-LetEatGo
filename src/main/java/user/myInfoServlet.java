package user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/myinfo")
public class myInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// menuMain.jsp 파일을 클라이언트로 보냄
		req.getRequestDispatcher("/WEB-INF/user/myInfo.jsp").forward(req, resp);

	}
}
