// Controller Servlet
package post;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PostController extends HttpServlet {
    private PostService postService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // PostService 객체 생성
        postService = new PostService(); // 또는 DI(Dependency Injection) 활용
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 전체 게시물 조회
        List<Post> allPosts = postService.getAllPosts();
        
        // 조회된 게시물을 request attribute에 저장
        request.setAttribute("posts", allPosts);
        
        // JSP 뷰 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewPosts.jsp");
        dispatcher.forward(request, response);
    }

    // 다른 메서드들도 추가로 구현 가능
}
