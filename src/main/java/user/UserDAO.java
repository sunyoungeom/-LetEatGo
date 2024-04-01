package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import db.JDBCProgram;

public class UserDAO {
	private static DataSource dataSource = JDBCProgram.getInstance();
	
	
    // 사용자 추가
    public void addUser(User user) {
        String sql = "INSERT INTO users (id, email, password, join_date, last_login, name, nickname, mbti, bloodtype, identifynumber, phonnumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	// LocalDateTime을 Timestamp로 변환
        	 LocalDateTime currentDateTime = LocalDateTime.now();
            Timestamp timestamp = Timestamp.valueOf(currentDateTime);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setTimestamp(4, timestamp);
            pstmt.setTimestamp(5, timestamp);
            pstmt.setString(6, user.getName());
            pstmt.setString(7, user.getNickname());
            pstmt.setString(8, user.getMbti());
            pstmt.setString(9, user.getBloodtype());
            pstmt.setString(10, user.getIdentifynumber());
            pstmt.setString(11, user.getPhoneNumber());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//
//    // 모든 사용자 가져오기
//    public List<User> getAllUsers() {
//        List<User> users = new ArrayList<>();
//        String sql = "SELECT * FROM users";
//        try (Connection conn = dataSource.getConnection();
//             PreparedStatement pstmt = conn.prepareStatement(sql);
//             ResultSet rs = pstmt.executeQuery()) {
//            while (rs.next()) {
//                User user = new User();
//                user.setId(rs.getString("id"));
//                user.setEmail(rs.getString("email"));
//                user.setPassword(rs.getString("password"));
//                user.setJoin_date(rs.getDate("join_date"));
//                user.setLast_login(rs.getDate("last_login"));
//                user.setName(rs.getString("name"));
//                user.setNickname(rs.getString("nickname"));
//                user.setMbti(rs.getString("mbti"));
//                user.setBloodtype(rs.getString("bloodtype"));
//                user.setIdentifynumber(rs.getString("identifynumber"));
//                user.setPhonnumber(rs.getString("phonnumber"));
//                users.add(user);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return users;
//    }

    // 사용자 삭제
    public void deleteUser(String id) {
        String sql = "DELETE FROM users WHERE id=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // 사용자 ID 가져오기
    public int getUserId(String id) {
        int userId = -1; // ID가 없는 경우 -1을 반환하도록 초기화

        String sql = "SELECT user_id FROM users WHERE id=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("user_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userId;
    }
}