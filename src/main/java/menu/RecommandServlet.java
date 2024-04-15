package menu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchbymap.SearchAPI;
import searchbymap.SearchResult;
import util.ServletUtil;

@WebServlet("/menu/recommand")
public class RecommandServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트로부터 query 파라미터 값을 받아옵니다.
		String queryParam = req.getParameter("keyword");
		// 쿼리 파라미터를 리스트 배열로 변환합니다.
		String[] queries = queryParam.split("\\n"); // 개행 문자를 기준으로 문자열을 분할하여 배열로 만듭니다.
		List<String> queryList = Arrays.asList(queries); // 배열을 리스트로 변환합니다.
		System.out.println(queryList);
		// 각 쿼리를 이용하여 작업을 수행하고, 결과를 리스트에 담습니다.
		List<SearchResult> resultList = new ArrayList<>();
		for (String query : queryList) {
			List<SearchResult> partialResultList = SearchAPI.searchBlogAsJson(query);
			resultList.addAll(partialResultList);
		}

		// 결과 리스트를 JSON 형태로 클라이언트에게 응답합니다.
		ServletUtil.sendJsonBody(resultList, resp);
	}

}
