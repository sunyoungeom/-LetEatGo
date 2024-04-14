package menu;

import java.io.IOException;
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

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SearchResult searchResult = new SearchResult();
		List<SearchResult> list = SearchAPI.searchBlogAsJson("대연동 김유순 대구뽈찜");
		ServletUtil.sendJsonBody(list, resp);
	}

}
