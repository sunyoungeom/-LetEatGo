package user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

public class UserService implements UserMapper {
	
	@Override
	public String getUserAddress(int id){
		try(SqlSession sqlSession = MyWebContextListener.getSqlSession()){
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			
			return userMapper.getUserAddress(id);
		}
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getUserId(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateLogoutTime(int userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateLoginTime(int userId) {
		// TODO Auto-generated method stub
		
	};
	
}