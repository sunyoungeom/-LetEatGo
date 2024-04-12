package person;


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

import com.fasterxml.jackson.databind.ObjectMapper;

import post.Post;
import post.PostService;
import post_review.Review;
import post_review.ReviewMapper;
import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet(urlPatterns = { "/person", "/person/detail"})
public class PersonServlet extends HttpServlet {
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// GET 요청을 처리합니다.
		String requestURI = req.getRequestURI();
		if(requestURI.equals("/person")) {
			req.getRequestDispatcher("/WEB-INF/person/person.jsp").forward(req, resp);
		} else if(requestURI.equals("/person/detail")) {
			req.getRequestDispatcher("/WEB-INF/person/persondetail.jsp").forward(req, resp);
		}
	}
}