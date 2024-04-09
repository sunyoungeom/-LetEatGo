package user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

public class UserService {

	public User getIdById(String id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getIdById(id);
		}
	}
	
	public User getUser(int user_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getUser(user_id);
		}
	}
	
	public User getEmailByEmail(String email) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getEmailByEmail(email);
		}
	}

	public User getNicknameByNickname(String nickname) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getNicknameByNickname(nickname);
		}
	}

	public User getPhoneNumberByPhoneNumber(String phonenumber) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getPhoneNumberByPhoneNumber(phonenumber);
		}
	}

	public int insert(User user) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

			User id = userMapper.getIdById(user.getId());
			if (id != null) {
				throw new UserAPIException("중복된 아이디", 409, null);
			}
			User email = userMapper.getEmailByEmail(user.getEmail());
			if (email != null) {
				throw new UserAPIException("중복된 이메일", 409, null);
			}
			User nickname = userMapper.getNicknameByNickname(user.getNickname());
			if (nickname != null) {
				throw new UserAPIException("중복된 닉네임", 409, null);
			}
			User phonenumber = userMapper.getPhoneNumberByPhoneNumber(user.getPhonenumber());
			if (phonenumber != null) {
				throw new UserAPIException("중복된 번호", 409, null);
			}

			int result = userMapper.addUser(user);
			sqlSession.commit();
			return result;
		}
	}

	public String getUserAddress(int id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

			return userMapper.getUserAddress(id);
		}
	}

	public User getUserById(String id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getUserById(id);
		}
	}
	public void checkAttendance(String id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.checkAttendance(id);
			sqlSession.commit(); // 변경사항 커밋
	    } catch (Exception e) {
	        e.printStackTrace();
		}
	}
	public int getUserId(String id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getUserId(id);
	    } 
	}
	public int getUserIdByNickName(String nickname) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getUserIdByNickName(nickname);
	    } 
	}
}
