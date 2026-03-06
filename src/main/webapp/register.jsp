<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration - SMS Portal</title>
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

.register-container {
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

input[type="text"], input[type="email"], input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
}

input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus
	{
	outline: none;
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
}

.btn-register {
	width: 100%;
	padding: 12px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

.btn-register:hover {
	background-color: #0056b3;
}

.login-link {
	text-align: center;
	margin-top: 20px;
}

.login-link a {
	color: #007bff;
	text-decoration: none;
}

.login-link a:hover {
	text-decoration: underline;
}

.error-message {
	background-color: #f8d7da;
	color: #721c24;
	padding: 10px;
	border-radius: 4px;
	margin-bottom: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="register-container">
		<h2>Create Account</h2>

		<%
		if (request.getParameter("error") != null) {
		%>
		<div class="error-message">Registration failed. Please try
			again.</div>
		<%
		}
		%>

		<form action="register" method="post" onsubmit="return validateForm()">
			<div class="form-group">
				<label for="name">Full Name:</label> <input type="text" id="name"
					name="name" required placeholder="Enter your full name">
			</div>

			<div class="form-group">
				<label for="email">Email Address:</label> <input type="email"
					id="email" name="email" required placeholder="Enter your email">
			</div>

			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required
					placeholder="Enter your password" minlength="6">
			</div>

			<button type="submit" class="btn-register">Register</button>
		</form>

		<div class="login-link">
			Already have an account? <a href="login.jsp">Login here</a>
		</div>
	</div>

	<script>
		function validateForm() {
			var name = document.getElementById('name').value.trim();
			var email = document.getElementById('email').value.trim();
			var password = document.getElementById('password').value;

			if (name === '') {
				alert('Please enter your name');
				return false;
			}
			if (email === '') {
				alert('Please enter your email');
				return false;
			}
			if (password.length < 6) {
				alert('Password must be at least 6 characters long');
				return false;
			}
			return true;
		}
	</script>
</body>
</html>