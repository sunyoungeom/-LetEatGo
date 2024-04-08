package websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import user.User;

@ServerEndpoint("/ChatingServer")   
public class ChatServer extends HttpServlet {
    private Map<String, Session> clients = new HashMap<>();
    private User user;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        user = (User) request.getSession().getAttribute("user");
        request.getRequestDispatcher("/WEB-INF/WebSocket/ChatWindow.jsp").forward(request, response);
    }
    
    
    @OnOpen // 클라이언트 접속 시 실행
    public void onOpen(Session session) {
        clients.put(session.getId(), session); // 세션 추가;
        Map<String, Object> userProperties = session.getUserProperties();
        if (user != null) {
            userProperties.put("nickname", user.getNickname());
        }
        System.out.println("웹소켓 연결:" + session.getId());
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println("메시지 전송 : " + session.getId() + ":" + message); // 받은 메시지 콘솔 출력
        String[] parts = message.split(" ", 3);
        if (parts.length >= 3 && (parts[0].equals("/w") || parts[0].equals("/ㅈ") || parts[0].equals("/W"))) {
            String receiverId = parts[1];
            String whisperContent = parts[2];
            synchronized (clients) {
                for (Session c : clients.values()) {
                    String nickname = (String) c.getUserProperties().get(user.getNickname());
                    System.out.println("수신된 nickname: " + nickname); // 클라이언트의 chatId 콘솔 출력
                    if (nickname.equals(receiverId)) {
                        // 귓속말을 받을 대상에게 메시지 전송
                        c.getBasicRemote().sendText("[귓속말] " + session.getUserProperties().get(user.getNickname()) + ": " + whisperContent);
                        // 메시지를 보낸 사람에게도 본인이 보낸 메시지로 전송
                        session.getBasicRemote().sendText("[귓속말] " + session.getUserProperties().get(user.getNickname()) + " -> " + receiverId + ": " + whisperContent);
                        return; // 귓속말을 받을 대상을 찾았으면 더 이상 반복할 필요가 없으므로 종료
                    }
                }
                // 귓속말을 받을 대상을 찾지 못한 경우 알림 전송
                session.getBasicRemote().sendText("귓속말 대상을 찾지 못했습니다: " + receiverId);
            }
        } else {
            // 일반 메시지 처리 로직
            synchronized (clients) {
                for (Session c : clients.values()) {
                    if (!c.equals(session)) {
                        c.getBasicRemote().sendText(message);
                    }
                }
            }
        }
    }


    @OnClose // 클라이언트와의 연결이 끊기면 실행
    public void onClose(Session session) {
        clients.remove(session.getId());
        System.out.println("웹소켓 종료 : " + session.getId());
    }
    
    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }   
}
