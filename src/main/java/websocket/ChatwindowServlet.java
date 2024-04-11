package websocket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import user.UserService;
import util.ServletUtil;

@WebServlet("/post/ChatWindow")
public class ChatwindowServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("post_Id")); // POST 요청에서 post_id 파라미터를 정수로 변환하여 받아옴
//        System.out.println(postId);
		request.setAttribute("post_Id", postId); // post_id 값을 request의 attribute로 설정하여 JSP 페이지로 전달
		request.getRequestDispatcher("/WEB-INF/WebSocket/ChatWindow.jsp").forward(request, response);
	}

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 채팅창 이 켜질때 post처리해야하고 들어온사람을 db에 저장
    	String body = ServletUtil.readBody(request);
        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(body);
        int postId = jsonNode.get("post_Id").asInt(); // postId 가져오기
    }
}
