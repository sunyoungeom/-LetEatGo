package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class ServletUtil {
	private static JsonMapper mapper = new JsonMapper();

	public static void sendNotFound(HttpServletResponse resp) throws IOException {
		resp.setStatus(404);
		resp.setContentType("application/json; charset=utf-8");

		ObjectNode objectNode = mapper.createObjectNode();
		objectNode.put("code", 404);
		objectNode.put("message", "NOT FOUNT");

		sendJsonBody(objectNode.toString(), resp);
	}

	public static String readBody(HttpServletRequest req) throws IOException {
		StringBuilder sb = new StringBuilder();
		try (BufferedReader reader = req.getReader();) {
			String line;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		}
		return sb.toString();
	}

	public static void sendJsonBody(Object obj, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json; charset=utf-8");
		ObjectMapper mapper = new ObjectMapper();
		PrintWriter writer = resp.getWriter();
		mapper.writeValue(writer, obj);
		writer.flush();
	}

	public static int calculateAgeFromIdentifyNumber(String identifyNumber) {
		if (identifyNumber == null || identifyNumber.length() < 7) {
			throw new IllegalArgumentException("Identify number must be at least 7 characters long.");
		}

		// 주민번호에서 생년월일 정보 추출
		int birthYear = Integer.parseInt(identifyNumber.substring(0, 2));
		int birthMonth = Integer.parseInt(identifyNumber.substring(2, 4)) - 1; // Calendar month는 0에서 시작
		int birthDay = Integer.parseInt(identifyNumber.substring(4, 6));
		int genderDigit = Integer.parseInt(identifyNumber.substring(6, 7));

		// 1900년대 또는 2000년대 생으로 구분
		if (genderDigit == 1 || genderDigit == 2) {
			birthYear += 1900;
		} else if (genderDigit == 3 || genderDigit == 4) {
			birthYear += 2000;
		} else {
			throw new IllegalArgumentException("Invalid gender digit.");
		}

		// 현재 날짜와 생일 비교하여 만 나이 계산
		Calendar today = Calendar.getInstance();
		Calendar birthDate = Calendar.getInstance();
		birthDate.set(birthYear, birthMonth, birthDay);

		int age = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);

		if (today.get(Calendar.DAY_OF_YEAR) < birthDate.get(Calendar.DAY_OF_YEAR)) {
			age--; // 생일이 지나지 않았으면 나이에서 1 빼기
		}

		return age;
	}
}
