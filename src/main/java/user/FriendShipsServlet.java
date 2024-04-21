import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/add_friend")
public class FriendShipsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트로부터 받은 JSON 데이터를 읽기
    	UserService service = new UserService();
        String requestData = request.getReader().lines()
                                      .reduce("", (accumulator, actual) -> accumulator + actual);

        // JSON 데이터 파싱
        JSONObject jsonRequest = new JSONObject(requestData);
        String userId = jsonRequest.getString("userId");
        String action = jsonRequest.getString("action");

        // action이 "add_friend"인 경우에만 처리
        if (action.equals("add_friend")) {
            // 친구 추가 처리 로직을 구현합니다. 예를 들어 데이터베이스에 추가하는 등의 작업을 수행합니다.
        	service.insertFriendships(userId, );
            // 응답 전송
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println("{\"status\": \"success\", \"message\": \"친구 추가가 성공적으로 처리되었습니다.\"}");
        } else {
            // 잘못된 요청에 대한 응답 전송
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println("{\"status\": \"error\", \"message\": \"잘못된 요청입니다.\"}");
        }
    }
}
