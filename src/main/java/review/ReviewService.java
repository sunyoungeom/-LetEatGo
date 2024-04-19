package review;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;
import post.Post;
import post.PostDTO;
import post.PostMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewService {

    // 리뷰 작성 메서드
    public void addReview(Review review) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            reviewMapper.addReview(review);
            sqlSession.commit();
        }
    }
    
    // 리뷰 전체 조회 메서드
    public List<Review> getAllReviews() {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            return reviewMapper.getAllReviews();
        }
    }

    // 리뷰 삭제 메서드
    public void deleteReview(int reviewId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            reviewMapper.deleteReview(reviewId);
            sqlSession.commit();
        }
    }

    // 특정 리뷰 조회 메서드
    public Review getReviewById(int reviewId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            return reviewMapper.getReviewById(reviewId);
        }
    }

    // 리뷰 수정 메서드
    public void updateReview(Review review) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            reviewMapper.updateReview(review);
            sqlSession.commit();
        }
    }
    
    // 특정 게시물에 대한 리뷰 목록 조회 메서드
    public List<Review> getReviewsByPostId(int postId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            return reviewMapper.getReviewsByPostId(postId);
        }
    }
    
    // 특정 유저가 작성한 리뷰 목록 조회 메서드
    public List<Review> getReviewsByUserId(int userId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
            return reviewMapper.getReviewsByUserId(userId);
        }
    }
    
    // 특정 유저가 받은 리뷰 별점 평균 계산
    public double getAverageRatingByUserId(int userId) {
    	 try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
             ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
             return reviewMapper.getAverageRatingByUserId(userId);
         } catch (Exception e) {
        	 return 0;
         }
    }

    public static ReviewDTO getReviewPage(int page, int pagePer) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession();) {
			ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
			int totalCount = mapper.countAll();
			int totalPage = totalCount / pagePer;
			totalPage += totalCount % pagePer == 0 ? 0 : 1;

			Map<String, Integer> params = new HashMap<>();
			params.put("limit", pagePer);
			params.put("offset", pagePer * (page - 1));

			List<Review> all = mapper.getPage(params);

			ReviewDTO dto = ReviewDTO.builder().totalPages(totalPage).currentPage(page).itemsPerPage(pagePer).items(all)
					.build();

			return dto;
		}
	}

    public static ReviewDTO getMyReviewPage(int page, int pagePer, int  writeuser_id) {
    	try (SqlSession sqlSession = MyWebContextListener.getSqlSession();) {
    		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    		int totalCount = mapper.myCountAll(writeuser_id);
    		int totalPage = totalCount / pagePer;
    		totalPage += totalCount % pagePer == 0 ? 0 : 1;
    		
    		Map<String, Integer> params = new HashMap<>();
    		params.put("limit", pagePer);
    		params.put("offset", pagePer * (page - 1));
    		
    		List<Review> all = mapper.getMyPage(params,writeuser_id);
    		
    		ReviewDTO dto = ReviewDTO.builder().totalPages(totalPage).currentPage(page).itemsPerPage(pagePer).items(all)
    				.build();
    		
    		return dto;
    	}
    }
}
