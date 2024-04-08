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

import db.JDBCProgram;
import post.PostMapper;
import user.UserMapper;


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
		factory = new SqlSessionFactoryBuilder().build(configuration);
	}
	
	private void initDataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/board");
		ds.setUsername("root");
		ds.setPassword("root1234");
//		ds.setUrl("jdbc:mysql://192.168.0.107:3306/board");
//		ds.setUsername("team1");
//		ds.setPassword("root");
		dataSource = ds;
	}
	

	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	public static SqlSession getSqlSession() {
		return factory.openSession();
	}
}
 