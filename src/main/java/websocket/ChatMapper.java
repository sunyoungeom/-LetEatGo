package websocket;

import org.apache.ibatis.annotations.*;

import post.Post;

import java.util.List;

public interface ChatMapper {

    @Select("SELECT * FROM messages")
    List<Message> getAllMessages();

    @Insert("INSERT INTO messages (conversation_id, sender_id, content, sent_at) " +
            "VALUES (#{postId}, #{senderId}, #{content}, #{sentAt})")
    void insertMessage(Message message);


    @Delete("DELETE FROM messages WHERE message_id = #{messageId}")
    void deleteMessage(int messageId);
    
    @Select("SELECT * FROM messages WHERE conversation_id = #{postId}")
    List<Message> getMessagesByPostId(@Param("postId") Post postId);

}
