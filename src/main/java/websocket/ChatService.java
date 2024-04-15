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
	        return chatMapper.getListByGId(GId);
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

    // 채팅방에 있는 유저가 채팅창을 다시 열었을 때 이전 귓속말 내용 가져오기
    public List<PrivateMessage> getPrivateMessages(int senderId, int receiverId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            return chatMapper.getPrivateMessages(senderId, receiverId);
        }
    }
    
    public List<MessageWithSenderNickname> getChatMessagesWithSenderNicknameForPost(int postId) {
        try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
            ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
            return chatMapper.getChatMessagesWithSenderNicknameForPost(postId);
        }
    }
    
    public int updateconversationsStatus(int postId) {
    	try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
    		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
	        int rowsAffected = chatMapper.updateconversationsStatus(postId, 1); // 상태 값을 1로 변경
	        sqlSession.commit(); // 변경 사항 커밋
	        return rowsAffected; // 업데이트된 행의 수 반환
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // 실패한 경우 0 반환
	    }
    }
}
