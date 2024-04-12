package websocket;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import post.Post;
import user.User;
import user.UserService;

@WebServlet("/chatList")
public class MyChatList extends HttpServlet {
    private ChatService chatService = new ChatService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 세션에서 현재 사용자 정보 가져오기
        User currentUser = (User) request.getSession().getAttribute("user");

        if (currentUser != null) {
            // 현재 사용자의 아이디를 가져와서 해당 사용자의 채팅 목록을 가져옴
            int userId = currentUser.getUser_id();
            List<Post> chatList = chatService.getListByGId(userId);
//            System.out.println(chatList.toString());

            // JSON 형태로 응답을 보냄
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonChatList = objectMapper.writeValueAsString(chatList);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonChatList);
        } else {
            // 로그인이 되어있지 않은 경우 로그인 페이지로 리다이렉트
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST 요청에 대한 처리
        // 현재 사용자의 아이디를 가져와서 해당 사용자의 채팅 목록을 가져옴
        User currentUser = (User) request.getSession().getAttribute("user");

        if (currentUser != null) {
            int userId = currentUser.getUser_id();
            List<Post> chatList = chatService.getListByGId(userId);
            System.out.println(chatList.toString());
            
            // JSON 형태로 응답을 보냄
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonChatList = objectMapper.writeValueAsString(chatList);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonChatList);
        } else {
            // 로그인이 되어있지 않은 경우 에러 응답
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }
}
