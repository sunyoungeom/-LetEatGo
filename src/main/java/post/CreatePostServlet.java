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
    	//Date expireDate = request.getParameter("expireDate");
    	LocalDate resistDate = LocalDate.now();
    	
    	String budget = request.getParameter("budget");
    	String booze = request.getParameter("booze");
    	String age = request.getParameter("age");
    	String gender = request.getParameter("gender");
    	String peopleLimit = request.getParameter("peopleLimit");
    	
    	// 게시물 객체 생성
    	Post post = new Post();
    	post.setWriteUser_Id(writeuser_id);
    	post.setTitle(title);
    	//post.setExpireDate(expireDate);
    	post.setContent(content);
    	
        
        PostTag postTag = new PostTag();
        postTag.setBudget(budget);
     //   postTag.setBooze(booze);
        postTag.setAge(age);
        postTag.setGender(gender);
        postTag.setPeopleLimit(peopleLimit);
        
        
        
        // PostService 객체 생성
        PostService postService = new PostService();

        // 게시물 등록 메서드 호출
        //TODO: 세션값??에서 로그인되어 있는 유저 가져오기?
//        postService.createPost(post, user);

        // 게시물 등록 후 홈페이지로 리다이렉트
        response.sendRedirect("/index.jsp");
    }
}
