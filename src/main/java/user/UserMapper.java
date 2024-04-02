package user;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {
	// 유저 등록
	@Insert("INSERT INTO users (id, password, email, name, nickname, identifynumber, phonenumber, address, join_date, attendance, mbti, bloodtype) " +
	        "VALUES (#{id}, #{password}, #{email}, #{name}, #{nickname}, #{identifynumber}, #{phonenumber}, #{address}, #{join_date}, #{attendance}, #{mbti}, #{bloodtype})")
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
    List<User> getAllUsers();

    // 유저 삭제
    @Delete("DELETE FROM users WHERE id=#{id}")
    void deleteUser(String id);

    // 특정 유저 검색
    @Select("SELECT user_id FROM users WHERE id=#{id}")
    int getUserId(String id);
    
    @Select("SELECT * FROM users WHERE id = #{id}")
    User getUserById(@Param("userId") String id);
    
    // 유저 수정
    @Update("UPDATE users " +
            "SET email = #{email}, password = #{password}, join_date = #{join_date}, last_login = #{lastLogin}, " +
            "name = #{name}, nickname = #{nickname}, mbti = #{mbti}, bloodtype = #{bloodtype}, " +
            "identifynumber = #{identifynumber}, phonnumber = #{phonnumber} " +
            "WHERE id = #{id}")
    void updateUser(User user);
    
    // 로그아웃 시간 
    @Update("UPDATE users " +
            "SET last_logout = NOW() " +
            "WHERE user_id = #{userId}")
    void updateLogoutTime(int userId);
    
    // 로그인 시간
    @Update("UPDATE users " +
            "SET join_date = NOW() " +
            "WHERE user_id = #{userId}")
    void updateLoginTime(int userId);
    
 // 특정유저 주소값 찾기
    @Select("SELECT address FROM users WHERE user_id=#{user_id}")
    String getUserAddress(int id);
}
