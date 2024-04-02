//package user;
//
//import java.io.IOException;
//import java.util.Map.Entry;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.fasterxml.jackson.databind.json.JsonMapper;
//import com.fasterxml.jackson.databind.node.ObjectNode;
//
//import util.ServletUtil;
//
//@WebServlet("/usererror")
//public class UserErrorServlet extends HttpServlet {
//	private JsonMapper mapper = new JsonMapper();
//
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		UserAPIException e = (UserAPIException) req.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
//		
//		resp.setStatus(e.getCode());
//		ObjectNode obj = mapper.createObjectNode();
//		obj.put("message", e.getMessage());
//		
//		if (e.getMessage() != null) {
//			for (Entry<String, String> entry : e.getErrors().entrySet()) {
//				obj.put(entry.getKey(), entry.getValue());
//			}
//		}
//		
//		ServletUtil.sendJsonBody(obj.toString(), resp);
//	}
//	
//	
//}
