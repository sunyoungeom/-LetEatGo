package searchAPI;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;
import user.UserMapper;
import user.UserService;

@WebServlet(name = "SearchAPIServlet", urlPatterns = "/api/search")
public class SearchAPIServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			UserService service = new UserService();
			resp.getWriter().write(service.getUserAddress(2));
		}
}
