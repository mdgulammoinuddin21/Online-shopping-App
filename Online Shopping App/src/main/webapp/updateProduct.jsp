<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.rockstar.service.impl.*,com.rockstar.service.*,com.rockstar.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>
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
	
	.update-product-container {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	.update-product-card {
		background: linear-gradient(135deg, #ffffff 0%, #fff5f0 100%);
		border: none;
		border-radius: 20px;
		box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
		padding: 40px;
		position: relative;
		overflow: hidden;
	}
	
	.update-product-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		height: 5px;
		background: linear-gradient(90deg, #FF9800 0%, #FFC107 50%, #FF9800 100%);
	}
	
	.update-product-header {
		text-align: center;
		margin-bottom: 35px;
	}
	
	.product-image-container {
		margin-bottom: 20px;
		display: flex;
		justify-content: center;
	}
	
	.product-image {
		max-height: 150px;
		border-radius: 15px;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		border: 3px solid #fff;
		transition: all 0.3s ease;
	}
	
	.product-image:hover {
		transform: scale(1.05);
		box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
	}
	
	.update-product-header h2 {
		color: #FF9800;
		font-weight: 700;
		font-size: 2.5rem;
		margin-bottom: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 15px;
	}
	
	.update-product-header h2 i {
		color: #FF9800;
		font-size: 2.2rem;
		animation: rotate 3s linear infinite;
	}
	
	@keyframes rotate {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}
	
	.update-product-header p {
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
		color: #FF9800;
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
		border-color: #FF9800;
		box-shadow: 0 0 0 0.2rem rgba(255, 152, 0, 0.15);
		background-color: #fffbf5;
	}
	
	.form-control:hover, .form-select:hover {
		border-color: #FFC107;
	}
	
	textarea.form-control {
		resize: vertical;
		min-height: 100px;
		text-align: left;
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
		background: linear-gradient(135deg, #f44336 0%, #d32f2f 100%);
		color: white;
	}
	
	.btn-cancel:hover {
		background: linear-gradient(135deg, #d32f2f 0%, #c62828 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(244, 67, 54, 0.4);
		color: white;
	}
	
	.btn-update {
		background: linear-gradient(135deg, #FF9800 0%, #F57C00 100%);
		color: white;
	}
	
	.btn-update:hover {
		background: linear-gradient(135deg, #F57C00 0%, #E65100 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(255, 152, 0, 0.4);
		color: white;
	}
	
	.button-container {
		margin-top: 30px;
		display: flex;
		gap: 15px;
		justify-content: center;
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
	
	/* Product ID Badge */
	.product-id-badge {
		display: inline-block;
		background: linear-gradient(135deg, #FF9800 0%, #F57C00 100%);
		color: white;
		padding: 8px 20px;
		border-radius: 20px;
		font-weight: 600;
		font-size: 0.9rem;
		margin-bottom: 15px;
		box-shadow: 0 2px 10px rgba(255, 152, 0, 0.3);
	}
	
	/* Responsive */
	@media (max-width: 768px) {
		.update-product-card {
			padding: 25px;
		}
		
		.update-product-header h2 {
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
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String pwd = (String) session.getAttribute("password");
	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null || pwd == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="header.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	
	<div class="container update-product-container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="update-product-card">
					<div class="update-product-header">
						<div class="product-image-container">
							<img src="./ShowImage?pid=<%=product.getProdId()%>"
								alt="Product Image" class="product-image" />
						</div>
						<div class="product-id-badge">
							<i class="fas fa-barcode"></i> Product ID: <%=product.getProdId()%>
						</div>
						<h2>
							<i class="fas fa-sync-alt"></i>
							Product Update Form
						</h2>
						<p>Modify product details and inventory</p>
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
					
					<form action="./UpdateProductSrv" method="post">
						<input type="hidden" name="pid" value="<%=product.getProdId()%>">
						
						<div class="row">
							<div class="col-md-6 input-group-custom">
								<label for="productName" class="form-label">
									<i class="fas fa-box"></i> Product Name
								</label>
								<input type="text" name="name" class="form-control" 
									id="productName" value="<%=product.getProdName()%>"
									placeholder="Enter product name" required>
							</div>
							
							<div class="col-md-6 input-group-custom">
								<%
								String ptype = product.getProdType();
								%>
								<label for="producttype" class="form-label">
									<i class="fas fa-tags"></i> Product Type
								</label>
								<select name="type" id="producttype" class="form-select" required>
									<option value="mobile"
										<%="mobile".equalsIgnoreCase(ptype) ? "selected" : ""%>>MOBILE</option>
									<option value="tv"
										<%="tv".equalsIgnoreCase(ptype) ? "selected" : ""%>>TV</option>
									<option value="camera"
										<%="camera".equalsIgnoreCase(ptype) ? "selected" : ""%>>CAMERA</option>
									<option value="laptop"
										<%="laptop".equalsIgnoreCase(ptype) ? "selected" : ""%>>LAPTOP</option>
									<option value="tablet"
										<%="tablet".equalsIgnoreCase(ptype) ? "selected" : ""%>>TABLET</option>
									<option value="speaker"
										<%="speaker".equalsIgnoreCase(ptype) ? "selected" : ""%>>SPEAKER</option>
									<option value="other"
										<%="other".equalsIgnoreCase(ptype) ? "selected" : ""%>>Some Other Appliances</option>
								</select>
							</div>
						</div>
						
						<div class="input-group-custom">
							<label for="productInfo" class="form-label">
								<i class="fas fa-align-left"></i> Product Description
							</label>
							<textarea name="info" class="form-control" id="productInfo" required><%=product.getProdInfo()%></textarea>
						</div>
						
						<div class="row">
							<div class="col-md-6 input-group-custom">
								<label for="price" class="form-label">
									<i class="fas fa-rupee-sign"></i> Unit Price
								</label>
								<input type="number" name="price" class="form-control" 
									id="price" value="<%=product.getProdPrice()%>"
									placeholder="Enter unit price" required>
							</div>
							
							<div class="col-md-6 input-group-custom">
								<label for="quantity" class="form-label">
									<i class="fas fa-cubes"></i> Stock Quantity
								</label>
								<input type="number" name="quantity" class="form-control" 
									id="quantity" value="<%=product.getProdQuantity()%>"
									placeholder="Enter stock quantity" required>
							</div>
						</div>
						
						<div class="button-container">
							<button formaction="adminViewProduct.jsp" class="btn btn-cancel">
								<i class="fas fa-times-circle"></i> Cancel
							</button>
							<button type="submit" class="btn btn-update">
								<i class="fas fa-check-circle"></i> Update Product
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