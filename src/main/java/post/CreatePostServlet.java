package post;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

@WebServlet({"/createPost","/map/search/createpost"})
public class CreatePostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 클라이언트로부터 요청받은 게시물 내용 가져오기
    	int writeuser_id = Integer.parseInt(request.getParameter("writeuser_id"));
        String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	String  expireDate = request.getParameter("expireDate");
    	LocalDate resistdate = LocalDate.now();
    	
        // 게시물 객체 생성
        Post post = new Post();
      //  post.setContent(Integer.parseInt(request.getParameter("writeuser_id")));
        post.setContent(title);
        post.setContent(expireDate);
        post.setContent(content);
        
        // PostService 객체 생성
        PostService postService = new PostService();

        // 게시물 등록 메서드 호출
        //TODO: 세션값??에서 로그인되어 있는 유저 가져오기?
//        postService.createPost(post, user);

        // 게시물 등록 후 홈페이지로 리다이렉트
        response.sendRedirect("/index.jsp");
    }
}
