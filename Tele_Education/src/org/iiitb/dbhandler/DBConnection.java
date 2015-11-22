package org.iiitb.dbhandler;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection createConnection()

	{
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver")	;
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/TELE_EDU_DB", "root","root");

		}
		catch(Exception ex)
		{
			System.out.println("Exception");
			ex.printStackTrace();
		}

		return connection;
	}
}
