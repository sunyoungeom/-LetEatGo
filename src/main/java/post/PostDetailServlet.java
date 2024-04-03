package post;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(name="PostDetailServlet", urlPatterns = "/post/detail")
public class PostDetailServlet extends HttpServlet {
    private PostService postService;

    @Override
    public void init() throws ServletException {
        // PostService 객체를 초기화합니다.
        postService = new PostService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청을 처리합니다.
        int postId = Integer.parseInt(request.getParameter("postId"));
        Post post = postService.getPostById(postId);

        // JSON 형태로 변환하여 응답합니다.
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json");
        mapper.writeValue(response.getWriter(), post);
    }
}
