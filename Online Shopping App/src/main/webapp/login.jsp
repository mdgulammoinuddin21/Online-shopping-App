<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome 6 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/changes.css">

<style>
	* {
		font-family: 'Poppins', sans-serif;
	}
	
	body {
		background: linear-gradient(135deg, #E8F5E9 0%, #C8E6C9 100%);
		min-height: 100vh;
		padding-bottom: 50px;
	}
	
	.login-container {
		margin-top: 50px;
		margin-bottom: 30px;
	}
	
	.login-card {
		background: linear-gradient(135deg, #ffffff 0%, #fff5f0 100%);
		border: none;
		border-radius: 20px;
		box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
		padding: 40px;
		position: relative;
		overflow: hidden;
	}
	
	.login-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		height: 5px;
		background: linear-gradient(90deg, #00008B 0%, #4169E1 50%, #00008B 100%);
	}
	
	.login-header {
		text-align: center;
		margin-bottom: 35px;
	}
	
	.login-header h2 {
		color: #00008B;
		font-weight: 700;
		font-size: 2.5rem;
		margin-bottom: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 15px;
	}
	
	.login-header h2 i {
		color: #28a745;
		font-size: 2.2rem;
	}
	
	.login-header p {
		color: #666;
		font-size: 1rem;
		margin-top: 5px;
	}
	
	.message-box {
		background: linear-gradient(135deg, #E3F2FD 0%, #BBDEFB 100%);
		border-left: 4px solid #2196F3;
		padding: 15px 20px;
		border-radius: 10px;
		margin-bottom: 25px;
		color: #1976D2;
		font-weight: 500;
		animation: slideIn 0.5s ease-out;
	}
	
	@keyframes slideIn {
		from {
			opacity: 0;
			transform: translateY(-10px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}
	
	.form-label {
		font-weight: 600;
		color: #333;
		margin-bottom: 8px;
		font-size: 0.95rem;
		display: flex;
		align-items: center;
		gap: 8px;
	}
	
	.form-label i {
		color: #00008B;
		font-size: 0.9rem;
	}
	
	.form-control, .form-select {
		border: 2px solid #e0e0e0;
		border-radius: 10px;
		padding: 12px 15px;
		font-size: 0.95rem;
		transition: all 0.3s ease;
		background-color: #fff;
	}
	
	.form-control:focus, .form-select:focus {
		border-color: #00008B;
		box-shadow: 0 0 0 0.2rem rgba(0, 0, 139, 0.15);
		background-color: #f8f9ff;
	}
	
	.form-control:hover, .form-select:hover {
		border-color: #4169E1;
	}
	
	.input-group-custom {
		margin-bottom: 20px;
	}
	
	.btn-login {
		background: linear-gradient(135deg, #4caf50 0%, #388e3c 100%);
		color: white;
		padding: 12px 50px;
		font-weight: 600;
		font-size: 1.1rem;
		border-radius: 10px;
		border: none;
		transition: all 0.3s ease;
		width: 100%;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		gap: 10px;
		margin-top: 10px;
	}
	
	.btn-login:hover {
		background: linear-gradient(135deg, #388e3c 0%, #2e7d32 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(76, 175, 80, 0.4);
		color: white;
	}
	
	.register-link {
		text-align: center;
		margin-top: 25px;
		padding-top: 25px;
		border-top: 2px dashed #e0e0e0;
	}
	
	.register-link a {
		color: #00008B;
		font-weight: 600;
		text-decoration: none;
		transition: all 0.3s ease;
	}
	
	.register-link a:hover {
		color: #4169E1;
		text-decoration: underline;
	}
	
	/* Password toggle */
	.password-toggle {
		position: absolute;
		right: 15px;
		top: 50%;
		transform: translateY(-50%);
		cursor: pointer;
		color: #999;
		transition: color 0.3s ease;
	}
	
	.password-toggle:hover {
		color: #00008B;
	}
	
	.position-relative {
		position: relative;
	}
	
	/* Role selector styling */
	.form-select {
		cursor: pointer;
		appearance: none;
		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
		background-repeat: no-repeat;
		background-position: right 15px center;
		padding-right: 40px;
	}
	
	/* Responsive */
	@media (max-width: 768px) {
		.login-card {
			padding: 25px;
		}
		
		.login-header h2 {
			font-size: 1.8rem;
		}
	}
	
	/* Icon animations */
	.login-header i {
		animation: bounce 2s infinite;
	}
	
	@keyframes bounce {
		0%, 100% {
			transform: translateY(0);
		}
		50% {
			transform: translateY(-10px);
		}
	}
</style>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%@ include file="header.jsp"%>

<%
String message = request.getParameter("message");
%>

<div class="container login-container">
	<div class="row justify-content-center">
		<div class="col-lg-5 col-md-7 col-sm-9">
			<div class="login-card">
				<div class="login-header">
					<h2>
						<i class="fas fa-sign-in-alt"></i>
						Login Form
					</h2>
					<p>Welcome back! Please login to your account</p>
				</div>
				
				<%
				if (message != null) {
				%>
				<div class="message-box">
					<i class="fas fa-info-circle"></i> <%=message%>
				</div>
				<%
				}
				%>
				
				<form action="./LoginSrv" method="post">
					<div class="input-group-custom">
						<label for="username" class="form-label">
							<i class="fas fa-user"></i> Username
						</label>
						<input type="email" name="username" class="form-control" 
							id="username" placeholder="Enter your email" required>
					</div>
					
					<div class="input-group-custom">
						<label for="password" class="form-label">
							<i class="fas fa-lock"></i> Password
						</label>
						<div class="position-relative">
							<input type="password" name="password" class="form-control" 
								id="password" placeholder="Enter your password" required>
						</div>
					</div>
					
					<div class="input-group-custom">
						<label for="userrole" class="form-label">
							<i class="fas fa-user-tag"></i> Login As
						</label>
						<select name="usertype" id="userrole" class="form-select" required>
							<option value="customer" selected>CUSTOMER</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
					
					<button type="submit" class="btn btn-login">
						<i class="fas fa-sign-in-alt"></i> Login
					</button>
					
					<div class="register-link">
						<p>Don't have an account? <a href="register.jsp">Register here</a></p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>

</body>
</html>