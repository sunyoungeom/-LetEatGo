package myinfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/myinfo/recieve", "/myinfo/friendsList" })
public class GoFriendServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();

		if (requestURI.endsWith("/myinfo/recieve")) {
			req.getRequestDispatcher("/WEB-INF/myinfo/myRecieveFriend.jsp").forward(req, resp);
		} else if (requestURI.endsWith("/myinfo/friendsList")) {
			req.getRequestDispatcher("/WEB-INF/myinfo/myFriendsList.jsp").forward(req, resp);
		}

	}
}
