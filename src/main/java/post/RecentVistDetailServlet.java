package post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchbymap.SearchAPI;
import searchbymap.SearchResult;
import user.User;
import util.ServletUtil;

@WebServlet("/recent/detail")
public class RecentVistDetailServlet extends HttpServlet {
	PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String index = req.getParameter("index");
	    req.setAttribute("index", index);
		req.getRequestDispatcher("/WEB-INF/post/recent_visitdetail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}

	
	
}
