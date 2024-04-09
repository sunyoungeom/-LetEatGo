package websocket;

import java.io.IOException;
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

import user.User;

@ServerEndpoint("/ChatingServer/{post_Id}/{nickname}") // 포스트 ID와 닉네임을 엔드포인트에 포함시킵니다.
public class ChatServer {
    private static final Map<Integer, List<Session>> clientsByPostId = new HashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("post_Id") Integer postId, @PathParam("nickname") String nickname) { 
        // WebSocket 연결 시 사용자 정보를 세션 속성에 저장합니다.
        session.getUserProperties().put("nickname", nickname);
        List<Session> clients = clientsByPostId.computeIfAbsent(postId, k -> new ArrayList<>());
        clients.add(session);
        System.out.println("웹소켓 연결: " + session.getId() + " (유저 닉네임: " + nickname + ")");
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("post_Id") Integer postId) throws IOException {
        System.out.println("메시지 전송: " + session.getId() + ": " + message); // 받은 메시지 콘솔 출력
        String[] parts = message.split(" ", 3);
        if (parts.length >= 3 && (parts[0].equals("/w") || parts[0].equals("/ㅈ") || parts[0].equals("/W"))) {
            String receiverId = parts[1];
            String whisperContent = parts[2];
            List<Session> clients = clientsByPostId.get(postId);
            if (clients != null) {
                for (Session client : clients) {
                    String nickname = (String) client.getUserProperties().get("nickname");
                    if (nickname.equals(receiverId)) {
                        client.getBasicRemote().sendText("[귓속말] " + session.getUserProperties().get("nickname") + ": " + whisperContent);
                        session.getBasicRemote().sendText("[귓속말] " + session.getUserProperties().get("nickname") + " -> " + receiverId + ": " + whisperContent);
                        return;
                    }
                }
                session.getBasicRemote().sendText("귓속말 대상을 찾지 못했습니다: " + receiverId);
            }
        } else {
            List<Session> clients = clientsByPostId.get(postId);
            if (clients != null) {
                for (Session client : clients) {
                    if (!client.equals(session)) {
                        client.getBasicRemote().sendText(message);
                    }
                }
            }
        }
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
}
