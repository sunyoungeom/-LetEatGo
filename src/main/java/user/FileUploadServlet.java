package user;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import listener.MyWebContextListener;

@WebServlet("/upload")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads"; // 서버 내 저장될 디렉토리
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db_name"; // 데이터베이스 URL
    private static final String DB_USER = "username"; // 데이터베이스 사용자 이름
    private static final String DB_PASSWORD = "password"; // 데이터베이스 암호

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // 각 파트(파일)을 처리
            for (Part part : req.getParts()) {
                String fileName = getFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    String filePath = uploadPath + File.separator + fileName;
                    try (InputStream fileContent = part.getInputStream()) {
                        // 파일을 저장
                        File file = new File(filePath);
                        Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                        System.out.println("Uploaded file successfully saved in " + filePath);

                        // 데이터베이스에 파일 정보 저장
                        saveFileInfoToDatabase(fileName, filePath);
                    }
                }
            }

            // 성공 응답
            resp.getWriter().println("File uploaded successfully.");
        } catch (Exception e) {
            // 오류 응답
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().println("File upload failed: " + e.getMessage());
            System.out.println("errrrrorrrrr");
        }
    }

    private String getFileName(Part part) {
        // content-disposition 헤더에서 파일 이름을 파싱
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            for (String cd : contentDisp.split(";")) {
                if (cd.trim().startsWith("filename")) {
                    return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
    }

    private void saveFileInfoToDatabase(String fileName, String filePath) throws SQLException {
        try (Connection conn = MyWebContextListener.getConnection();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO files (user_id, file_name, file_path) VALUES (?, ?, ?)")) {
        	stmt.setInt(1, 1);
            stmt.setString(2, fileName);
            stmt.setString(3, filePath);
            stmt.executeUpdate();
            System.out.println("File information saved to database.");
        }
    }
}
