package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 현재 세션을 가져옴
        HttpSession session = request.getSession(false);
        
        // 세션이 존재하면 세션을 무효화하고 인덱스 페이지로 이동
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }

        response.sendRedirect(request.getContextPath() + "/index.jsp"); // 인덱스 페이지로 이동
    }
}
