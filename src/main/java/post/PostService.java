package post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;
import user.User;

public class PostService {

	// 전체 게시물 조회 메서드
	public List<Post> getAllPosts() {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getAllPosts();
		}
	}

	// 특정 게시물 조회 메서드
	public Post getPostById(int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPostById(postId);
		}
	}

	// 게시물 작성 메서드

	public int createPost(Post post, User user) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			postMapper.createPost(post, user);

			sqlSession.commit();
			
			
			int lastInsertId = postMapper.lastInsertId();
			
			return lastInsertId;
			
		} catch (Exception e) {
			System.out.println("커밋 실패");
			return 0;
		}
	}

	// 게시물 업데이트 메서드
	public void updatePost(Post post) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			postMapper.updatePost(post);
		}
	}

	// 게시물 삭제 메서드
	public void deletePost(int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			postMapper.deletePost(postId);
			sqlSession.commit();
		}
	}

	// 페이지 번호와 페이지 크기를 모두 명시하면 해당 페이지의 게시물을 반환

	public static PostDTO getPostPage(int page, int pagePer) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession();) {
			PostMapper mapper = sqlSession.getMapper(PostMapper.class);
			int totalCount = mapper.countAll();
			int totalPage = totalCount / pagePer;
			totalPage += totalCount % pagePer == 0 ? 0 : 1;

			Map<String, Integer> params = new HashMap<>();
			params.put("limit", pagePer);
			params.put("offset", pagePer * (page - 1));

			List<Post> all = mapper.getPage(params);

			PostDTO dto = PostDTO.builder().totalPages(totalPage).currentPage(page).itemsPerPage(pagePer).items(all)
					.build();

			return dto;
		}
	}

	// 게시글 만료 상태 변환?
	public void statusTransition(int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			Post post = postMapper.getPostById(postId);
			post.setStatus(1);
			postMapper.updatePost(post);
		}
	}

	// 특정 유저가 작성한 게시글
	public List<Post> getUserPostList(int writeuser_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			return postMapper.getUserPostList(writeuser_id);
		}
	}

	public void createPostTag(int postId, PostTag postTag) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			postMapper.createPostTag(postId, postTag);
			
			sqlSession.commit();
		}
	}

}