package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;



@ServerEndpoint("/ChatingServer")	
public class ChatServer {
	private static Set<Session> clients 
		= Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen // 클라이언트 접속 시 실행
	public void onOpen(Session session) {
//		System.out.println(session.getRequestParameterMap());
		clients.add(session); // 세션 추가
		Map<String, Object> userProperties = session.getUserProperties();
		userProperties.put("chatId", session.getRequestParameterMap().get("chatId"));
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
	            for (Session c : clients) {
	                String chatId = (String) c.getUserProperties().get("chatId");
	                System.out.println("수신된 chatId: " + chatId); // 클라이언트의 chatId 콘솔 출력
	                if (chatId.equals(receiverId)) {
	                    // 귓속말을 받을 대상에게 메시지 전송
	                    c.getBasicRemote().sendText("[귓속말] " + session.getUserProperties().get("chatId") + ": " + whisperContent);
	                    // 메시지를 보낸 사람에게도 본인이 보낸 메시지로 전송
	                    session.getBasicRemote().sendText("[귓속말] " + session.getUserProperties().get("chatId") + " -> " + receiverId + ": " + whisperContent);
	                    return; // 귓속말을 받을 대상을 찾았으면 더 이상 반복할 필요가 없으므로 종료
	                }
	            }
	            // 귓속말을 받을 대상을 찾지 못한 경우 알림 전송
	            session.getBasicRemote().sendText("귓속말 대상을 찾지 못했습니다: " + receiverId);
	        }
	    } else {
	        // 일반 메시지 처리 로직
	        synchronized (clients) {
	            for (Session c : clients) {
	                if (!c.equals(session)) {
	                    c.getBasicRemote().sendText(message);
	                }
	            }
	        }
	    }
	}


	@OnClose // 클라이언트와의 연결이 끊기면 실행
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
	
	
}