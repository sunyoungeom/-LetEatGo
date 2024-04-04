package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join/end")
public class UserJoinEndServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 로그인한 사용자의 아이디 가져오기
        String userId = (String) request.getSession().getAttribute("id");
        
        // userJoinResult.jsp로 아이디 전달
        request.setAttribute("id", userId);
        request.getRequestDispatcher("/WEB-INF/user/userJoinResult.jsp").forward(request, response);
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doPost()에서도 doGet()을 호출하여 코드의 중복을 피합니다.
        doGet(request, response);
    }
}
