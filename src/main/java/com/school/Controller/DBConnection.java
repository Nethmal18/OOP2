package com.school.Controller;

import java.sql.*;

public class DBConnection {
	private static String url = "jdbc:mysql://localhost:3306/sims";
	private static String userName = "root";
	private static String password = "vikum821";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,userName,password);
			
		}catch(Exception e) {
			
			System.out.println("Database connection is not success !");
		}
		return con;
	}
}
