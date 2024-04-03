package user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import util.ServletUtil;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private UserService service = new UserService();
    private UserValidator validator = new UserValidator();
    private ObjectMapper objectMapper = new ObjectMapper();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userJoin.jsp").forward(request, response);
        } else if ("update".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userUpdate.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userDelete.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
     // 중복 확인 요청 처리
        if ("checkDuplicate".equals(action)) {
            String field = request.getParameter("field");
            String value = request.getParameter("value");
            User isDuplicate = null;
            
            // 필드와 값에 따라 중복 검사를 수행하는 로직을 추가하세요.
            // 예를 들어, 아이디 중복 검사라면:
            if ("id".equals(field)) {
                isDuplicate = service.getIdById(value);
            }
            
            // 결과를 JSON 형태로 클라이언트에 전달
            Map<String, Object> result = new HashMap<>();
            result.put("result", isDuplicate);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            System.out.println(result.toString());
            objectMapper.writeValue(response.getWriter(), result);
        }

        if (action != null) {
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
                }
            } catch (IOException e) {
                // 예외 처리
                e.printStackTrace();
            }
        } else if ("update".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userUpdate.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userDelete.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }
}
