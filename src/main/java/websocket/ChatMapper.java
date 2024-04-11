package websocket;

import org.apache.ibatis.annotations.*;

import post.Post;
import user.User;

import java.util.List;

public interface ChatMapper {

    @Select("SELECT * FROM messages")
    List<Message> getAllMessages();

    @Insert("INSERT INTO messages (post_id, sender_id, content, sent_at) " +
            "VALUES (#{postId}, #{senderId}, #{content}, #{sentAt})")
    void insertMessage(Message message);
    
    @Insert("INSERT INTO private_message (sender_id, receiver_id, pri_content, pri_sent_at) " +
            "VALUES (#{senderId}, #{receiverId}, #{priContent}, #{priSentAt})")
    void insertPrivateMessage(PrivateMessage privateMessage);

    @Delete("DELETE FROM messages WHERE message_id = #{messageId}")
    void deleteMessage(int messageId);
    
    @Insert("INSERT INTO conversations (post_id, writeuser_id, guestuser_id) " +
            "VALUES (#{post_id}, #{writeuser_id}, #{guestuser_id})")
    void insertChatroom(Conversations conversations);
    
    @Select("SELECT * FROM messages WHERE conversation_id = #{postId}")
    List<Message> getMessagesByPostId(@Param("postId") Post postId);
    
    @Select("SELECT * FROM conversations WHERE guestuser_id = #{guestuser_id}")
    Conversations getGIdByGId(@Param("guestuser_id") int Gid);

}
