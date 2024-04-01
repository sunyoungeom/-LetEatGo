package post;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

public class PostService{
	// 전체 게시물 조회 메서드
	public List<Post> getAllPosts() {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper personMapper = sqlSession.getMapper(PostMapper.class);
			
			return personMapper.getAll();
		}
	}

	// 특정 게시물 조회 메서드
	public Post getPostById(int postId) {
		return postMapper.getPostById(postId);
	}

	// 게시물 작성 메서드
	public void createPost(Post post) {
		postMapper.createPost(post);
	}

	// 게시물 업데이트 메서드
	public void updatePost(Post post) {
		postMapper.updatePost(post);
	}

	// 게시물 삭제 메서드
	public void deletePost(int postId) {
		postMapper.deletePost(postId);
	}

	// 페이지 번호와 페이지 크기를 모두 명시하면 해당 페이지의 게시물을 반환
	public List<Post> getPostsByRange(int startIdx, int pageSize) {
		int star = (startIdx - 1) * pageSize;
		return postMapper.getPostsByRange(star, pageSize);
	}
}