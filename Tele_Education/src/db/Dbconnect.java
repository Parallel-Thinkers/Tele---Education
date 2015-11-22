package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnect {

	static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static String DB_URL = "jdbc:mysql://localhost/TELE_EDUCATION";

	static String USER = "root";
	static String PASS = "root";

	public Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection conn = null;	
		conn = DriverManager.getConnection(DB_URL, USER, PASS);

		return conn ;
	
	}

	
	
	
}
