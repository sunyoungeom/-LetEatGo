package post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;
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
	
	
	// 조회수 증가 메서드
	public void increasePostViews(int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			postMapper.increasePostViews(postId);
			sqlSession.commit();
		}
	}

	public List<PostWithGuestUserIdDTO> getPostsWithStatusAndGuestUserId () {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPostsWithStatusAndGuestUserId();
		}
	}
	
	public String getPlaceByPostId(int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPlaceByPostId(postId);
		}
	}
	
	public List<Post> getPostsOrderByPostIdDesc (){
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPostsOrderByPostIdDesc();
		}
	}
	
	public  PostTag getPostTagbyPostId(int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPostTagbyPostId(postId);
		}
	}
	
	
	// 해당 게시물에 참여한 게스트 아이디 
	public List<Integer> getGuestUserIdByPostId (int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getGuestUserIdListByPostId(postId);
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
	
	//활성화된 글 페이지
	public static PostDTO getactivePage(int page, int pagePer) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession();) {
			PostMapper mapper = sqlSession.getMapper(PostMapper.class);
			int totalCount = mapper.activecountAll();
			int totalPage = totalCount / pagePer;
			totalPage += totalCount % pagePer == 0 ? 0 : 1;

			Map<String, Integer> params = new HashMap<>();
			params.put("limit", pagePer);
			params.put("offset", pagePer * (page - 1));

			List<Post> all = mapper.getactivePage(params);

			PostDTO dto = PostDTO.builder().totalPages(totalPage).currentPage(page).itemsPerPage(pagePer).items(all)
					.build();

			return dto;
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
	
	// 개인 목록 페이지
	public static PostDTO getMyPostPage(int page, int pagePer, int writeuser_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession();) {
			PostMapper mapper = sqlSession.getMapper(PostMapper.class);
			int totalCount = mapper.myCountAll(writeuser_id);
			int totalPage = totalCount / pagePer;
			totalPage += totalCount % pagePer == 0 ? 0 : 1;

			Map<String, Integer> params = new HashMap<>();
			params.put("limit", pagePer);
			params.put("offset", pagePer * (page - 1));

			List<Post> all = mapper.getMyPage(params, writeuser_id);

			PostDTO dto = PostDTO.builder().totalPages(totalPage).currentPage(page).itemsPerPage(pagePer).items(all)
					.build();

			return dto;
		}
	}
	
	public static PostDTO getactivePostPage(int page, int pagePer, int writeuser_id, int totalCount, List<Post> list) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession();) {
			PostMapper mapper = sqlSession.getMapper(PostMapper.class);
			int totalPage = totalCount / pagePer;
			totalPage += totalCount % pagePer == 0 ? 0 : 1;
			
			Map<String, Integer> params = new HashMap<>();
			params.put("limit", pagePer);
			params.put("offset", pagePer * (page - 1));
			
			List<Post> all = list;
			
			PostDTO dto = PostDTO.builder().totalPages(totalPage).currentPage(page).itemsPerPage(pagePer).items(all)
					.build();
			
			return dto;
		}
	}

	public int updatePostStatus(int postId) {
	    try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
	        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
	        int rowsAffected = postMapper.updatePostStatus(postId, 1); // 상태 값을 1로 변경
	        sqlSession.commit(); // 변경 사항 커밋
	        return rowsAffected; // 업데이트된 행의 수 반환
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // 실패한 경우 0 반환
	    }
	}


	// 조기마감 상태, 마감 남아있는 사람들 = 참가인원, 리뷰를 참여한 사람만
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

	public List<Post> getPostsByPlace(String place) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPostsByPlace(place);
		}
	}

	public List<Post> getPlaceById(int user_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPlaceById(user_id);

		}
	}

	public PostTag getPostTag(int post_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

			return postMapper.getPostTag(post_id);
		}
	}

	// 태크 업데이트 메서드
	public void updatePostTag(PostTag postTag, int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
			postMapper.updatePostTag(postTag, postId);
			sqlSession.commit();
		}
	}
	
}