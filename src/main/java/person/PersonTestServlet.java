package person;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserService;

@WebServlet("/persontest")
public class PersonTestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 Object attribute = req.getSession().getAttribute("user");
         User user = (User) attribute;
         int user_id = user.getUser_id();
         UserService service = new UserService();
         String userAddress = service.getUserAddress(user_id);
         userAddress = userAddress.replaceAll("\\([^\\(]*\\)", "").trim();
         resp.getWriter().write(userAddress);
         req.getRequestDispatcher("/WEB-INF/map/maplogic.jsp").forward(req, resp);
		
	}
		
	
}
