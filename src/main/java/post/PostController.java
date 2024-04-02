package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/post")
public class PostController extends HttpServlet {
    private PostService postService;

    @Override
    public void init() throws ServletException {
        // PostService 객체를 초기화합니다.
        postService = new PostService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청을 처리합니다.
        String action = request.getParameter("action");
        if (action == null) {
            // action 파라미터가 없을 경우 기본적으로 모든 게시물을 조회합니다.
        	 int pageNumber = 1; // 기본 페이지 번호
             int pageSize = 1; // 페이지당 게시물 수
             if (request.getParameter("pageNumber") != null) {
                 pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
             }
             int startIdx = (pageNumber - 1) * pageSize; // 시작 인덱스 계산
           //  List<Post> posts = postService.getPostsByRange(startIdx, pageSize);
         //   request.setAttribute("posts", posts);
            request.getRequestDispatcher("/WEB-INF/views/posts.jsp").forward(request, response);
            PostDTO posts = postService.getPostPage(1, 1);

            // JSON 형태로 변환하여 응답합니다.
            ObjectMapper mapper = new ObjectMapper();
            response.setContentType("application/json");
            mapper.writeValue(response.getWriter(), posts);
        } else if (action.equals("detail")) {
            // action 파라미터가 "detail"일 경우 특정 게시물을 조회합니다.
            int postId = Integer.parseInt(request.getParameter("postId"));
            Post post = postService.getPostById(postId);
            request.setAttribute("post", post);
            request.getRequestDispatcher("/WEB-INF/views/post_detail.jsp").forward(request, response);
        } else {
            // 잘못된 action 값이 들어왔을 때 처리합니다.
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // POST 요청을 처리합니다.
        // 새로운 게시물 생성 등의 작업을 수행할 수 있습니다.
    }
}
