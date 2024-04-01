package User;

import java.util.List;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    // 사용자 추가
    public void addUser(User user) {
        userDAO.addUser(user);
    }

    // 모든 사용자 가져오기
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    // 사용자 삭제
    public void deleteUser(String id) {
        userDAO.deleteUser(id);
    }
    
    // 사용자 ID 가져오기
    public int getUserId(String id) {
        return userDAO.getUserId(id);
    }
}
