<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login - SMS Portal</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	width: 350px;
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	color: #555;
	font-weight: bold;
}

input[type="email"], input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.btn-login {
	width: 100%;
	padding: 12px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

.btn-login:hover {
	background-color: #0056b3;
}

.register-link {
	text-align: center;
	margin-top: 20px;
}

.error-message {
	background-color: #f8d7da;
	color: #721c24;
	padding: 10px;
	border-radius: 4px;
	margin-bottom: 20px;
	text-align: center;
}

.success-message {
	background-color: #d4edda;
	color: #155724;
	padding: 10px;
	border-radius: 4px;
	margin-bottom: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Login to SMS Portal</h2>

		<%
		if (request.getParameter("registered") != null) {
		%>
		<div class="success-message">Registration successful! Please
			login.</div>
		<%
		}
		%>

		<%
		if (request.getParameter("error") != null) {
		%>
		<div class="error-message">Invalid email or password. Please try
			again.</div>
		<%
		}
		%>

		<form action="login" method="post">
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required placeholder="Enter your email">
			</div>

			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required
					placeholder="Enter your password">
			</div>

			<button type="submit" class="btn-login">Login</button>
		</form>

		<div class="register-link">
			Don't have an account? <a href="register.jsp">Register here</a>
		</div>
	</div>
</body>
</html>