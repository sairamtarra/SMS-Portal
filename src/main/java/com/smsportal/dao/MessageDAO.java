package com.smsportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.smsportal.model.Message;

public class MessageDAO {

	public void sendMessage(int userId, String phone, String message) {
		try {
			Connection con = DBConnection.getConnection();
			String sql = "INSERT INTO messages(user_id, phone, message, sent_time) VALUES(?,?,?, NOW())";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, phone);
			ps.setString(3, message);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Message> getMessagesByUserId(int userId) {
		List<Message> messages = new ArrayList<>();
		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT * FROM messages WHERE user_id = ? ORDER BY sent_time DESC LIMIT 10";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Message msg = new Message();
				msg.setId(rs.getInt("id"));
				msg.setUserId(rs.getInt("user_id"));
				msg.setPhone(rs.getString("phone"));
				msg.setMessage(rs.getString("message"));
				msg.setSentTime(rs.getTimestamp("sent_time"));
				messages.add(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return messages;
	}
}