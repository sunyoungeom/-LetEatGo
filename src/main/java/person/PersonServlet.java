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

import post_review.Review;
import post_review.ReviewMapper;
import post_review.ReviewService;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet("/person")
public class PersonServlet extends HttpServlet {
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// GET 요청을 처리합니다.
		request.getRequestDispatcher("/WEB-INF/person/person.jsp").forward(request, response);
	}
}