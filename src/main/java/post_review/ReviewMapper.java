package post_review;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

public interface ReviewMapper {
	// 리뷰 작성
    @Insert("INSERT INTO post_reviews (post_id, rating, review) " +
            "VALUES (#{postId}, #{rating}, #{review})")
    void addReview(Review review);
    
    // 리뷰 전체 조회
    @Select("SELECT * FROM post_reviews")
    List<Review> getAllReviews();

    // 리뷰 삭제
    @Delete("DELETE FROM post_reviews WHERE review_id=#{reviewId}")
    void deleteReview(int reviewId);

    // 특정 리뷰 검색
    @Select("SELECT * FROM post_reviews WHERE review_id=#{reviewId}")
    Review getReviewById(int reviewId);
    
    // 리뷰 수정
    @Update("UPDATE post_reviews " +
            "SET rating = #{rating}, review = #{review}, review_date = NOW() " +
            "WHERE review_id = #{reviewId}")
    void updateReview(Review review);
}
