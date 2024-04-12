package websocket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import post.Post;
import user.User;
import user.UserService;
import util.ServletUtil;

@WebServlet("/post/ChatWindow/*")
public class ChatwindowServlet extends HttpServlet {
	private ChatService chatService;
	private Post post;
	private UserService userService;
	private User user;

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 경로 파라미터에서 postId 추출
        String[] pathParts = request.getPathInfo().split("/");
        String postIdString = pathParts[pathParts.length - 1]; // 경로의 마지막 부분이 postId가 됨
        System.out.println("게시물의 번호:" + postIdString);
        
        // postId를 정수로 파싱
        int postId = Integer.parseInt(postIdString);
        System.out.println(postId);
        
        String nickname = null;
        Cookie[] cookies = request.getCookies();
        System.out.println("쿠키");
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("nickname")) {
                    nickname = cookie.getValue();
                    System.out.println("쿠키 :" + nickname);
                    break;
                }
            }
            if (nickname != null) {
                chatService = new ChatService();
                userService = new UserService();
                int guestuser_id = userService.getUserIdByNickName(nickname);
                
                // 이 부분에서 새로운 Post 객체를 생성하여 초기화합니다.
                post = new Post(); // 적절한 생성자를 사용하여 객체를 초기화해야 합니다.
                int writeuser_id = post.getWriteUser_Id(); // post 객체가 어디서 가져올지는 알 수 없으므로 수정이 필요할 수 있습니다.
                Conversations conversations = new Conversations(postId, writeuser_id, guestuser_id);
                chatService.deleteChatroom(conversations);
                System.out.println("삭제됨");
            } else {
                System.out.println("쿠키에 사용자 닉네임이 없습니다.");
            }
        } else {
            System.out.println("쿠키가 없습니다.");
        }
        
        response.setStatus(HttpServletResponse.SC_OK);
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("post_Id")); // POST 요청에서 post_id 파라미터를 정수로 변환하여 받아옴
//        System.out.println(postId);
		request.setAttribute("post_Id", postId); // post_id 값을 request의 attribute로 설정하여 JSP 페이지로 전달
		request.getRequestDispatcher("/WEB-INF/WebSocket/ChatWindow.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 채팅창 이 켜질때 post처리해야하고 들어온사람을 db에 저장
		String body = ServletUtil.readBody(request);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = mapper.readTree(body);
		int postId = jsonNode.get("post_id").asInt(); // postId 가져오기
	}
}
