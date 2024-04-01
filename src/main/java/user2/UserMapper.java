package user2;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {
	// 유저 등록
    @Insert("INSERT INTO users (email, password, join_date, last_login, name, nickname, mbti, bloodtype, identifynumber, phonnumber) " +
            "VALUES (#{email}, #{password}, #{joinDate}, #{lastLogin}, #{name}, #{nickname}, #{mbti}, #{bloodtype}, #{identifynumber}, #{phonnumber})")
    void addUser(User user);

    // 유저 전체 조회
    @Select("SELECT * FROM users")
    List<User> getAllUsers();

    // 유저 삭제
    @Delete("DELETE FROM users WHERE id=#{id}")
    void deleteUser(String id);

    // 특정 유저 검색
    @Select("SELECT user_id FROM users WHERE id=#{id}")
    int getUserId(String id);
    
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
}
