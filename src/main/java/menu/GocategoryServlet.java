package menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserService;

@WebServlet({"/menu/han","/menu/jung","/menu/il"})
public class GocategoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String requestURI = req.getRequestURI();
		 if (requestURI.endsWith("/menu/han")) {
			 forwardToSearchMenujsp(req, resp, "한식", "userAddress");
		 }else if(requestURI.endsWith("/menu/jung")) {
			 forwardToSearchMenujsp(req, resp, "중식", "userAddress");
		 }else if(requestURI.endsWith("/menu/il")) {
			 forwardToSearchMenujsp(req, resp, "양식", "userAddress");
		 }
	}
	private void forwardToSearchMenujsp(HttpServletRequest req, HttpServletResponse resp, String category , String userAd) throws ServletException, IOException {
	    // 사용자 정보 가져오기
	    Object attribute = req.getSession().getAttribute("user");
	    User user = (User) attribute;
	    int user_id = user.getUser_id();
	    UserService service = new UserService();
	    String userAddress = service.getUserAddress(user_id);
	    userAddress = userAddress.replaceAll("\\([^\\(]*\\)", "").trim();

	    // 파라미터 값을 설정합니다
	    req.setAttribute("category", category);
	    req.setAttribute("userAddress", userAddress); // 사용자 주소를 파라미터로 설정

	    // RequestDispatcher를 사용하여 요청을 포워딩합니다
	    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/menu/searchMenujsp.jsp");
	    dispatcher.forward(req, resp);
	}
	
}
