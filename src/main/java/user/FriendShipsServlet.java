package user;
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
    	
    	Object attribute = request.getSession().getAttribute("user");
		User user = (User) attribute;
		int user_id_Send = user.getUser_id();
		
        // 클라이언트로부터 받은 JSON 데이터를 읽기
    	UserService service = new UserService();
        String requestData = request.getReader().lines()
                                      .reduce("", (accumulator, actual) -> accumulator + actual);

        // JSON 데이터 파싱
        JSONObject jsonRequest = new JSONObject(requestData);
        String user_id_Recieve = jsonRequest.getString("userId");
       
        int recieve_id = Integer.parseInt(user_id_Recieve);
        System.out.println(recieve_id);
        service.insertFriendships(user_id_Send, recieve_id);
    }
}
