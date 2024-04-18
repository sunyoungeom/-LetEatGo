package listener;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import post.PostMapper;
import post_review.ReviewMapper;
import user.UserMapper;
import util.ConfigLoader;
import websocket.ChatMapper;


public class MyWebContextListener implements ServletContextListener {
	private static DataSource dataSource;
	private static SqlSessionFactory factory;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		initDataSource();
		JdbcTransactionFactory jdbcTransactionFactory = new JdbcTransactionFactory();
		Environment environment = new Environment("dev", jdbcTransactionFactory, dataSource);
		Configuration configuration = new Configuration(environment);
		configuration.addMapper(UserMapper.class);
		configuration.addMapper(PostMapper.class);
		configuration.addMapper(ChatMapper.class);
		configuration.addMapper(ReviewMapper.class);
		factory = new SqlSessionFactoryBuilder().build(configuration);
	}
	
	private void initDataSource() {
		BasicDataSource ds = new BasicDataSource();
		String url = ConfigLoader.getPropertyValue("url");
        String username = ConfigLoader.getPropertyValue("username");
        String password = ConfigLoader.getPropertyValue("password");
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
		dataSource = ds;
	}
	

	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	public static SqlSession getSqlSession() {
		return factory.openSession();
	}
}
 