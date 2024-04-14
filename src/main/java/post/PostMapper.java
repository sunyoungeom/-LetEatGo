package post;
import org.apache.ibatis.annotations.*;

import post_review.Review;
import user.User;

import java.util.List;
import java.util.Map;

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
    @Select("SELECT * FROM posts WHERE status = 0 LIMIT #{limit} OFFSET #{offset}")
    List<Post> getPage(Map<String, Integer> params);

    @Select("SELECT COUNT(*) FROM posts WHERE status = 0")
    int countAll();
    
    //개인 페이지 페이징 처리 위한 쿼리
    @Select("SELECT * FROM posts WHERE status = 0 AND writeuser_id = #{writeuser_id} LIMIT #{params.limit} OFFSET #{params.offset}")
    List<Post> getMyPage(@Param("params") Map<String, Integer> params, @Param("writeuser_id") int writeuser_id);
    
    @Select("SELECT COUNT(*) FROM posts WHERE status = 0 AND writeuser_id = #{writeuser_id}")
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
}
    
