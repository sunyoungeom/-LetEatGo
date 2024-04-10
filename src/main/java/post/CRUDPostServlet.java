package post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.protobuf.Timestamp;

import user.User;
import util.ServletUtil;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import static util.ServletUtil.*;

@WebServlet(urlPatterns = {"/createPost", "/post", "/post/mypage" })
public class CRUDPostServlet extends HttpServlet {
	PostService postService = new PostService();
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
		sendJsonBody(posts, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 클라이언트로부터 요청받은 게시물 내용 가져오기
		Object attribute = request.getSession().getAttribute("user");
		User user = (User) attribute;
		int writeUser_id = user.getUser_id();

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String expireDate = request.getParameter("expireDate");
		String place = request.getParameter("placeMap");
		
		
		String budget = request.getParameter("budget");
		String booze = request.getParameter("booze");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String peopleLimit = request.getParameter("peopleLimit");
		LocalDate resistLocalDate = LocalDate.now();
		Date resistDate = java.sql.Date.valueOf(resistLocalDate);
		// 게시물 객체 생성
		Post post = new Post();
		post.setWriteUser_Id(writeUser_id);
		post.setTitle(title);
		post.setContent(content);
		post.setResistDate(resistDate);
		post.setExpireDate(expireDate);
		post.setPlace(place);
		
		System.out.println(post.getWriteUser_Id());
		System.out.println(post.getTitle());
		System.out.println(post.getContent());
		System.out.println(post.getExpireDate());
		System.out.println(post.getPlace());
		
		
		int postid = postService.createPost(post, user);
		
		System.out.println(postid);
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

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String body = ServletUtil.readBody(req);
		System.out.println(body);
//		int getPost = Integer.parseInt(req.getParameter("postId"));
//		Post post = postService.getPostById(getPost);
//		req.setAttribute("post", post);
		resp.setStatus(HttpServletResponse.SC_OK);
		resp.getWriter().write("게시물이 성공적으로 삭제되었습니다.");
//		req.getRequestDispatcher("WEB-INF/post/editpost.jsp").forward(req, resp);
		
	}
	
	
}
