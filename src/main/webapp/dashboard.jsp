<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.smsportal.dao.*, com.smsportal.model.*"%>
<!DOCTYPE html>
<html>
<head>
<title>SMS Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f5f5f5;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 2px solid #007bff;
}

.welcome {
	color: #007bff;
	margin: 0;
}

.logout-btn {
	background-color: #dc3545;
	color: white;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 4px;
}

.section {
	margin: 20px 0;
	padding: 15px;
	background-color: #f8f9fa;
	border-radius: 4px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	height: 100px;
	resize: vertical;
}

.btn {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn:hover {
	background-color: #0056b3;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #007bff;
	color: white;
}

tr:hover {
	background-color: #f5f5f5;
}

.success-msg {
	background-color: #d4edda;
	color: #155724;
	padding: 10px;
	border-radius: 4px;
	margin-bottom: 10px;
}

.error-msg {
	background-color: #f8d7da;
	color: #721c24;
	padding: 10px;
	border-radius: 4px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1 class="welcome">
				Welcome,
				<%=session.getAttribute("user")%>!
			</h1>
			<a href="logout" class="logout-btn">Logout</a>
		</div>

		<%-- Display messages --%>
		<%
		if (request.getParameter("success") != null) {
		%>
		<div class="success-msg">Message sent successfully!</div>
		<%
		}
		%>
		<%
		if (request.getParameter("error") != null) {
		%>
		<div class="error-msg">Failed to send message. Please try again.</div>
		<%
		}
		%>

		<div class="section">
			<h2>Send SMS</h2>
			<form action="sendMessage" method="post">
				<div class="form-group">
					<label for="phone">Phone Number:</label> <input type="text"
						id="phone" name="phone" required
						placeholder="Enter 10-digit mobile number" pattern="[0-9]{10}">
				</div>
				<div class="form-group">
					<label for="message">Message:</label>
					<textarea id="message" name="message" required
						placeholder="Enter your message here..."></textarea>
				</div>
				<button type="submit" class="btn">Send SMS</button>
			</form>
		</div>

		<div class="section">
			<h2>Recent Messages</h2>
			<table>
				<thead>
					<tr>
						<th>Phone</th>
						<th>Message</th>
						<th>Sent Time</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {
						MessageDAO messageDAO = new MessageDAO();
						List<Message> messages = messageDAO.getMessagesByUserId((Integer) session.getAttribute("userId"));
						for (Message msg : messages) {
					%>
					<tr>
						<td><%=msg.getPhone()%></td>
						<td><%=msg.getMessage()%></td>
						<td><%=msg.getSentTime()%></td>
					</tr>
					<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>