package post_review;
import org.apache.ibatis.annotations.*;

import post.Post;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ReviewMapper {
	// 리뷰 작성
	@Insert("INSERT INTO post_reviews (post_id, writeuser_id, rating, review, review_date) " +
	        "VALUES (#{postId}, #{writeUserId}, #{rating}, #{review}, NOW())")
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
    
    // 특정 유저가 작성한 리뷰 목록 조회
    @Select("SELECT * FROM post_reviews WHERE writeuser_id=#{userId}")
    List<Review> getReviewsByUserId(int userId);

    // 특정 유저가 받은 리뷰 별점 평균 계산
    @Select("SELECT AVG(rating) FROM post_reviews WHERE writeuser_id=#{userId}")
    double getAverageRatingByUserId(int userId);
    
    // 특정 게시물에 대한 리뷰 목록 조회
    @Results({
        @Result(property = "reviewId", column = "review_id"),
        @Result(property = "postId", column = "post_id"),
        @Result(property = "writeUserId", column = "writeuser_id"),
        @Result(property = "guestUserId", column = "guestuser_id"),
        @Result(property = "rating", column = "rating"),
        @Result(property = "review", column = "review"),
        @Result(property = "reviewDate", column = "review_date")
    })
    @Select("SELECT * FROM post_reviews WHERE post_id=#{postId}")
    List<Review> getReviewsByPostId(int postId);
    
    // 페이징 처리를 위한 쿼리
    @Select("SELECT * FROM post_reviews LIMIT #{limit} OFFSET #{offset}")
	List<Review> getPage(Map<String, Integer> params);

    @Select("SELECT COUNT(*) FROM post_reviews")
    int countAll();
    
    // 개인 페이징 처리를 위한 쿼리
    @Results({
        @Result(property = "reviewId", column = "review_id"),
        @Result(property = "postId", column = "post_id"),
        @Result(property = "writeUserId", column = "writeuser_id"),
        @Result(property = "guestUserId", column = "guestuser_id"),
        @Result(property = "rating", column = "rating"),
        @Result(property = "review", column = "review"),
        @Result(property = "reviewDate", column = "review_date")
    })
    @Select("SELECT * FROM post_reviews WHERE writeuser_id = #{writeuser_id} LIMIT #{params.limit} OFFSET #{params.offset}")
	List<Review> getMyPage(@Param("params")Map<String, Integer> params, @Param("writeuser_id") int writeuser_id);

    @Select("SELECT COUNT(*) FROM post_reviews WHERE writeuser_id = #{writeuser_id}")
    int myCountAll( @Param("writeuser_id") int writeuser_id);
    
    // 유저 평균 별점
//    @Select("SELECT AVG(rating) FROM post_review WHERE post_id IN (SELECT post_id FROM post WHERE writeuser_id = #{user_id})")
//    double getAverageRatingByUserId(String user_id);
}
