package com.smsportal.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	// Update these values according to your MySQL configuration
	private static final String URL = "jdbc:mysql://localhost:3306/sms_portal?useSSL=false&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASS = "root"; // Change this to your MySQL password

	static {
		try {
			// Load MySQL JDBC driver (optional for newer versions)
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASS);
			System.out.println("Database connected successfully!"); // Debug message
		} catch (SQLException e) {
			System.out.println("Database connection failed!");
			e.printStackTrace();
		}
		return con;
	}
}