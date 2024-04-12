package websocket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import listener.MyWebContextListener;
import post.Post;
import post.PostService;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import user.UserService;

@ServerEndpoint("/ChatingServer/{post_Id}/{nickname}")
public class ChatServer {
    private static final Map<Integer, List<Session>> clientsByPostId = new HashMap<>();
    private final ObjectMapper objectMapper = new ObjectMapper();
    private ChatService chatService = new ChatService();
	private PostService postService = new PostService();

    @OnOpen
    public void onOpen(Session session, @PathParam("post_Id") int postId, @PathParam("nickname") String nickname) { 
        session.getUserProperties().put("nickname", nickname);
        List<Session> clients = clientsByPostId.computeIfAbsent(postId, k -> new ArrayList<>());
        clients.add(session);
        Post post = postService.getPostById(postId);
        int writeuser_id = post.getWriteUser_Id();
        UserService userS = new UserService();
        int guestuser_id = userS.getUserIdByNickName(nickname); 
        Conversations conversations = new Conversations(postId, writeuser_id, guestuser_id);
        Conversations isCon = chatService.getGIdByGId(guestuser_id, postId);
        System.out.println(isCon);
        if (isCon == null) {
        	chatService.insertChatroom(conversations);
        }
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("post_Id") int postId) throws Exception {
        System.out.println("메시지 전송: " + session.getId() + ": " + message);

        JsonNode jsonMessage = objectMapper.readTree(message);
        System.out.println(jsonMessage+"jhjijikjik");
        String senderNickname = (String) session.getUserProperties().get("nickname");
        UserService userService = new UserService();
        int userId = userService.getUserIdByNickName(senderNickname);
        String content = jsonMessage.get("content").asText();
        
        JsonNode isWhisperNode = jsonMessage.get("isWhisper");
        if (isWhisperNode != null && isWhisperNode.isBoolean() && isWhisperNode.asBoolean()) {
            System.out.println("귓속말 테스트");
        }
        // 현재 시간 구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        // 데이터베이스에 채팅 메시지 저장
        saveChatMessage(userId, content, postId, timestamp, isWhisperNode);
        
        // 모든 클라이언트에게 메시지 전송
        broadcastMessage(senderNickname, content, timestamp, postId);
    }

    @OnClose
    public void onClose(Session session, @PathParam("post_Id") Integer postId) {
        List<Session> clients = clientsByPostId.get(postId);
        if (clients != null) {
            clients.remove(session);
        }
        System.out.println("웹소켓 종료: " + session.getId());
    }
    
    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }

    // 모든 채팅 메시지를 데이터베이스에 저장하는 메서드
    private void saveChatMessage(int userId, String content, int postId, Timestamp timestamp, JsonNode isWhisperNode) throws SQLException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestampString = dateFormat.format(timestamp);

        if (isWhisperNode != null && isWhisperNode.isBoolean() && isWhisperNode.asBoolean()) {
            PrivateMessage priMessage = new PrivateMessage(userId, postId, content, timestampString);
            chatService.insertPrivateMessage(priMessage);
        }
        Message message = new Message(postId, userId, content, timestampString);
            
        chatService.insertMessage(message);
    }

    

    // 모든 클라이언트에게 채팅 메시지를 전송하는 메서드
    private void broadcastMessage(String senderNickname, String content, Timestamp timestamp, Integer postId) throws IOException {
        // clientsByPostId에서 해당 게시판의 클라이언트 리스트를 가져옵니다.
        List<Session> clients = clientsByPostId.get(postId);
        if (clients != null) {
            // 메시지를 JSON 형식으로 생성
            JsonNode messageJson = objectMapper.createObjectNode()
                    .put("messageType", "normal")
                    .put("sender", senderNickname)
                    .put("content", content)
                    .put("timestamp", timestamp.toString()); // 시간을 문자열로 변환하여 전송
            String jsonMessage = objectMapper.writeValueAsString(messageJson);

            // 모든 클라이언트에게 메시지를 전송합니다.
            for (Session client : clients) {
                client.getBasicRemote().sendText(jsonMessage);
            }
        }
    }
}
