package websocket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.Post;

@WebServlet("/post/ChatWindow")
public class ChatwindowServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("post_id")); // POST 요청에서 post_id 파라미터를 받아옴
		System.out.println(postId);
	    request.setAttribute("post_id", postId); // postid 값을 request의 attribute로 설정하여 JSP 페이지로 전달 
		request.getRequestDispatcher("/WEB-INF/WebSocket/ChatWindow.jsp").forward(request, response);
	} 
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int postId = Integer.parseInt(request.getParameter("post_id")); // POST 요청에서 post_id 파라미터를 받아옴
	    request.setAttribute("post_id", postId); // postid 값을 request의 attribute로 설정하여 JSP 페이지로 전달
	    request.getRequestDispatcher("/WEB-INF/WebSocket/ChatWindow.jsp").forward(request, response);
	}
}
