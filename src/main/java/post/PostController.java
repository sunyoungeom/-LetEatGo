package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/post/list")
public class PostController extends HttpServlet {
	private PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET 요청을 처리합니다.
		request.getRequestDispatcher("/WEB-INF/post/postlist.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POST 요청을 처리합니다.
		// 새로운 게시물 생성 등의 작업을 수행할 수 있습니다.
		int page = Integer.parseInt(request.getParameter("page"));
		int pagePer = Integer.parseInt(request.getParameter("pagePer"));
		PostDTO posts = postService.getPostPage(page, pagePer);
		// JSON 형태로 변환하여 응답합니다.
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(mapper);
		response.setContentType("application/json");
		mapper.writeValue(response.getWriter(), posts);

	}
}
