package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // 세션이 존재하면 알림창을 띄우고 인덱스 페이지로 이동
        if (session != null) {
            session.invalidate();
            
            // 쿠키 삭제
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
            
            String message = "로그아웃 되었습니다.";
            String script = "<script>alert('" + message + "');window.location.href='" + request.getContextPath() + "/index.jsp';</script>";
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(script);
        } else {
            // 세션이 존재하지 않으면 인덱스 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}
