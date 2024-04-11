package websocket;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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

	public void insertPrivateMessage(PrivateMessage priMessage) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
    		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
    		chatMapper.insertPrivateMessage(priMessage);
    		sqlSession.commit();
		} catch (Exception e) {
            e.printStackTrace();
            // 예외 처리
        }
	}
	
	public void insertChatroom(Conversations conversations) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
    		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
    		chatMapper.insertChatroom(conversations);
    		sqlSession.commit();
		} catch (Exception e) {
            e.printStackTrace();
            // 예외 처리
        }
	}
	
	public Conversations getGIdByGId(int Gid) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			return chatMapper.getGIdByGId(Gid);
		}
	}

//    public void deleteMessage(int postId) { // 채팅방목록 삭제
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
