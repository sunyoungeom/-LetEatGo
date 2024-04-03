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

@WebServlet(name = "SearchAPIServlet", urlPatterns = { "/api/keyword", "/api/search" })
public class SearchAPIServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		System.out.println(requestURI);
		if (requestURI.endsWith("/api/keyword")) {
			UserService service = new UserService();
			resp.getWriter().write(service.getUserAddress(1));
		} else if (requestURI.endsWith("/api/search")) {
			String keyword = req.getParameter("keyword");
			resp.getWriter().write(SearchAPI.searchBlog(keyword));
		}
	}

}