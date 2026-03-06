package com.smsportal.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.smsportal.dao.UserDAO;
import com.smsportal.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// Validate input
			if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || password == null
					|| password.trim().isEmpty()) {

				out.println("<html><body>");
				out.println("<h3 style='color:red'>All fields are required!</h3>");
				out.println("<a href='register.jsp'>Go back to registration</a>");
				out.println("</body></html>");
				return;
			}

			System.out.println("RegisterServlet: Processing registration for email: " + email); // Debug log

			User user = new User();
			user.setName(name.trim());
			user.setEmail(email.trim());
			user.setPassword(password); // In production, you should hash the password

			UserDAO dao = new UserDAO();
			boolean status = dao.register(user);

			System.out.println("RegisterServlet: Registration status = " + status); // Debug log

			if (status) {
				response.sendRedirect("login.jsp?registered=true");
			} else {
				out.println("<html><body>");
				out.println("<h3 style='color:red'>Registration Failed. Please try again.</h3>");
				out.println("<h4>Possible reasons:</h4>");
				out.println("<ul>");
				out.println("<li>Database connection issue</li>");
				out.println("<li>Email might already exist in the system</li>");
				out.println("<li>Invalid data format</li>");
				out.println("</ul>");
				out.println("<a href='register.jsp'>Go back to registration</a>");
				out.println("</body></html>");
			}

		} catch (Exception e) {
			System.out.println("RegisterServlet Exception: " + e.getMessage());
			e.printStackTrace();

			out.println("<html><body>");
			out.println("<h3 style='color:red'>Registration Error: " + e.getMessage() + "</h3>");
			out.println("<a href='register.jsp'>Go back to registration</a>");
			out.println("</body></html>");
		}
	}
}