package com.spk.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

public class DAO{
	
	private static String url="jdbc:mysql://localhost:3306/Customer_Database";
	private  static String user="root";
	private static String password="Spk@2003";
	
	public static Connection dbConnection() throws ClassNotFoundException, SQLException {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,user,password);
			return con;			
	}
}
