<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Supplier Registration</title>
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
		background: linear-gradient(135deg, #FFF8E1 0%, #FFECB3 100%);
		min-height: 100vh;
		padding-bottom: 50px;
	}
	
	.register-container {
		margin-top: 50px;
		margin-bottom: 30px;
	}
	
	.register-card {
		background: linear-gradient(135deg, #ffffff 0%, #fff8f0 100%);
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
		background: linear-gradient(90deg, #FF6F00 0%, #FFA000 50%, #FF6F00 100%);
	}
	
	.register-header {
		text-align: center;
		margin-bottom: 35px;
	}
	
	.register-header h2 {
		color: #FF6F00;
		font-weight: 700;
		font-size: 2.5rem;
		margin-bottom: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 15px;
	}
	
	.register-header h2 i {
		color: #FF6F00;
		font-size: 2.2rem;
	}
	
	.register-header p {
		color: #666;
		font-size: 1rem;
		margin-top: 5px;
	}
	
	.message-box {
		background: linear-gradient(135deg, #FFE0B2 0%, #FFCC80 100%);
		border-left: 4px solid #FF6F00;
		padding: 15px 20px;
		border-radius: 10px;
		margin-bottom: 25px;
		color: #E65100;
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
		color: #FF6F00;
		font-size: 0.9rem;
	}
	
	.form-control {
		border: 2px solid #e0e0e0;
		border-radius: 10px;
		padding: 12px 15px;
		font-size: 0.95rem;
		transition: all 0.3s ease;
		background-color: #fff;
	}
	
	.form-control:focus {
		border-color: #FF6F00;
		box-shadow: 0 0 0 0.2rem rgba(255, 111, 0, 0.15);
		background-color: #fff8f5;
	}
	
	.form-control:hover {
		border-color: #FFA000;
	}
	
	.input-group-custom {
		margin-bottom: 20px;
	}
	
	.btn-register {
		background: linear-gradient(135deg, #FF6F00 0%, #FF8F00 100%);
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
	
	.btn-register:hover {
		background: linear-gradient(135deg, #E65100 0%, #FF6F00 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(255, 111, 0, 0.4);
		color: white;
	}
	
	.login-link {
		text-align: center;
		margin-top: 25px;
		padding-top: 25px;
		border-top: 2px dashed #e0e0e0;
	}
	
	.login-link a {
		color: #FF6F00;
		font-weight: 600;
		text-decoration: none;
		transition: all 0.3s ease;
	}
	
	.login-link a:hover {
		color: #FF8F00;
		text-decoration: underline;
	}
	
	.position-relative {
		position: relative;
	}
	
	/* Responsive */
	@media (max-width: 768px) {
		.register-card {
			padding: 25px;
		}
		
		.register-header h2 {
			font-size: 1.8rem;
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

<div class="container register-container">
	<div class="row justify-content-center">
		<div class="col-lg-6 col-md-8 col-sm-10">
			<div class="register-card">
				<div class="register-header">
					<h2>
						<i class="fas fa-store"></i>
						Supplier Registration
					</h2>
					<p>Create your supplier account to start managing products</p>
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
				
				<form action="./SupplierRegisterSrv" method="post">
					<div class="input-group-custom">
						<label for="username" class="form-label">
							<i class="fas fa-user"></i> Full Name
						</label>
						<input type="text" name="username" class="form-control" 
							id="username" placeholder="Enter your full name" required>
					</div>
					
					<div class="input-group-custom">
						<label for="email" class="form-label">
							<i class="fas fa-envelope"></i> Email ID
						</label>
						<input type="email" name="email" class="form-control" 
							id="email" placeholder="Enter your email" required>
					</div>
					
					<div class="input-group-custom">
						<label for="companyname" class="form-label">
							<i class="fas fa-building"></i> Company Name
						</label>
						<input type="text" name="companyname" class="form-control" 
							id="companyname" placeholder="Enter your company name" required>
					</div>
					
					<div class="input-group-custom">
						<label for="mobile" class="form-label">
							<i class="fas fa-phone"></i> Mobile Number
						</label>
						<input type="text" name="mobile" class="form-control" 
							id="mobile" placeholder="Enter your mobile number" required>
					</div>
					
					<div class="input-group-custom">
						<label for="address" class="form-label">
							<i class="fas fa-home"></i> Address
						</label>
						<textarea name="address" class="form-control" 
							id="address" rows="3" placeholder="Enter your address" required></textarea>
					</div>
					
					<div class="input-group-custom">
						<label for="pincode" class="form-label">
							<i class="fas fa-map-pin"></i> Pin Code
						</label>
						<input type="text" name="pincode" class="form-control" 
							id="pincode" placeholder="Enter your pin code" required>
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
						<label for="confirmPassword" class="form-label">
							<i class="fas fa-lock"></i> Confirm Password
						</label>
						<div class="position-relative">
							<input type="password" name="confirmPassword" class="form-control" 
								id="confirmPassword" placeholder="Confirm your password" required>
						</div>
					</div>
					
					<button type="submit" class="btn btn-register">
						<i class="fas fa-user-plus"></i> Register as Supplier
					</button>
					
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

