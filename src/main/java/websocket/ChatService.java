package websocket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import listener.MyWebContextListener;

public class ChatService {

    public List<Message> getAllMessages() {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            return chatMapper.getAllMessages();
        }
    }

    public Message getMessageById(int messageId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            return chatMapper.getMessageById(messageId);
        }
    }

    public void insertMessage(Message message) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            chatMapper.insertMessage(message);
            sqlSession.commit();
        }
    }

    public void updateMessage(Message message) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            chatMapper.updateMessage(message);
            sqlSession.commit();
        }
    }

    public void deleteMessage(int messageId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            chatMapper.deleteMessage(messageId);
            sqlSession.commit();
        }
    }
}
