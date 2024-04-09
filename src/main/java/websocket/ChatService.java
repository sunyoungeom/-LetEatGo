package websocket;

import org.apache.ibatis.session.SqlSession;
import listener.MyWebContextListener;
import post.Post;
import post.PostMapper;
import user.User;
import user.UserMapper;

import java.util.List;

public class ChatService {

//    public List<Message> getAllMessages() {
//        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
//            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
//            return chatMapper.getAllMessages();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null; // 또는 예외를 throw하여 상위 레이어로 전파
//        }
//    }
//
//    public List<Message> getMessagesByPostId(Post postId) {
//        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
//            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
//            return chatMapper.getMessagesByPostId(postId);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null; // 또는 예외를 throw하여 상위 레이어로 전파
//        }
//    }

    public void insertMessage(Message message) {
    	try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
    		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
    		chatMapper.insertMessage(message);
    		sqlSession.commit();
		} catch (Exception e) {
            e.printStackTrace();
            // 예외 처리
        }
    }

//    public void deleteMessage(int postId) { // 대화기록 삭제
//        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
//            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
//            chatMapper.deleteMessage(postId);
//            sqlSession.commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//            // 예외 처리
//        }
//    }
}
