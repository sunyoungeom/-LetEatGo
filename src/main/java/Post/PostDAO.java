package Post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import DB.JDBCProgram;

public class PostDAO {
	private static DataSource dataSource = JDBCProgram.getInstance();


	// 게시물 생성 메서드
	public void createPost(Post post) {
	    String query = "INSERT INTO posts (writeuser_id, guestuser_id, content, resistdate, expiredate, status) VALUES (?, ?, ?, ?, ?, ?)";
	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, post.getWriteUserId());
	        preparedStatement.setInt(2, post.getGuestUserId());
	        preparedStatement.setString(3, post.getContent());
	        preparedStatement.setDate(4, new java.sql.Date(post.getResistDate().getTime()));
	        preparedStatement.setDate(5, new java.sql.Date(post.getExpireDate().getTime()));
	        preparedStatement.setString(6, post.getStatus());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// 게시물 조회 메서드
	public List<Post> getAllPosts() {
	    List<Post> posts = new ArrayList<>();
	    String query = "SELECT * FROM posts";
	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query);
	         ResultSet resultSet = preparedStatement.executeQuery()) {
	        while (resultSet.next()) {
	            int postId = resultSet.getInt("post_id");
	            int writeUserId = resultSet.getInt("writeuser_id");
	            int guestUserId = resultSet.getInt("guestuser_id");
	            String content = resultSet.getString("content");
	            Date resistDate = resultSet.getDate("resistdate");
	            Date expireDate = resultSet.getDate("expiredate");
	            String status = resultSet.getString("status");
	            Post post = new Post(postId, writeUserId, guestUserId, content, resistDate, expireDate, status);
	            posts.add(post);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return posts;
	}

	// 게시물 수정 메서드
	public void updatePost(Post post) {
	    String query = "UPDATE posts SET writeuser_id = ?, guestuser_id = ?, content = ?, resistdate = ?, expiredate = ?, status = ? WHERE post_id = ?";
	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, post.getWriteUserId());
	        preparedStatement.setInt(2, post.getGuestUserId());
	        preparedStatement.setString(3, post.getContent());
	        preparedStatement.setDate(4, new java.sql.Date(post.getResistDate().getTime()));
	        preparedStatement.setDate(5, new java.sql.Date(post.getExpireDate().getTime()));
	        preparedStatement.setString(6, post.getStatus());
	        preparedStatement.setInt(7, post.getPostId());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	
	// 게시물 삭제 메서드
	public void deletePost(int postId) {
	    String query = "DELETE FROM posts WHERE post_id = ?";
	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, postId);
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// 특정 게시물 조회 메서드
	public Post getPostById(int postId) {
	    Post post = null;
	    String query = "SELECT * FROM posts WHERE post_id = ?";
	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, postId);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            if (resultSet.next()) {
	                int writeUserId = resultSet.getInt("writeuser_id");
	                int guestUserId = resultSet.getInt("guestuser_id");
	                String content = resultSet.getString("content");
	                Date resistDate = resultSet.getDate("resistdate");
	                Date expireDate = resultSet.getDate("expiredate");
	                String status = resultSet.getString("status");
	                post = new Post(postId, writeUserId, guestUserId, content, resistDate, expireDate, status);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return post;
	}


 
}
