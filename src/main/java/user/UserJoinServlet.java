package user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import user.User;
import util.ServletUtil;

@WebServlet("/join/begin")
public class UserJoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService service = new UserService();
    private UserValidator validator = new UserValidator();
    private ObjectMapper objectMapper = new ObjectMapper();
    
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.getRequestDispatcher("/WEB-INF/user/userJoin.jsp").forward(req, resp);
	}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
//     // 중복 확인 요청 처리
        if ("checkDuplicate".equals(action)) {
            String field = request.getParameter("field");
            String value = request.getParameter("value");
            User isDuplicate = null;
           System.out.println(field);
            
           switch(field) {
           case "id":
               isDuplicate = service.getIdById(value);
               break;
           case "email":
               isDuplicate = service.getEmailByEmail(value);
              System.out.println(value);
               break;
           case "nickname":
               isDuplicate = service.getNicknameByNickname(value);
               break;
           case "phonenumber":
               isDuplicate = service.getPhoneNumberByPhoneNumber(value);
               break;
           default:
               break;
       }
       
       if (isDuplicate != null) {
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");
           response.getWriter().write("duplicate");
       } 
            
//            // 결과를 JSON 형태로 클라이언트에 전달
//            Map<String, Object> result = new HashMap<>();
//            result.put("result", isDuplicate);
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            System.out.println(result.toString());
//            objectMapper.writeValue(response.getWriter(), result);
        } else {

            try {
            	 // 전송된 데이터 확인
                String body = ServletUtil.readBody(request);
                System.out.println("전송된 데이터: " + body);

                // 데이터를 User 객체로 변환
                User user = objectMapper.readValue(body, User.class);

                // 유효성 검사
                Map<String, String> errors = validator.validate(user);
                if (!errors.isEmpty()) {
                    // 클라이언트로 오류 메시지 전송
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request

                    objectMapper.writeValue(response.getWriter(), errors);
                    System.out.println("유효성 오류: " + errors);
                    return;
                }

                // 유효성 검사를 통과한 경우 회원가입 처리
                int result = service.insert(user);
                if (result == 1) {
                    response.setStatus(HttpServletResponse.SC_CREATED); // 201 Created
                    response.getWriter().println("회원가입이 완료되었습니다.");
                    String id = user.getId(); // 여기서 user는 회원가입이 완료된 사용자 객체라 가정합니다.
                    request.getSession().setAttribute("id", id); // id를 세션에 설정
                    // 유저가 있을때만 페이지 없으면 404?
                    request.getRequestDispatcher("/WEB-INF/user/userJoinResult.jsp").forward(request, response);
                }
            } catch (IOException e) {
                // 예외 처리
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
                response.getWriter().println("서버 오류가 발생했습니다.");
            }
    }
}
}