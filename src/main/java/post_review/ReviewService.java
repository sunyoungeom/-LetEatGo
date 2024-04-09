package post_review;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

import java.util.List;

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

}
