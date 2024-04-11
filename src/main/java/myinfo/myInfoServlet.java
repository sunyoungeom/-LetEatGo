package myinfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserService;
import util.ServletUtil;

import java.io.IOException;

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

	            } else if (detail.equals("comment")) {
	            	req.getRequestDispatcher("/WEB-INF/myinfo/Mycomment.jsp").forward(req, resp);
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
		
		UserService userService = new UserService();
		
	}
	
	
	}
