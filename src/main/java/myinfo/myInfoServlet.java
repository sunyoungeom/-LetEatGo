package myinfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import user.User;
import user.UserService;
import util.ServletUtil;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/myInfo")
public class myInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// menuMain.jsp 파일을 클라이언트로 보냄
		
		  String detail = req.getParameter("detail");
	        
	        if (detail != null) {
	            if (detail.equals("profile")) {
	            	req.getRequestDispatcher("/WEB-INF/myinfo/myInfo.jsp").forward(req, resp);
	            } else if (detail.equals("post")) {
	            	req.getRequestDispatcher("/WEB-INF/myinfo/MyPost.jsp").forward(req, resp);

	            }
	            
	            else {
	                // 처리할 액션이 없는 경우 예외 처리
	            	System.out.println("fsdfsdfsd");
	            	resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter value");
	            }
	        } else {
	            // 액션 파라미터가 전달되지 않은 경우 예외 처리
	        	resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter");
	        }
	    }

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String body = ServletUtil.readBody(req);
	    System.out.println(body);
	    ObjectMapper mapper = new ObjectMapper();
	    JsonNode jsonNode = mapper.readTree(body);

	    String field = jsonNode.get("field").asText();
	    String value = jsonNode.get("value").asText();
	    
	    if (value.equals("null")) {
	    	value = null;
	    }

	    HttpSession session = req.getSession();
	    User user = (User) session.getAttribute("user");

	    UserService userService = new UserService();
	    int userId = userService.getUserId(user.getId());

	    // 필드 값에 따라 적절한 서비스 함수 호출
	    if ("nickname".equals(field)) {
	        userService.updateNickname(user.getId(), value);
	        user.setNickname(value);
	    } else if ("phonenumber".equals(field)) {
	        userService.updatePhonenumber(user.getId(), value);
	        user.setPhonenumber(value);
	    } else if ("email".equals(field)) {
	        userService.updateEmail(user.getId(), value);
	        user.setEmail(value);
	    } else if ("address".equals(field)) {
	        userService.updateAddress(user.getId(), value);
	        user.setAddress(value);
	    } else if ("bloodtype".equals(field)) {
	        userService.updateBloodtype(user.getId(), value);
	        user.setBloodtype(value);
	    } else if ("mbti".equals(field)) {
	        userService.updateMBTI(user.getId(), value);
	        user.setMbti(value);
	    }

	    // 수정된 User 객체를 다시 세션에 저장
	    session.setAttribute("user", user);

	    // 클라이언트 측으로 완료 메시지를 JSON 형식으로 전달
	    resp.setContentType("application/json");
	    resp.setCharacterEncoding("UTF-8");
	    PrintWriter out = resp.getWriter();
	    out.print("{\"message\": \"Field updated successfully\"}");
	    out.flush();
	}

	
	
	}
