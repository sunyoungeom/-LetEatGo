package post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.protobuf.Timestamp;

import user.User;
import util.ServletUtil;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import java.util.List;

import static util.ServletUtil.*;

@WebServlet(urlPatterns = { "/createPost","/post/createPost", "/post/deletePost", "/post/updatePost", "/post/editpost", "/post/editsave" })
public class CRUDPostServlet extends HttpServlet {
	PostService postService = new PostService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		if(requestURI.endsWith("/post/createPost")) {
			request.getRequestDispatcher("/WEB-INF/post/createpost.jsp").forward(request, response);
		} else if (requestURI.endsWith("/post/editpost")) {
			request.getRequestDispatcher("/WEB-INF/post/editpost.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 클라이언트로부터 요청받은 게시물 내용 가져오기
		String requestURI = request.getRequestURI();
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

		if (requestURI.endsWith("/createPost")) {
			int postid = postService.createPost(post, user);
			PostTag postTag = new PostTag();
			postTag.setPost_Id(postid);
			postTag.setBudget(budget);
			postTag.setBooze(booze);
			postTag.setAge(age);
			postTag.setGender(gender);
			postTag.setPeopleLimit(peopleLimit);
			postService.createPostTag(postid, postTag);

		} else if (requestURI.endsWith("/post/editsave")) {
			int postid = Integer.parseInt(request.getParameter("postId"));

			PostTag postTag = new PostTag();
			postTag.setPost_Id(postid);
			postTag.setBudget(budget);
			postTag.setBooze(booze);
			postTag.setAge(age);
			postTag.setGender(gender);
			postTag.setPeopleLimit(peopleLimit);

			postService.updatePost(post);
			postService.updatePostTag(postTag, postid);

		}

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
		int postId = Integer.parseInt(req.getParameter("postId"));

		List<Object> list = new ArrayList<Object>();
		// 게시물을 데이터베이스에서 가져옵니다.
		Post post = postService.getPostById(postId);
		PostTag posttag = postService.getPostTag(postId);

		list.add(post);
		list.add(posttag);

		ServletUtil.sendJsonBody(list, resp);

	}

}
