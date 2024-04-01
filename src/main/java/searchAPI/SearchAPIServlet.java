package searchAPI;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchAPIServlet", urlPatterns = "/api/search")
public class SearchAPIServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String keyword = req.getParameter("keyword");
	        if (keyword != null && !keyword.isEmpty()) {
	            String result = SearchAPI.searchBlog(keyword);
	            resp.setContentType("application/json");
	            resp.setCharacterEncoding("UTF-8");
	            resp.getWriter().write(result);
	        } else {
	            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            resp.getWriter().write("Keyword parameter is required");
	        }
	    }
	}