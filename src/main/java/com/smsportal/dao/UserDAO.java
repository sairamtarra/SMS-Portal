package com.smsportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.smsportal.model.User;

public class UserDAO {

	public User login(String email, String password) {
		User user = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DBConnection.getConnection();
			if (con == null) {
				System.out.println("Database connection is null in login");
				return null;
			}

			String sql = "SELECT * FROM users WHERE email=? AND password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				System.out.println("User found: " + user.getName()); // Debug message
			} else {
				System.out.println("No user found with email: " + email); // Debug message
			}

		} catch (Exception e) {
			System.out.println("Error in login: " + e.getMessage());
			e.printStackTrace();
		} finally {
			// Close resources
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	public boolean register(User user) {
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = DBConnection.getConnection();

			if (con == null) {
				System.out.println("Database connection is null in register");
				return false;
			}

			System.out.println("Attempting to register user: " + user.getName()); // Debug message
			System.out.println("Email: " + user.getEmail()); // Debug message

			String sql = "INSERT INTO users(name, email, password) VALUES(?, ?, ?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());

			int i = ps.executeUpdate();
			System.out.println("Rows affected: " + i); // Debug message

			if (i > 0) {
				status = true;
				System.out.println("User registered successfully!"); // Debug message
			}

		} catch (Exception e) {
			System.out.println("Error in register: " + e.getMessage());
			e.printStackTrace();
		} finally {
			// Close resources
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status;
	}
}