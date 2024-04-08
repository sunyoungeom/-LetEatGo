package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/post/mypage")
public class MyPagePost extends HttpServlet {
	private PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET 요청을 처리합니다.
//		int page = Integer.parseInt(request.getParameter("page"));
//		int pagePer = Integer.parseInt(request.getParameter("pagePer"));
		int page = request.getParameter("page") != null && !request.getParameter("page").isEmpty()
				? Integer.parseInt(request.getParameter("page"))
				: 1;
		int pagePer = request.getParameter("pagePer") != null && !request.getParameter("pagePer").isEmpty()
				? Integer.parseInt(request.getParameter("pagePer"))
				: 1;
		PostDTO posts = postService.getPostPage(page, pagePer);
		// JSON 형태로 변환하여 응답합니다.
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(mapper);
		response.setContentType("application/json");
		mapper.writeValue(response.getWriter(), posts);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // 요청에서 삭제할 게시물의 ID를 가져옵니다.
	    int postId = Integer.parseInt(request.getParameter("postId"));
	    
	    // 게시물 삭제 작업을 수행합니다.
	    postService.deletePost(postId);
	    
	    // 클라이언트에게 성공적으로 삭제되었음을 응답합니다.
	    response.setStatus(HttpServletResponse.SC_OK);
	    response.getWriter().write("게시물이 성공적으로 삭제되었습니다.");
	}
	
}
