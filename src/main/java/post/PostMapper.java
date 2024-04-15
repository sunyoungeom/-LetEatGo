package post;
import org.apache.ibatis.annotations.*;

import post_review.Review;
import user.User;

import java.util.List;
import java.util.Map;
import java.sql.Date;

public interface PostMapper {
    // 전체 조회
	@Select("SELECT * FROM posts")
    List<Post> getAllPosts();
	
	// 조회수 증가
	@Update("UPDATE posts SET view = view + 1 WHERE post_id = #{postId}")
	void increasePostViews(@Param("postId") int postId);
	
	// 특정 게시물 조회
    @Select("SELECT * FROM posts WHERE post_id = #{post_Id}")
    Post getPostById(@Param("post_Id") int postId);
    
    // 특정 유저가 작성한 게시물 조회
    @Select("SELECT * FROM posts WHERE writeuser_id = #{writeuser_id}")
    List<Post> getUserPostList(@Param("writeuser_id") int writeuser_id);
 
    // 게시물 작성
    @Insert(value = "INSERT INTO posts (title,content, writeuser_id,expiredate, resistdate,place) " +
            "VALUES (#{post.title}, #{post.content}, #{post.writeUser_Id}, #{post.expireDate}, now(), #{post.place})")
    @SelectKey(keyProperty = "post_id", statement =  "SELECT LAST_INSERT_ID();" , resultType = Integer.class, before = false)
    int createPost(@Param("post")Post post, @Param("user")User user);

    // 조회수 기준으로로 정렬
    @Select("SELECT * FROM posts ORDER BY view DESC")
    List<Post> getPostsOrderByViewDesc();

    // 리뷰 권한을 주기위한 포스트상태 1 채밍방1 상태값 찾는
    @Select("SELECT p.post_id, p.writeuser_id, p.guestuser_id, p.title, p.content, p.resistdate, p.expiredate, p.status, p.place, p.view, c.guestuser_id as conversation_guestuser_id " +
            "FROM posts p " +
            "JOIN conversations c ON p.post_id = c.post_id " +
            "WHERE p.status = 1 AND c.status = 1")
    @Results({
        @Result(property = "postId", column = "post_id"),
        @Result(property = "writeUserId", column = "writeuser_id"),
        @Result(property = "guestUserId", column = "guestuser_id"),
        @Result(property = "title", column = "title"),
        @Result(property = "content", column = "content"),
        @Result(property = "resistDate", column = "resistdate"),
        @Result(property = "expireDate", column = "expiredate"),
        @Result(property = "status", column = "status"),
        @Result(property = "place", column = "place"),
        @Result(property = "view", column = "view"),
        @Result(property = "conversationGuestUserId", column = "conversation_guestuser_id")
    })
    List<PostWithGuestUserIdDTO> getPostsWithStatusAndGuestUserId();

    
    @Select("SELECT LAST_INSERT_ID()")
    int lastInsertId();
    
    //게시글 수정
    @Update("UPDATE posts " +
            "SET content = #{post.content}, " + " title = #{post.title}," +
            "resistdate = NOW(), expiredate = #{post.expireDate}, status = #{post.status} " +
            "WHERE post_id = #{post.post_Id}")
    void updatePost(@Param("post") Post post);

    // 게시물 삭제
    @Delete("DELETE FROM posts WHERE post_id = #{post_Id}")
    void deletePost(@Param("post_Id") int postId);
    
    // 페이징 처리를 위한 쿼리
    @Select("SELECT * FROM posts WHERE status = 1 LIMIT #{limit} OFFSET #{offset}")
    List<Post> getPage(Map<String, Integer> params);

    @Select("SELECT COUNT(*) FROM posts WHERE status = 1")
    int countAll();
    
    //개인 페이지 페이징 처리 위한 쿼리
    @Select("SELECT * FROM posts WHERE writeuser_id = #{writeuser_id} LIMIT #{params.limit} OFFSET #{params.offset}")
    List<Post> getMyPage(@Param("params") Map<String, Integer> params, @Param("writeuser_id") int writeuser_id);
    
    @Select("SELECT COUNT(*) FROM posts WHERE writeuser_id = #{writeuser_id}")
    int myCountAll(int writeuser_id);
    
    @Insert("INSERT INTO post_tag (post_id,budget,booze,age,gender,peopleLimit)" +
    		"values (#{postid},#{post_tag.budget},#{post_tag.booze},#{post_tag.age},#{post_tag.gender},#{post_tag.peopleLimit})")
    void createPostTag(@Param("postid") int postid,@Param("post_tag")PostTag post_tag);

    // posttag 수정
    @Update("UPDATE post_tag SET budget = #{postTag.budget}, booze = #{postTag.booze}, age = #{postTag.age}, gender = #{postTag.gender}, peopleLimit = #{postTag.peopleLimit} WHERE post_id = #{postId}")
    void updatePostTag( @Param("postTag") PostTag postTag, @Param("postId") int postId);

    
    @Select("Select * FROM post_tag WHERE post_id = #{post_id}")
    PostTag getPostTag(@Param("post_id") int post_id);
    
    @Select("select * from posts where place = #{place}")
    List<Post> getPostsByPlace(String place);
    
    @Select("SELECT * FROM posts WHERE writeuser_id = #{user_id} ORDER BY writeuser_id DESC LIMIT 10;")
    List<Post> getPlaceById(@Param("user_id")int user_id);
    
    @Update("UPDATE posts SET status = 1 WHERE post_id = #{post_id}")
    int updatePostStatus(@Param("post_id") int postId, @Param("status") int status);
}
    
