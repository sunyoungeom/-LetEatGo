package post;
import org.apache.ibatis.annotations.*;

import user.User;

import java.util.List;
import java.util.Map;

public interface PostMapper {
    // 전체 조회
	@Select("SELECT * FROM posts")
    List<Post> getAllPosts();
	
	// 특정 게시문 조회
    @Select("SELECT * FROM posts WHERE post_id = #{post_Id}")
    Post getPostById(@Param("post_id") int postId);

    // 게시물 작성
    @Insert("INSERT INTO posts (content, writeuser_id) " +
            "VALUES (#{content}, #{writeuser_id})")
    void createPost(@Param("content")Post post, @Param("writeuser_id")User user);

 // 게시물 업데이트
    @Update("UPDATE posts " +
            "SET content = #{post.content}, " +
            "resistdate = NOW(), expiredate = #{post.expireDate}, status = #{post.status} " +
            "WHERE post_id = #{post.postId}")
    void updatePost(@Param("post") Post post);

    // 게시물 삭제
    @Delete("DELETE FROM posts WHERE post_id = #{post_Id}")
    void deletePost(@Param("post_Id") int postId);
    
    // 페이징 처리를 위한 쿼리
    @Select("SELECT * FROM posts WHERE status = 0 LIMIT 10 OFFSET #{offset}")
    List<Post> getPage(@Param("offset") int offset);
    
//    @Select("SELECT * FROM posts LIMIT #{limit} OFFSET #{offset}")
//	List<Post> getPage(Map<String, Integer> params);

    @Select("SELECT COUNT(*) FROM posts")
    int countAll();
    
}
    
