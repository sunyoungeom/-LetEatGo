package user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;

@WebServlet("/userJoin.do")
public class UserJoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        // 폼에서 입력받은 데이터 추출
        String id = req.getParameter("id");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String nickname = req.getParameter("nickname");
        String mbti = req.getParameter("mbti");
        String bloodtype = req.getParameter("bloodtype");
        String identifynumber = req.getParameter("identifynumber");
        String phoneNumber = req.getParameter("phoneNumber");
        
        
        if (id.isEmpty() || email.isEmpty() || password.isEmpty() || name.isEmpty() || nickname.isEmpty() || identifynumber.isEmpty() || phoneNumber.isEmpty()) {
        	req.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다.");
        	HttpUtil.forward(req, resp, "userJoin.jsp");
        	
        	return;
        }
        
        // 회원 객체 생성
//        User user = new User(id, email, password, 
//                             new Timestamp(System.currentTimeMillis()), 
//                             null, name, nickname, mbti, bloodtype, identifynumber, phoneNumber);
        
        // 여기서는 데이터베이스에 저장하지 않고, 간단히 결과를 출력합니다.
        /*
         * 
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>회원가입 정보</h1>");
        out.println("<p>ID: " + user.getId() + "</p>");
        out.println("<p>Email: " + user.getEmail() + "</p>");
        out.println("<p>이름: " + user.getName() + "</p>");
        out.println("<p>닉네임: " + user.getNickname() + "</p>");
        out.println("<p>MBTI: " + user.getMbti() + "</p>");
        out.println("<p>혈액형: " + user.getBloodtype() + "</p>");
        out.println("<p>주민등록번호: " + user.getIdentifynumber() + "</p>");
        out.println("<p>전화번호: " + user.getPhoneNumber() + "</p>");
        out.println("</body></html>");
        
         */
        
        
        req.setAttribute("id", id);
        HttpUtil.forward(req, resp, "userJoinResult.jsp");
    }
}
