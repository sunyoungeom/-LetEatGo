package myinfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import user.User;
import user.UserService;
import util.ServletUtil;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/myInfo")
public class myInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// menuMain.jsp 파일을 클라이언트로 보냄

		String detail = req.getParameter("detail");

		if (detail != null) {
			if (detail.equals("profile")) {
				// 사용자 세션에서 주민번호 가져오기
				System.out.println("fsdfsdfsdfsd");
				HttpSession session = req.getSession();
				User user = (User) session.getAttribute("user"); // User 객체는 세션에 저장된 사용자 정보를 가정
				String identifyNumber = user.getIdentifynumber(); // 사용자의 주민번호

				// 만 나이 계산
				int age = ServletUtil.calculateAgeFromIdentifyNumber(identifyNumber);

				// 나이를 요청 속성으로 추가
				req.setAttribute("age", age);
				req.getRequestDispatcher("/WEB-INF/myinfo/myInfo.jsp").forward(req, resp);
			} else if (detail.equals("post")) {
				req.getRequestDispatcher("/WEB-INF/myinfo/MyPost.jsp").forward(req, resp);

			} else if (detail.equals("comment")) {
				req.getRequestDispatcher("/WEB-INF/myinfo/Mycomment.jsp").forward(req, resp);
			}

			else {
				// 처리할 액션이 없는 경우 예외 처리
				resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter value");
			}
		} else {
			// 액션 파라미터가 전달되지 않은 경우 예외 처리
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter");
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String body = ServletUtil.readBody(req);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = mapper.readTree(body);

		String field = jsonNode.get("field").asText();
		String value = jsonNode.get("value").asText();

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		User isDuplicate = null;

		UserService userService = new UserService();

		// 필드 값에 따라 적절한 서비스 함수 호출
		switch (field) {
		case "password":
			if(user.getPassword().equals(jsonNode.get("currentPassword").asText())) {
				userService.updatePassword(user.getId(), value);
				user.setPassword(value);
			}  else {
                // 비밀번호가 일치하지 않을 때 에러 처리
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = resp.getWriter();
                out.print("{\"status\": \"error\", \"message\": \"현재 비밀번호가 올비르지 않습니다.\"}");
                out.flush();
                return;
            }
			break;
		case "nickname":
			isDuplicate = userService.getNicknameByNickname(value);
			if (!checkDuplicate(isDuplicate, resp)) {
				return;
			}
			userService.updateNickname(user.getId(), value);
			user.setNickname(value);
			break;
		case "phonenumber":
			isDuplicate = userService.getPhoneNumberByPhoneNumber(value);
			if (!checkDuplicate(isDuplicate, resp)) {
				return;
			}
			userService.updatePhonenumber(user.getId(), value);
			user.setPhonenumber(value);
			break;
		case "email":
			isDuplicate = userService.getEmailByEmail(value);
			if (!checkDuplicate(isDuplicate, resp)) {
				return;
			}
			userService.updateEmail(user.getId(), value);
			user.setEmail(value);
			break;
		case "address":
			userService.updateAddress(user.getId(), value);
			user.setAddress(value);
			break;
		case "bloodtype":
			userService.updateBloodtype(user.getId(), value);
			user.setBloodtype(value);
			break;
		case "mbti":
			userService.updateMBTI(user.getId(), value);
			user.setMbti(value);
			break;
		default:
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid field parameter");
			return;
		}

		// 수정된 User 객체를 다시 세션에 저장
		session.setAttribute("user", user);

		// 클라이언트 측으로 완료 메시지를 JSON 형식으로 전달
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("{\"status\": \"success\"}");
		out.flush();
	}

	private boolean checkDuplicate(User isDuplicate, HttpServletResponse resp) throws IOException {
		if (isDuplicate != null) {
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write("{\"message\": \"duplicate\"}");
			return false;
		}
		return true;
	}
}