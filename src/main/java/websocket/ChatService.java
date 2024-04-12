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

	// 특정 유저 채팅방 참여목록 보여주기
	public List<Post> getListByGId(int GId) {
	    try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
	        ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
	        List<Post> chatList = chatMapper.getListByGId(GId);
	        sqlSession.commit();
	        return chatList;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 처리
	        return null;
	    }
	}

	
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

    // 귓속말 저장
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
	
	// 채팅방 참여
	public void insertChatroom(Conversations conversations) { // 채팅방 입장
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
    		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
    		chatMapper.insertChatroom(conversations);
    		sqlSession.commit();
		} catch (Exception e) {
            e.printStackTrace();
            // 예외 처리
        }
	}

	// 채팅방 나가기(아예 나가는거임)
	public void deleteChatroom(Conversations conversations) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
    		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
    		chatMapper.deleteChatroom(conversations);
    		sqlSession.commit();
		} catch (Exception e) {
            e.printStackTrace();
            // 예외 처리
        }
	}
	
	// 채팅방 중복 검사(유저아이디, 게시물번호)
	public Conversations getGIdByGId(int Gid, int postId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			return chatMapper.getGIdByGId(Gid, postId);
		}
	}

}
