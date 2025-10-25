<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Remove Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	.remove-product-container {
		margin-top: 50px;
		margin-bottom: 30px;
	}
	
	.remove-product-card {
		background: linear-gradient(135deg, #ffffff 0%, #fff5f0 100%);
		border: none;
		border-radius: 20px;
		box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
		padding: 40px;
		position: relative;
		overflow: hidden;
	}
	
	.remove-product-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		height: 5px;
		background: linear-gradient(90deg, #d32f2f 0%, #f44336 50%, #d32f2f 100%);
	}
	
	.remove-product-header {
		text-align: center;
		margin-bottom: 35px;
	}
	
	.remove-product-header h2 {
		color: #d32f2f;
		font-weight: 700;
		font-size: 2.5rem;
		margin-bottom: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 15px;
	}
	
	.remove-product-header h2 i {
		color: #d32f2f;
		font-size: 2.2rem;
		animation: shake 2s infinite;
	}
	
	@keyframes shake {
		0%, 100% {
			transform: rotate(0deg);
		}
		25% {
			transform: rotate(-5deg);
		}
		75% {
			transform: rotate(5deg);
		}
	}
	
	.remove-product-header p {
		color: #666;
		font-size: 1rem;
		margin-top: 5px;
	}
	
	.warning-box {
		background: linear-gradient(135deg, #fff3e0 0%, #ffe0b2 100%);
		border-left: 4px solid #ff9800;
		padding: 15px 20px;
		border-radius: 10px;
		margin-bottom: 25px;
		color: #e65100;
		font-weight: 500;
		display: flex;
		align-items: center;
		gap: 10px;
	}
	
	.warning-box i {
		font-size: 1.5rem;
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
		color: #d32f2f;
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
		border-color: #d32f2f;
		box-shadow: 0 0 0 0.2rem rgba(211, 47, 47, 0.15);
		background-color: #fff8f8;
	}
	
	.form-control:hover {
		border-color: #f44336;
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
	
	.btn-cancel {
		background: linear-gradient(135deg, #2196F3 0%, #1976D2 100%);
		color: white;
	}
	
	.btn-cancel:hover {
		background: linear-gradient(135deg, #1976D2 0%, #1565C0 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(33, 150, 243, 0.4);
		color: white;
	}
	
	.btn-remove {
		background: linear-gradient(135deg, #f44336 0%, #d32f2f 100%);
		color: white;
	}
	
	.btn-remove:hover {
		background: linear-gradient(135deg, #d32f2f 0%, #c62828 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(244, 67, 54, 0.4);
		color: white;
	}
	
	.button-container {
		margin-top: 30px;
		display: flex;
		gap: 15px;
		justify-content: center;
	}
	
	/* Responsive */
	@media (max-width: 768px) {
		.remove-product-card {
			padding: 25px;
		}
		
		.remove-product-header h2 {
			font-size: 1.8rem;
		}
		
		.button-container {
			flex-direction: column;
		}
		
		.btn-custom {
			width: 100%;
		}
	}
</style>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
/* Checking the user credentials */
String userType = (String) session.getAttribute("usertype");
String userName = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");

if (userType == null || !userType.equals("admin")) {

response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

}

else if (userName == null || password == null) {

response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

}
%>

<jsp:include page="header.jsp" />

<%
String message = request.getParameter("message");
%>

<div class="container remove-product-container">
	<div class="row justify-content-center">
		<div class="col-lg-5 col-md-7 col-sm-9">
			<div class="remove-product-card">
				<div class="remove-product-header">
					<h2>
						<i class="fas fa-trash-alt"></i>
						Product Deletion Form
					</h2>
					<p>Remove products from your inventory</p>
				</div>
				
				<div class="warning-box">
					<i class="fas fa-exclamation-triangle"></i>
					<span>Warning: This action cannot be undone!</span>
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
				
				<form action="./RemoveProductSrv" method="post">
					<div class="input-group-custom">
						<label for="prodid" class="form-label">
							<i class="fas fa-barcode"></i> Product ID
						</label>
						<input type="text" name="prodid" class="form-control" 
							id="prodid" placeholder="Enter Product ID to remove" required>
					</div>
					
					<div class="button-container">
						<a href="adminViewProduct.jsp" class="btn btn-cancel">
							<i class="fas fa-times-circle"></i> Cancel
						</a>
						<button type="submit" class="btn btn-remove">
							<i class="fas fa-trash-alt"></i> Remove Product
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>
</body>
</html>