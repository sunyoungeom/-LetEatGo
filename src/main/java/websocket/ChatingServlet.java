package websocket;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatingServer")
public class ChatingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 서블릿이 처리할 로직을 작성합니다.
        request.getRequestDispatcher("/WEB-INF/WebSocket/MultiChatMain.jsp").forward(request, response);
    }
}
