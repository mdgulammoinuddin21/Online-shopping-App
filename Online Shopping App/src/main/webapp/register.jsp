<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
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
	
	.register-container {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	.register-card {
		background: linear-gradient(135deg, #ffffff 0%, #fff5f0 100%);
		border: none;
		border-radius: 20px;
		box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
		padding: 40px;
		position: relative;
		overflow: hidden;
	}
	
	.register-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		height: 5px;
		background: linear-gradient(90deg, #00008B 0%, #4169E1 50%, #00008B 100%);
	}
	
	.register-header {
		text-align: center;
		margin-bottom: 35px;
	}
	
	.register-header h2 {
		color: #00008B;
		font-weight: 700;
		font-size: 2.5rem;
		margin-bottom: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 15px;
	}
	
	.register-header h2 i {
		color: #28a745;
		font-size: 2.2rem;
	}
	
	.register-header p {
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
	
	textarea.form-control {
		resize: vertical;
		min-height: 100px;
	}
	
	.input-group-custom {
		margin-bottom: 20px;
	}
	
	.btn-custom {
		padding: 12px 40px;
		font-weight: 600;
		font-size: 1rem;
		border-radius: 10px;
		border: none;
		transition: all 0.3s ease;
		min-width: 140px;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		gap: 8px;
	}
	
	.btn-reset {
		background: linear-gradient(135deg, #f44336 0%, #d32f2f 100%);
		color: white;
	}
	
	.btn-reset:hover {
		background: linear-gradient(135deg, #d32f2f 0%, #c62828 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(244, 67, 54, 0.4);
		color: white;
	}
	
	.btn-register {
		background: linear-gradient(135deg, #4caf50 0%, #388e3c 100%);
		color: white;
	}
	
	.btn-register:hover {
		background: linear-gradient(135deg, #388e3c 0%, #2e7d32 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(76, 175, 80, 0.4);
		color: white;
	}
	
	.button-container {
		margin-top: 30px;
		display: flex;
		gap: 15px;
		justify-content: center;
	}
	
	.login-link {
		text-align: center;
		margin-top: 25px;
		padding-top: 25px;
		border-top: 2px dashed #e0e0e0;
	}
	
	.login-link a {
		color: #00008B;
		font-weight: 600;
		text-decoration: none;
		transition: all 0.3s ease;
	}
	
	.login-link a:hover {
		color: #4169E1;
		text-decoration: underline;
	}
	
	/* Input icons */
	.input-icon-wrapper {
		position: relative;
	}
	
	.input-icon {
		position: absolute;
		right: 15px;
		top: 50%;
		transform: translateY(-50%);
		color: #999;
		pointer-events: none;
	}
	
	/* Responsive */
	@media (max-width: 768px) {
		.register-card {
			padding: 25px;
		}
		
		.register-header h2 {
			font-size: 1.8rem;
		}
		
		.button-container {
			flex-direction: column;
		}
		
		.btn-custom {
			width: 100%;
		}
	}
	
	/* Password strength indicator */
	.password-strength {
		height: 4px;
		background: #e0e0e0;
		border-radius: 2px;
		margin-top: 5px;
		overflow: hidden;
	}
	
	.password-strength-bar {
		height: 100%;
		width: 0%;
		transition: all 0.3s ease;
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

<div class="container register-container">
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10">
			<div class="register-card">
				<div class="register-header">
					<h2>
						<i class="fas fa-user-plus"></i>
						Registration Form
					</h2>
					<p>Create your account to start shopping</p>
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
				
				<form action="./RegisterSrv" method="post">
					<div class="row">
						<div class="col-md-6 input-group-custom">
							<label for="username" class="form-label">
								<i class="fas fa-user"></i> Full Name
							</label>
							<input type="text" name="username" class="form-control" 
								id="username" placeholder="Enter your full name" required>
						</div>
						
						<div class="col-md-6 input-group-custom">
							<label for="email" class="form-label">
								<i class="fas fa-envelope"></i> Email Address
							</label>
							<input type="email" name="email" class="form-control" 
								id="email" placeholder="Enter your email" required>
						</div>
					</div>
					
					<div class="input-group-custom">
						<label for="address" class="form-label">
							<i class="fas fa-map-marker-alt"></i> Address
						</label>
						<textarea name="address" class="form-control" id="address"
							placeholder="Enter your complete address" required></textarea>
					</div>
					
					<div class="row">
						<div class="col-md-6 input-group-custom">
							<label for="mobile" class="form-label">
								<i class="fas fa-mobile-alt"></i> Mobile Number
							</label>
							<input type="number" name="mobile" class="form-control" 
								id="mobile" placeholder="Enter 10-digit mobile number" required>
						</div>
						
						<div class="col-md-6 input-group-custom">
							<label for="pincode" class="form-label">
								<i class="fas fa-map-pin"></i> Pin Code
							</label>
							<input type="number" name="pincode" class="form-control" 
								id="pincode" placeholder="Enter 6-digit pin code" required>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 input-group-custom">
							<label for="password" class="form-label">
								<i class="fas fa-lock"></i> Password
							</label>
							<input type="password" name="password" class="form-control" 
								id="password" placeholder="Create a strong password" required>
						</div>
						
						<div class="col-md-6 input-group-custom">
							<label for="confirmPassword" class="form-label">
								<i class="fas fa-lock"></i> Confirm Password
							</label>
							<input type="password" name="confirmPassword" class="form-control" 
								id="confirmPassword" placeholder="Re-enter your password" required>
						</div>
					</div>
					
					<div class="button-container">
						<button type="reset" class="btn btn-reset">
							<i class="fas fa-redo"></i> Reset
						</button>
						<button type="submit" class="btn btn-register">
							<i class="fas fa-check-circle"></i> Register
						</button>
					</div>
					
					<div class="login-link">
						<p>Already have an account? <a href="login.jsp">Login here</a></p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>
</body>
</html>