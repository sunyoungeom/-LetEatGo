//package user;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import listener.MyWebContextListener;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//@WebServlet("/myInfo")
//public class UserProfileServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
////        String userId = (String) session.getAttribute("userId"); // 세션에서 사용자 ID를 가져옴
//
////        String dbURL = "jdbc:mysql://localhost:3306/board";
////        String dbUser = "username";
////        String dbPass = "password";
//        String sql = "SELECT file_path FROM files WHERE user_id = ?";
//
//        try (Connection conn = MyWebContextListener.getConnection();
//             PreparedStatement statement = conn.prepareStatement(sql)) {
//            
//            statement.setInt(1, 1);
//            ResultSet resultSet = statement.executeQuery();
//
//            if (resultSet.next()) {
//                String filePath = resultSet.getString("file_path");
//                // HTML 출력
//                resp.setContentType("text/html");
//                PrintWriter out = resp.getWriter();
//                out.println("<html><head><title>Profile Page</title></head><body>");
//                out.println("<h1>Welcome, User!</h1>");
//                out.println("<img src='" + filePath + "' alt='Profile Image'/>"); // 이미지 태그에 파일 경로 사용
//                out.println("</body></html>");
////                resp.setContentType("text/html");
////                resp.getWriter().write("<img src='" + filePath + "' alt='Profile Image'/>");
//            } else {
//                resp.getWriter().write("No profile image found.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            resp.getWriter().write("Database error occurred.");
//
//    }
//    
//    
//    
//    }
//}
