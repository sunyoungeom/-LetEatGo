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

import java.sql.Timestamp;
import java.util.Date;
import user.UserService;

@ServerEndpoint("/ChatingServer/{post_Id}/{nickname}")
public class ChatServer {
    private static final Map<Integer, List<Session>> clientsByPostId = new HashMap<>();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @OnOpen
    public void onOpen(Session session, @PathParam("post_Id") Integer postId, @PathParam("nickname") String nickname) { 
        session.getUserProperties().put("nickname", nickname);
        List<Session> clients = clientsByPostId.computeIfAbsent(postId, k -> new ArrayList<>());
        clients.add(session);
        System.out.println("웹소켓 연결: " + session.getId() + " (유저 닉네임: " + nickname + ")");
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("post_Id") Integer postId) throws Exception {
        System.out.println("메시지 전송: " + session.getId() + ": " + message);

        JsonNode jsonMessage = objectMapper.readTree(message);
        String senderNickname = (String) session.getUserProperties().get("nickname");
        UserService userService = new UserService();
        int userId = userService.getUserIdByNickName(senderNickname);
        String content = jsonMessage.get("content").asText();

        // 현재 시간 구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        // 데이터베이스에 채팅 메시지 저장
        saveChatMessage(userId, content, postId, timestamp);

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

    // 채팅 메시지를 데이터베이스에 저장하는 메서드
    private void saveChatMessage(int userId, String content, Integer postId, Timestamp timestamp) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = MyWebContextListener.getConnection(); // 데이터베이스 연결
            String query = "INSERT INTO messages (conversation_id, sender_id, content, sent_at) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            stmt.setString(3, content);
            stmt.setTimestamp(4, timestamp);
            stmt.executeUpdate();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
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

    // 데이터베이스 연결을 설정하는 메서드
//    private Connection getConnection() throws SQLException {
//        // 데이터베이스 연결 정보 설정 (이 부분은 실제 환경에 맞게 설정되어야 합니다)
//        String url = "jdbc:mysql://192.168.0.107:3306/board";
//        String username = "team1";
//        String password = "root";
//        return DriverManager.getConnection(url, username, password);
//    }
}
