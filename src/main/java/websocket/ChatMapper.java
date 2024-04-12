package websocket;

import org.apache.ibatis.annotations.*;

import post.Post;
import user.User;

import java.util.List;

public interface ChatMapper {

    // 모든 메시지 저장
    @Insert("INSERT INTO messages (post_id, sender_id, content, sent_at) " +
            "VALUES (#{postId}, #{senderId}, #{content}, #{sentAt})")
    void insertMessage(Message message);
    
    // 귓속말 메시지 저장
    @Insert("INSERT INTO private_message (sender_id, receiver_id, pri_content, pri_sent_at) " +
            "VALUES (#{senderId}, #{receiverId}, #{priContent}, #{priSentAt})")
    void insertPrivateMessage(PrivateMessage privateMessage);

    // 채팅방 입장
    @Insert("INSERT INTO conversations (post_id, writeuser_id, guestuser_id) " +
            "VALUES (#{post_id}, #{writeuser_id}, #{guestuser_id})")
    void insertChatroom(Conversations conversations);
    
    // 채팅방 (아예)나가기
    @Delete("DELETE FROM conversations WHERE post_id = #{post_id} AND guestuser_id "
    		+ "= #{guestuser_id}")
    void deleteChatroom(Conversations conversations);
    
    // 중복검사
    @Select("SELECT * FROM conversations WHERE guestuser_id = #{guestuser_id} AND post_id = #{post_id}")
    Conversations getGIdByGId(@Param("guestuser_id") int guestuserId, @Param("post_id") int postId);
    
    // (특정)유저채팅목록
    @Select("SELECT * FROM conversations WHERE guestuser_id = #{guestuser_id}")
    List<Post> getListByGId(@Param("guestuser_id") int guestuserId);
}
