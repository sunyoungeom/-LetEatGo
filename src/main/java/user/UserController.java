package user;

import java.io.IOException;
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

        if (action != null) {
            try {
                String body = ServletUtil.readBody(request);
                User user = objectMapper.readValue(body, User.class);

                // 유효성 검사
                Map<String, String> errors = validator.validate(user);
                if (!errors.isEmpty()) {
                	 request.setAttribute("errors", errors);
                	    request.getRequestDispatcher("user?action=register").forward(request, response);
                	    return;
//                    response.setContentType("application/json");
//                    response.setCharacterEncoding("UTF-8");
//                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
//
//                    String errorsJson = objectMapper.writeValueAsString(errors);
//                    response.getWriter().write(errorsJson);
//                   System.out.println("유효성검사 내부");
//                  System.out.println(errors);
//                    return;
                }

                // 유효성 검사를 통과한 경우 회원가입 처리
                int result = service.insert(user);
                if (result == 1) {
                    response.setStatus(HttpServletResponse.SC_CREATED); // 201 Created
                    response.getWriter().println("회원가입이 완료되었습니다.");
                }
            } catch (IOException e) {
            	
            }
//            } catch (UserAPIException e) {
//                // 클라이언트로 오류 메시지를 전달
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.setStatus(e.getCode());
//
//                // 오류 메시지를 JSON 형식으로 전송
//                objectMapper.writeValue(response.getWriter(), e.getErrors());
            
        } else if ("update".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userUpdate.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/user/userDelete.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }
}
