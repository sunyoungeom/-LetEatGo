package post;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

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
	public void createPost(Post post) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			postMapper.createPost(post);
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
		}
	}

	// 페이지 번호와 페이지 크기를 모두 명시하면 해당 페이지의 게시물을 반환
	/*
	 * public List<Post> getPostsByRange(int startIdx, int pageSize) { try
	 * (SqlSession sqlSession = MyWebContextListener.getSqlSession()) { PostMapper
	 * postMapper = sqlSession.getMapper(PostMapper.class);
	 * 
	 * return postMapper.getPostsByRange(startIdx, pageSize); } }
	 */
}