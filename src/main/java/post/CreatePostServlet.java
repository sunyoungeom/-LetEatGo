package post;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.Timestamp;

import user.User;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@WebServlet({ "/createPost" })
public class CreatePostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 클라이언트로부터 요청받은 게시물 내용 가져오기
		Object attribute = request.getSession().getAttribute("user");
		User user = (User) attribute;
		int writeuser_id = user.getUser_id();

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String expireDate = request.getParameter("expireDate");
	
		String budget = request.getParameter("budget");
		String booze = request.getParameter("booze");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String peopleLimit = request.getParameter("peopleLimit");
		LocalDate resistLocalDate = LocalDate.now();
		Date resistDate = java.sql.Date.valueOf(resistLocalDate);
		// 게시물 객체 생성
		Post post = new Post();
		post.setWriteUser_Id(writeuser_id);
		post.setTitle(title);
		post.setContent(content);
		post.setResistDate(resistDate);
		post.setExpireDate(expireDate);

		// PostService 객체 생성
		PostService postService = new PostService();
		int postid = postService.createPost(post, user);

		PostTag postTag = new PostTag();
		postTag.setPost_Id(postid);
		postTag.setBudget(budget);
		postTag.setBooze(booze);
		postTag.setAge(age);
		postTag.setGender(gender);
		postTag.setPeopleLimit(peopleLimit);

		postService.createPostTag(postid, postTag);
		// 게시물 등록 메서드 호출
		// TODO: 세션값??에서 로그인되어 있는 유저 가져오기?
//        postService.createPost(post, user);

		// 게시물 등록 후 홈페이지로 리다이렉트
		response.sendRedirect("/index.jsp");
	}
}
