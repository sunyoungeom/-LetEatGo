package user;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

import org.apache.ibatis.session.SqlSession;

import listener.MyWebContextListener;

public class UserService {

	public List<User> getAllUsers() {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getAllUsers();
		}
	}

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

	public void deleteUser(String id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.deleteUser(id);
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

	public void checkAttendance(String id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.checkAttendance(id);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 닉네임으로 유저아이디들고오기
	public int getUserIdByNickName(String nickname) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getUserIdByNickName(nickname);
		}
	}

	public void updatePassword(String id, String password) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updatePassword(id, password);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 유저아이디로 닉네임
	public String getNicknameById(int userId) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getNicknameById(userId);
		}
	}

	public void updateNickname(String id, String nickname) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateNickname(id, nickname);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updatePhonenumber(String id, String phonenumber) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updatePhonenumber(id, phonenumber);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateEmail(String id, String email) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateEmail(id, email);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateAddress(String id, String address) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateAddress(id, address);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateMBTI(String id, String mbti) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateMBTI(id, mbti);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateBloodtype(String id, String bloodtype) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateBloodtype(id, bloodtype);
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<User> getAllUsersExceptMe(int user_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getAllUsersExceptMe(user_id);
		}
	}

	public boolean isPostOwner(int post_id, int user_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			int result = userMapper.isPostOwner(post_id, user_id);
			return result > 0; // 반환된 값이 0보다 크면 true, 아니면 false 반환
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 예외 발생 시 기본적으로 false 반환
		}
	}
	
	public void updateAllUsersAttendanceStatus() {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateAllUsersAttendanceStatus();
			sqlSession.commit(); // 변경사항 커밋
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public void insertFood(int user_id, String foodCategory) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.insertFood(user_id, foodCategory);
			sqlSession.commit();
		}
	}
	public void insertHobby(Hobby hobby, int user_id) {
		try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.insertHobby(hobby, user_id);
			sqlSession.commit();
		}
	}
	
	public List<Food> getFoodCategoriesByUserId(int user_id) {
	    try (SqlSession sqlSession = MyWebContextListener.getBatchSqlSession()) {
	        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
	        String foodCategories = userMapper.getFoodCategoriesByUserId(user_id);
	        List<Food> foodList = new ArrayList<>();

	        String[] categoriesArray = foodCategories.split("/");
	        for (String category : categoriesArray) {
	            Food food = new Food(category.trim());
	            foodList.add(food);
	        }

	        sqlSession.commit();
	        return foodList;
	    }
	}
	
	public void insertFriendships(int userId, int receiverId) {
	    try (SqlSession sqlSession = MyWebContextListener.getSqlSession()) {
	        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
	        userMapper.insertFriendships(userId, receiverId);
	        sqlSession.commit();
	    }
	}
}
