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


public class MyWebContextListener implements ServletContextListener {
	private static DataSource dataSource = JDBCProgram.getInstance();
	private static SqlSessionFactory factory;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		JdbcTransactionFactory jdbcTransactionFactory = new JdbcTransactionFactory();
		Environment environment = new Environment("dev", jdbcTransactionFactory, dataSource);
		Configuration configuration = new Configuration(environment);
		configuration.addMapper(PostMapper.class);
		factory = new SqlSessionFactoryBuilder().build(configuration);
	}

	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	public static SqlSession getSqlSession() {
		return factory.openSession();
	}
}
 