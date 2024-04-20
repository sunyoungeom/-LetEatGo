package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import user.User;
import util.SendEmail;
import util.ServletUtil;

@WebServlet({"/join/begin", "/join/food"})
public class UserJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
	private UserValidator validator = new UserValidator();
	private ObjectMapper objectMapper = new ObjectMapper();
	private Food food = new Food();
	private Hobby hobby = new Hobby();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/user/userJoin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("checkDuplicate".equals(action)) {
			// 중복 확인 로직
			checkDuplicate(request, response);
		} else if ("sendVerification".equals(action)) {
			// 이메일 인증 코드 발송 요청 처리
			String email = request.getParameter("email");
			User isDuplicate = service.getEmailByEmail(email);

			if (isDuplicate != null) {
				// 이메일이 이미 사용 중인 경우
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("{\"status\":\"duplicate\"}");
			} else {
				// 이메일 전송 로직
				sendVerificationCode(email, request, response);
			}
		} else if ("checkVerificationCode".equals(action)) {
			String body = ServletUtil.readBody(request);
			System.out.println(body);
			ObjectMapper mapper = new ObjectMapper();
			JsonNode jsonNode = mapper.readTree(body);

			int inputVerificationCode = jsonNode.get("verificationCode").asInt();
			int verificationCode = Integer.valueOf((String) request.getSession().getAttribute("verificationCode"));
			System.out.println(inputVerificationCode);
			System.out.println(verificationCode);

			if (inputVerificationCode == verificationCode) {
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("success");
			} else {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write("failed");
			}
		} else {

			try {
				// 전송된 데이터 확인
				String body = ServletUtil.readBody(request);
				System.out.println("전송된 데이터: " + body);

				// 데이터를 User 객체로 변환
				User user = objectMapper.readValue(body, User.class);

				// 유효성 검사
				Map<String, String> errors = validator.validate(user);
				if (!errors.isEmpty()) {
					// 클라이언트로 오류 메시지 전송
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request

					objectMapper.writeValue(response.getWriter(), errors);
//					System.out.println("유효성 오류: " + errors);
					return;
				}

				// 유효성 검사를 통과한 경우 회원가입 처리
				int result = service.insert(user);
				service.insertFood(service.getUserId(user.getId()), user.getFoodCategory());
				
				// doPost 메서드 내에서
				
				// JSON 데이터에서 음식 관련 정보를 가져옴
//				JsonNode foodNode = jsonNode.get("foodCategory");
				// Food 객체 생성 및 초기화
//				Food food = new Food();
				// 예시: JSON 데이터에 "category" 키가 있다고 가정
				
//				service.insertHobby(hobby, user.getUser_id());
				if (result == 1) {
					response.setStatus(HttpServletResponse.SC_CREATED); // 201 Created
					response.getWriter().println("회원가입이 완료되었습니다.");
					String id = user.getId(); // 여기서 user는 회원가입이 완료된 사용자 객체라 가정합니다.
					request.getSession().setAttribute("id", id); // id를 세션에 설정
					// 유저가 있을때만 페이지 없으면 404?
					request.getRequestDispatcher("/WEB-INF/user/userJoinResult.jsp").forward(request, response);
				}
			} catch (IOException e) {
				// 예외 처리
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
				response.getWriter().println("서버 오류가 발생했습니다.");
			}
		}
	}

	private void sendVerificationCode(String email, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		User user = new User();
		user.setEmail(email);
		System.out.println(email + " check");

		// 이메일 전송
		SendEmail emailSender = new SendEmail();
		String verificationCode = emailSender.getRandom(); // 랜덤 코드 생성

		// 세션에 랜덤 코드 저장
		HttpSession session = request.getSession();
		session.setAttribute("verificationCode", verificationCode);

		// 인증 코드를 메일로 발송
		boolean isEmailSent = emailSender.sendEmail(user, verificationCode);

		if (isEmailSent) {
			// 클라이언트에게 성공 응답 전송
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("{\"status\":\"success\"}");
		} else {
			// 클라이언트에게 실패 응답 전송
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("{\"status\":\"failed\"}");
		}
	}

	private void checkDuplicate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String field = request.getParameter("field");
		String value = request.getParameter("value");
		User isDuplicate = null;

		switch (field) {
		case "id":
			isDuplicate = service.getIdById(value);
			break;
		case "email":
			isDuplicate = service.getEmailByEmail(value);
			break;
		case "nickname":
			isDuplicate = service.getNicknameByNickname(value);
			break;
		case "phonenumber":
			isDuplicate = service.getPhoneNumberByPhoneNumber(value);
			break;
		default:
			break;
		}

		if (isDuplicate != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"status\":\"duplicate\"}");

		} else {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"status\":\"unique\"}");
		}
	}
}