package db;


import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class JDBCProgram {
	private static DataSource datasource = setupDataSource();

	public static DataSource getInstance() {
		System.out.println("...");
		return datasource;
	}
	
	private static DataSource setupDataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://192.168.0.107:3306/board");
		ds.setUsername("team1");
		ds.setPassword("root");
		return ds;
		
	}
}


