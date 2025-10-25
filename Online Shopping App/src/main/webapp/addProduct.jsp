<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
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
	
	.add-product-container {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	.add-product-card {
		background: linear-gradient(135deg, #ffffff 0%, #fff5f0 100%);
		border: none;
		border-radius: 20px;
		box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
		padding: 40px;
		position: relative;
		overflow: hidden;
	}
	
	.add-product-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		height: 5px;
		background: linear-gradient(90deg, #00008B 0%, #4169E1 50%, #00008B 100%);
	}
	
	.add-product-header {
		text-align: center;
		margin-bottom: 35px;
	}
	
	.add-product-header h2 {
		color: #00008B;
		font-weight: 700;
		font-size: 2.5rem;
		margin-bottom: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 15px;
	}
	
	.add-product-header h2 i {
		color: #28a745;
		font-size: 2.2rem;
	}
	
	.add-product-header p {
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
	
	.btn-add-product {
		background: linear-gradient(135deg, #4caf50 0%, #388e3c 100%);
		color: white;
	}
	
	.btn-add-product:hover {
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
	
	/* Custom file input styling */
	.file-input-wrapper {
		position: relative;
		overflow: hidden;
		display: inline-block;
		width: 100%;
	}
	
	.file-input-wrapper input[type=file] {
		position: absolute;
		left: -9999px;
	}
	
	.file-input-label {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 10px;
		padding: 12px 15px;
		background-color: #fff;
		border: 2px dashed #e0e0e0;
		border-radius: 10px;
		cursor: pointer;
		transition: all 0.3s ease;
		color: #666;
		font-weight: 500;
	}
	
	.file-input-label:hover {
		border-color: #00008B;
		background-color: #f8f9ff;
		color: #00008B;
	}
	
	.file-input-label i {
		font-size: 1.2rem;
		color: #00008B;
	}
	
	.file-name {
		margin-top: 8px;
		font-size: 0.85rem;
		color: #28a745;
		font-weight: 500;
		display: none;
	}
	
	/* Responsive */
	@media (max-width: 768px) {
		.add-product-card {
			padding: 25px;
		}
		
		.add-product-header h2 {
			font-size: 1.8rem;
		}
		
		.button-container {
			flex-direction: column;
		}
		
		.btn-custom {
			width: 100%;
		}
	}
	
	/* Select dropdown styling */
	.form-select {
		cursor: pointer;
		appearance: none;
		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
		background-repeat: no-repeat;
		background-position: right 15px center;
		padding-right: 40px;
	}
</style>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
	// File input handler
	function handleFileSelect(input) {
		const fileName = input.files[0]?.name;
		const fileNameDisplay = document.getElementById('fileName');
		if (fileName) {
			fileNameDisplay.textContent = 'Selected: ' + fileName;
			fileNameDisplay.style.display = 'block';
		} else {
			fileNameDisplay.style.display = 'none';
		}
	}
</script>
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
	
	<div class="container add-product-container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="add-product-card">
					<div class="add-product-header">
						<h2>
							<i class="fas fa-plus-circle"></i>
							Product Addition Form
						</h2>
						<p>Add new products to your inventory</p>
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
					
					<form action="./AddProductSrv" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6 input-group-custom">
								<label for="productName" class="form-label">
									<i class="fas fa-box"></i> Product Name
								</label>
								<input type="text" name="name" class="form-control" 
									id="productName" placeholder="Enter product name" required>
							</div>
							
							<div class="col-md-6 input-group-custom">
								<label for="producttype" class="form-label">
									<i class="fas fa-tags"></i> Product Type
								</label>
								<select name="type" id="producttype" class="form-select" required>
									<option value="mobile">MOBILE</option>
									<option value="tv">TV</option>
									<option value="camera">CAMERA</option>
									<option value="laptop">LAPTOP</option>
									<option value="tablet">TABLET</option>
									<option value="speaker">SPEAKER</option>
									<option value="other">Some Other Appliances</option>
								</select>
							</div>
						</div>
						
						<div class="input-group-custom">
							<label for="productInfo" class="form-label">
								<i class="fas fa-align-left"></i> Product Description
							</label>
							<textarea name="info" class="form-control" id="productInfo"
								placeholder="Enter detailed product description" required></textarea>
						</div>
						
						<div class="row">
							<div class="col-md-6 input-group-custom">
								<label for="price" class="form-label">
									<i class="fas fa-rupee-sign"></i> Unit Price
								</label>
								<input type="number" name="price" class="form-control" 
									id="price" placeholder="Enter unit price" required>
							</div>
							
							<div class="col-md-6 input-group-custom">
								<label for="quantity" class="form-label">
									<i class="fas fa-cubes"></i> Stock Quantity
								</label>
								<input type="number" name="quantity" class="form-control" 
									id="quantity" placeholder="Enter stock quantity" required>
							</div>
						</div>
						
						<div class="input-group-custom">
							<label class="form-label">
								<i class="fas fa-image"></i> Product Image
							</label>
							<div class="file-input-wrapper">
								<input type="file" name="image" id="productImage" 
									accept="image/*" onchange="handleFileSelect(this)" required>
								<label for="productImage" class="file-input-label">
									<i class="fas fa-cloud-upload-alt"></i>
									<span>Click to upload product image</span>
								</label>
							</div>
							<div id="fileName" class="file-name"></div>
						</div>
						
						<div class="button-container">
							<button type="reset" class="btn btn-reset">
								<i class="fas fa-redo"></i> Reset
							</button>
							<button type="submit" class="btn btn-add-product">
								<i class="fas fa-check-circle"></i> Add Product
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