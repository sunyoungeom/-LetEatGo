package error;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ErrorServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processError(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processError(req, resp);
	}

	private void processError(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer statusCode = (Integer) req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		String errorMessage = "";

		switch (statusCode) {
		case 404:
			errorMessage = "페이지를 찾을 수 없습니다. URL을 확인하거나 홈페이지로 돌아가 주세요.";
			break;
		case 500:
			errorMessage = "서버에 문제가 발생했습니다. 관리자에게 문의하세요.";
			break;
		case 403:
			errorMessage = "이 페이지에 접근할 권한이 없습니다.";
			break;
		case 400:
			errorMessage = "잘못된 요청입니다. 입력하신 정보를 확인하고 다시 시도해 주세요.";
			break;
			
		default:
			errorMessage = "관리자에게 문의하세요.";
		}

		req.setAttribute("statusCode", statusCode);
		req.setAttribute("errorMessage", errorMessage);
		req.getRequestDispatcher("/WEB-INF/error/errorPage.jsp").forward(req, resp);
	}

}
