package User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idInquiry.do")
public class UserIdSearchServlet extends HttpServlet {
//	private UserService service = new UserService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String job = req.getParameter("job");
		String path = null;
		
		if (job.equals("idSearch")) {
			path = "/userIdSearch.jsp";
		} else if (job.equals("pwSearch")) {
			path = "/userPwSearch.jsp";
		} else if (job.equals("update")) {
			path = "/userUpdate.jsp";
		} else if (job.equals("delete")) {
			path = "/userDelete.jsp";
		}
		
		if (id.isEmpty()) {
			req.setAttribute("error", "ID를 입력하세요.");
			HttpUtil.forward(req, resp, path);
			return;
		}
		
		// service
		// 유저 반환
		
		User u = new User();
		if (u == null) {
			req.setAttribute("result", "검색된 정보가 없습니다.");
		}
		req.setAttribute("user", u);
		if (job.equals("idSearch")) {
			path = "userIdSearchOutput.jsp";
			HttpUtil.forward(req, resp, path);
		}

	}
	

}
