package com.smsportal.controller;

import java.io.IOException;
import com.smsportal.dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		int userId = (Integer) session.getAttribute("userId");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");

		MessageDAO dao = new MessageDAO();

		try {
			dao.sendMessage(userId, phone, message);
			response.sendRedirect("dashboard.jsp?success=1");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("dashboard.jsp?error=1");
		}
	}
}