package websocket;

import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ChatMapper {

    @Select("SELECT * FROM messages")
    @Results({
            @Result(property = "messageId", column = "message_id"),
            @Result(property = "conversationId", column = "conversation_id"),
            @Result(property = "senderId", column = "sender_id"),
            @Result(property = "sentAt", column = "sent_at")
    })
    List<Message> getAllMessages();

    @Select("SELECT * FROM messages WHERE message_id = #{messageId}")
    @Results({
            @Result(property = "messageId", column = "message_id"),
            @Result(property = "conversationId", column = "conversation_id"),
            @Result(property = "senderId", column = "sender_id"),
            @Result(property = "sentAt", column = "sent_at")
    })
    Message getMessageById(int messageId);

    @Insert("INSERT INTO messages (message_id, conversation_id, sender_id, content, sent_at) " +
            "VALUES (#{messageId}, #{conversationId}, #{senderId}, #{content}, #{sentAt})")
    @Options(useGeneratedKeys = true, keyProperty = "messageId")
    void insertMessage(Message message);

    @Update("UPDATE messages SET conversation_id = #{conversationId}, sender_id = #{senderId}, " +
            "content = #{content}, sent_at = #{sentAt} WHERE message_id = #{messageId}")
    void updateMessage(Message message);

    @Delete("DELETE FROM messages WHERE message_id = #{messageId}")
    void deleteMessage(int messageId);
}
