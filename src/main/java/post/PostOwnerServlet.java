package post;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import listener.MyWebContextListener;
import user.UserService;
import util.ServletUtil;
import websocket.ChatServer;
import websocket.ChatService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

@WebServlet("/post/close/*")
public class PostOwnerServlet extends HttpServlet {
    private final UserService userService = new UserService();
    private final ObjectMapper objectMapper = new ObjectMapper();
    private PostService postService = new PostService();
    private ChatService chatService = new ChatService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 요청 파라미터에서 postId와 userId를 가져옵니다.
        int postId = Integer.parseInt(req.getParameter("postId"));
        int userId = Integer.parseInt(req.getParameter("userId"));

        // 작성자 여부를 확인합니다.
        boolean isOwner = userService.isPostOwner(postId, userId);

        // 결과를 JSON 형식으로 반환합니다.
        resp.setContentType("application/json");
        objectMapper.writeValue(resp.getWriter(), isOwner);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 요청 파라미터에서 postId와 userId를 가져옵니다.
    	// doPost 메서드 안에서의 코드
    	ObjectMapper objectMapper = new ObjectMapper();

    	// 요청 본문을 읽어옴
    	String requestBody = ServletUtil.readBody(req);
    	System.out.println(requestBody);
    	// JSON 문자열을 JsonNode로 파싱
    	JsonNode jsonNode = objectMapper.readTree(requestBody);

    	// JsonNode에서 postId와 userId 추출
    	String postIdStr = jsonNode.get("postId").asText();
    	String userIdStr = jsonNode.get("userId").asText();
        System.out.println(postIdStr);
        System.out.println(userIdStr);
        if (postIdStr == null || userIdStr == null) {
            // postId나 userId가 null인 경우에는 적절한 오류 응답을 보내고 메서드를 종료합니다.
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        int postId = Integer.parseInt(postIdStr);
        int userId = Integer.parseInt(userIdStr);

        boolean isClosed = closePost(postId, userId);

        // 결과를 JSON 형식으로 반환합니다.
        resp.setContentType("application/json");
        objectMapper.writeValue(resp.getWriter(), isClosed);
    }

    
    private boolean closePost(int postId, int userId) {
        // 게시물의 작성자 여부를 확인합니다.
        boolean isOwner = userService.isPostOwner(postId, userId);
        
        // 게시물을 닫습니다.
        if (isOwner) {
            try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
                PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
                
                int rowsAffected = postService.updatePostStatus(postId);
                int rowsAffected2 = chatService.updateconversationsStatus(postId);
                System.out.println("1로 변경됨");
                // 업데이트된 행의 수가 1 이상이면 성공으로 간주합니다.
                return rowsAffected > 0;
            } catch (Exception e) {
                e.printStackTrace();
                return false; // 업데이트 도중 예외가 발생하면 실패로 처리합니다.
            }
        } else {
            System.out.println("어림도없지");
            // 사용자가 게시물의 작성자가 아니라면 게시물을 닫을 수 없음을 반환합니다.
            return false;
        }
    }
}
