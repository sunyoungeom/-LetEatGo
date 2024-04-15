package user;

import org.apache.ibatis.annotations.*;

import websocket.MessageWithSenderNickname;

import java.util.List;

@Mapper
public interface UserMapper {
	// 유저 등록
	@Insert("INSERT INTO users (id, password, email, name, nickname, identifynumber, phonenumber, address, join_date, attendance, mbti, bloodtype, profile_photo_path) "
			+ "VALUES (#{id}, #{password}, #{email}, #{name}, #{nickname}, #{identifynumber}, #{phonenumber}, #{address}, #{join_date}, #{attendance}, #{mbti}, #{bloodtype}, #{profilePhotoPath})")
	int addUser(User user);

	// 중복 검사
	@Select("SELECT id FROM users WHERE id = #{id}")
	User getIdById(@Param("id") String id);

	@Select("SELECT email FROM users WHERE email = #{email}")
	User getEmailByEmail(@Param("email") String email);

	@Select("SELECT nickname FROM users WHERE nickname = #{nickname}")
	User getNicknameByNickname(@Param("nickname") String nickname);

	@Select("SELECT phonenumber FROM users WHERE phonenumber = #{phonenumber}")
	User getPhoneNumberByPhoneNumber(@Param("phonenumber") String phonenumber);

	// 유저 전체 조회
	@Select("SELECT * FROM users")
	@Results({ @Result(property = "user_id", column = "user_id"), @Result(property = "id", column = "id"),
			@Result(property = "password", column = "password"), @Result(property = "join_date", column = "join_date"),
			@Result(property = "attendance", column = "attendance"), @Result(property = "email", column = "email"),
			@Result(property = "name", column = "name"), @Result(property = "nickname", column = "nickname"),
			@Result(property = "address", column = "address"), @Result(property = "mbti", column = "mbti"),
			@Result(property = "bloodtype", column = "bloodtype"),
			@Result(property = "identifynumber", column = "identifynumber"),
			@Result(property = "phonenumber", column = "phonenumber"),
			@Result(property = "profilePhotoPath", column = "profilePhotoPath") })
	List<User> getAllUsers();

	// 유저 삭제
	@Delete("DELETE FROM users WHERE id=#{id}")
	void deleteUser(String id);

	// 특정 유저 검색
	@Select("SELECT user_id FROM users WHERE id=#{id}")
	int getUserId(String id);

	// pk값으로 유저 찾기
	@Select("SELECT * FROM users WHERE user_id = #{user_id}")
	User getUser(@Param("user_id") int user_id);

	// 혈액형값으로 유저 찾기
	@Select("SELECT * FROM users WHERE bloodtype = #{bloodtype}")
	User getBloodUser(@Param("bloodtype") String bloodtype);

	// MBTI값으로 유저 찾기
	@Select("SELECT * FROM users WHERE mbti = #{mbti}")
	User getMBTIUser(@Param("mbti") String mbti);

	@Select("SELECT * FROM users WHERE id = #{id}")
	User getUserById(@Param("id") String id);

	@Update("UPDATE users SET attendance = 1 WHERE id = #{id}")
	void checkAttendance(String id);

	// 닉네임으로 유저아이디 찾기 (일웅필요함)
	@Select("SELECT user_id FROM users WHERE nickname = #{nickname}")
	int getUserIdByNickName(String nickname);
	
	// 유저아이디로 닉네임 찾기 (일웅)
	@Select("SELECT nickname FROM users WHERE user_id = #{user_id}")
	String getNicknameById(int user_id);
	

	// 유저 수정
	@Update("UPDATE users "
			+ "SET email = #{email}, password = #{password}, join_date = #{join_date}, last_login = #{lastLogin}, "
			+ "name = #{name}, nickname = #{nickname}, mbti = #{mbti}, bloodtype = #{bloodtype}, "
			+ "identifynumber = #{identifynumber}, phonnumber = #{phonnumber} " + "WHERE id = #{id}")
	void updateUser(User user);

	// 로그아웃 시간
	@Update("UPDATE users " + "SET last_logout = NOW() " + "WHERE user_id = #{userId}")
	void updateLogoutTime(int userId);

	// 로그인 시간
	@Update("UPDATE users " + "SET join_date = NOW() " + "WHERE user_id = #{userId}")
	void updateLoginTime(int userId);

	// 특정유저 주소값 찾기
	@Select("SELECT address FROM users WHERE user_id=#{user_id}")
	String getUserAddress(int id);

	@Update("UPDATE users SET nickname = #{nickname} WHERE id = #{id}")
	void updateNickname(String id, String nickname);

	@Update("UPDATE users SET phonenumber = #{phonenumber} WHERE id = #{id}")
	void updatePhonenumber(String id, String phonenumber);

	@Update("UPDATE users SET email = #{email} WHERE id = #{id}")
	void updateEmail(String id, String email);

	@Update("UPDATE users SET address = #{address} WHERE id = #{id}")
	void updateAddress(String id, String address);

	@Update("UPDATE users SET mbti = #{mbti} WHERE id = #{id}")
	void updateMBTI(String id, String mbti);

	@Update("UPDATE users SET bloodtype = #{bloodtype} WHERE id = #{id}")
	void updateBloodtype(String id, String bloodtype);

	@Select("SELECT * FROM users where user_id != #{user_id}")
	List<User> getAllUsersExceptMe(int user_id);

	@Select("SELECT COUNT(*) FROM posts WHERE post_id = #{post_id} AND writeuser_id = #{user_id}")
	int isPostOwner(@Param("post_id") int post_id, @Param("user_id") int user_id);


}
