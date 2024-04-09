package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName="AuthenticationFilter", urlPatterns={"/post/*", "/map/*","/mapdialog"})
public class AuthenticationFilter implements Filter {
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String loginUrl = "/login"; // 로그인 페이지의 URL

		// 사용자가 로그인되어 있는지 확인
		boolean isLoggedIn = checkIfLoggedIn(request);

		if (isLoggedIn || request.getRequestURI().equals(loginUrl)) {
			// 로그인이 되어 있거나 로그인 페이지로의 요청이면 요청을 계속 진행
			chain.doFilter(request, response);
		} else {
			// 로그인이 되어 있지 않으면 로그인 페이지로 리다이렉트
			response.sendRedirect(loginUrl);
		}
	}

	private boolean checkIfLoggedIn(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") != null) {
			return true;
		} else {
			return false; 
		}
	}

}
