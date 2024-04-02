package user;

import static util.ServletUtil.*;
import user.UserAPIException.*;


import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;

import util.ServletUtil;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private UserService service = new UserService();
	private UserValidator validator = new UserValidator();
	private JsonMapper mapper = new JsonMapper();
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        if ("register".equals(action)) {
	            request.getRequestDispatcher("/WEB-INF/user/userJoin.jsp").forward(request, response);
	        } else if ("update".equals(action)) {
	            request.getRequestDispatcher("/WEB-INF/user/userUpdate.jsp").forward(request, response);
	        } else if ("delete".equals(action)) {
	            request.getRequestDispatcher("/WEB-INF/user/userDelete.jsp").forward(request, response);
	        }
	        else {
	            response.sendRedirect(request.getContextPath());
	        }
	    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action != null) {
			 try {
		            String body = readBody(request);
		            User user = mapper.readValue(body, User.class);
		            Map<String, String> errors = validator.validate(user);
		            if (!errors.isEmpty()) {
		                throw new UserAPIException("입력값 유효성 검사 실패", 400, errors);
		            }

		            int result = service.insert(user);
		            if (result == 1) {
		                response.setStatus(201);
		            }

		            request.setAttribute("id", user.getId());
		            request.getRequestDispatcher("/WEB-INF/user/userJoinResult.jsp").forward(request, response);
		        } catch (UserAPIException e) {
		            // 클라이언트로 오류 메시지를 전달
		            response.setContentType("application/json");
		            response.setCharacterEncoding("UTF-8");
		            response.setStatus(e.getCode());

		            // 오류 메시지를 JSON 형식으로 전송
		            ObjectMapper objectMapper = new ObjectMapper();
		            objectMapper.writeValue(response.getWriter(), e.getErrors());
		        }
		        } else if ("update".equals(action)) {
		            request.getRequestDispatcher("/WEB-INF/user/userUpdate.jsp").forward(request, response);
		        } else if ("delete".equals(action)) {
		            request.getRequestDispatcher("/WEB-INF/user/userDelete.jsp").forward(request, response);
		        }
		        else {
//		            response.getWriter().println("유효하지 않음");
		            response.sendRedirect(request.getContextPath());

		        
		}
			
		
	}

}
