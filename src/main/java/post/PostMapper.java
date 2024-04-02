package post;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface PostMapper {
    // 전체 조회
	@Select("SELECT * FROM posts")
    List<Post> getAllPosts();
	
	// 특정 게시문 조회
    @Select("SELECT * FROM posts WHERE post_id = #{post_Id}")
    Post getPostById(int postId);

    // 게시물 작성
    @Insert("INSERT INTO posts (content) " +
            "VALUES (#{content})")
    void createPost(Post post);

    // 게시물 업데이트
    @Update("UPDATE posts " +
            "SET content = #{content}, " +
            "resistdate = NOW(), expiredate = #{expireDate}, status = #{status} " +
            "WHERE post_id = #{postId}")
    void updatePost(Post post);

    // 게시물 삭제
    @Delete("DELETE FROM posts WHERE post_id = #{post_Id}")
    void deletePost(int postId);
 
    @Select("SELECT * FROM posts LIMIT #{limit} OFFSET #{offset}")
	List<Post> getPage(Map<String, Integer> params);
}
