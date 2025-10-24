<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.rockstar.service.impl.*,com.rockstar.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
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
	}
	
	/* Company Header Styles */
	.company-header {
		background: #00008B;
		color: white;
		padding: 5px 20px;
		margin-top: 0;
		padding-top: 65px;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
		border-radius: 0 0 15px 15px;
	}
	
	.company-header h2 {
		font-weight: 700;
		font-size: 2.2rem;
		margin-bottom: 2px;
		text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
		letter-spacing: 1px;
	}
	
	.company-header h6 {
		font-weight: 400;
		font-size: 1rem;
		opacity: 0.9;
		margin-bottom: 8px;
	}
	
	.search-container {
		max-width: 600px;
		margin: 20px auto 0;
	}
	
	.search-input-group {
		position: relative;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
		border-radius: 50px;
		overflow: hidden;
	}
	
	.search-input-group input[type="text"] {
		border: none;
		padding: 15px 25px;
		font-size: 16px;
		border-radius: 50px 0 0 50px;
	}
	
	.search-input-group input[type="text"]:focus {
		box-shadow: none;
		outline: none;
	}
	
	.search-input-group .btn-search {
		background: linear-gradient(135deg, #e53935 0%, #d32f2f 100%);
		border: none;
		color: white;
		padding: 15px 35px;
		font-weight: 600;
		border-radius: 0 50px 50px 0;
		transition: all 0.3s ease;
	}
	
	.search-input-group .btn-search:hover {
		background: linear-gradient(135deg, #c62828 0%, #b71c1c 100%);
		transform: translateY(-2px);
		box-shadow: 0 6px 20px rgba(229, 57, 53, 0.4);
	}
	
	#message {
		color: #1976d2;
		font-weight: 600;
		margin-top: 10px;
		text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
	}
	
	/* Modern Navbar Styles */
	.navbar {
		background: linear-gradient(135deg, #ffffff 0%, #f5f5f5 100%) !important;
		box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
		padding: 15px 0;
		border-bottom: 3px solid #1a237e;
	}
	
	.navbar-brand {
		font-weight: 700;
		font-size: 1.5rem;
		color: #1a237e !important;
		transition: all 0.3s ease;
	}
	
	.navbar-brand:hover {
		color: #3949ab !important;
		transform: scale(1.05);
	}
	
	.navbar-brand i {
		margin-right: 8px;
		color: #e53935;
	}
	
	.nav-link {
		color: #424242 !important;
		font-weight: 500;
		padding: 10px 20px !important;
		margin: 0 5px;
		border-radius: 8px;
		transition: all 0.3s ease;
		position: relative;
	}
	
	.nav-link:hover {
		color: #1a237e !important;
		background-color: #e8eaf6;
		transform: translateY(-2px);
	}
	
	.nav-link::after {
		content: '';
		position: absolute;
		bottom: 5px;
		left: 50%;
		transform: translateX(-50%);
		width: 0;
		height: 2px;
		background: #e53935;
		transition: width 0.3s ease;
	}
	
	.nav-link:hover::after {
		width: 80%;
	}
	
	.dropdown-menu {
		border: none;
		box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
		border-radius: 12px;
		padding: 10px;
		margin-top: 10px;
	}
	
	.dropdown-item {
		padding: 10px 20px;
		border-radius: 8px;
		transition: all 0.3s ease;
		font-weight: 500;
	}
	
	.dropdown-item:hover {
		background: linear-gradient(135deg, #e8eaf6 0%, #c5cae9 100%);
		color: #1a237e;
		transform: translateX(5px);
	}
	
	/* Cart Badge Styles */
	.cart-icon-container {
		position: relative;
		display: inline-block;
		padding: 5px 15px;
	}
	
	.cart-badge {
		position: relative;
		font-size: 1.8rem;
		color: #424242;
		transition: all 0.3s ease;
	}
	
	.cart-badge:hover {
		color: #e53935;
		transform: scale(1.1);
	}
	
	.cart-badge[data-count]::after {
		content: attr(data-count);
		position: absolute;
		top: -8px;
		right: -12px;
		background: linear-gradient(135deg, #e53935 0%, #c62828 100%);
		color: white;
		border-radius: 50%;
		padding: 4px 8px;
		font-size: 0.75rem;
		font-weight: 700;
		min-width: 22px;
		height: 22px;
		display: flex;
		align-items: center;
		justify-content: center;
		box-shadow: 0 2px 8px rgba(229, 57, 53, 0.4);
		animation: pulse 2s infinite;
	}
	
	@keyframes pulse {
		0%, 100% {
			transform: scale(1);
		}
		50% {
			transform: scale(1.1);
		}
	}
	
	/* Responsive Design */
	@media (max-width: 768px) {
		.company-header h2 {
			font-size: 1.8rem;
		}
		
		.navbar-brand {
			font-size: 1.2rem;
		}
		
		.nav-link {
			margin: 5px 0;
		}
	}
	
	/* Smooth Scroll */
	html {
		scroll-behavior: smooth;
	}
	
	/* Button Hover Effects */
	.navbar-toggler {
		border: 2px solid #1a237e;
		padding: 8px 12px;
	}
	
	.navbar-toggler:focus {
		box-shadow: 0 0 0 0.2rem rgba(26, 35, 126, 0.25);
	}
</style>

<!-- Bootstrap 5 JS and Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!--Company Header Starting  -->
	<div class="container-fluid company-header text-center">
		<h2><i class="fas fa-bolt"></i> Rockstar Electronics</h2>
		<h6>By CUTM Students</h6>
		<form action="index.jsp" method="get">
			<div class="search-container">
				<div class="input-group search-input-group">
					<input type="text" class="form-control" name="search"
						placeholder="Search for electronics, gadgets & more..." required>
					<input type="submit" class="btn btn-search" value="Search" />
				</div>
			</div>
		</form>
		<p align="center" id="message"></p>
	</div>
	<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">
				<i class="fas fa-home"></i>Shopping Center
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarNav" aria-controls="navbarNav" 
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="login.jsp">
							<i class="fas fa-sign-in-alt"></i> Login
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="register.jsp">
							<i class="fas fa-user-plus"></i> Register
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="index.jsp">
							<i class="fas fa-shopping-bag"></i> Products
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="categoryDropdown" 
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-th-large"></i> Category
						</a>
						<ul class="dropdown-menu" aria-labelledby="categoryDropdown">
							<li><a class="dropdown-item" href="index.jsp?type=mobile">
								<i class="fas fa-mobile-alt"></i> Mobiles</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=tv">
								<i class="fas fa-tv"></i> TVs</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=laptop">
								<i class="fas fa-laptop"></i> Laptops</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=camera">
								<i class="fas fa-camera"></i> Camera</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=speaker">
								<i class="fas fa-volume-up"></i> Speakers</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=tablet">
								<i class="fas fa-tablet-alt"></i> Tablets</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="userHome.jsp">
				<i class="fas fa-home"></i>Shopping Center
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarNav" aria-controls="navbarNav" 
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="userHome.jsp">
							<i class="fas fa-shopping-bag"></i> Products
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="categoryDropdown" 
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-th-large"></i> Category
						</a>
						<ul class="dropdown-menu" aria-labelledby="categoryDropdown">
							<li><a class="dropdown-item" href="userHome.jsp?type=mobile">
								<i class="fas fa-mobile-alt"></i> Mobiles</a></li>
							<li><a class="dropdown-item" href="userHome.jsp?type=tv">
								<i class="fas fa-tv"></i> TV</a></li>
							<li><a class="dropdown-item" href="userHome.jsp?type=laptop">
								<i class="fas fa-laptop"></i> Laptops</a></li>
							<li><a class="dropdown-item" href="userHome.jsp?type=camera">
								<i class="fas fa-camera"></i> Camera</a></li>
							<li><a class="dropdown-item" href="userHome.jsp?type=speaker">
								<i class="fas fa-volume-up"></i> Speakers</a></li>
							<li><a class="dropdown-item" href="userHome.jsp?type=tablet">
								<i class="fas fa-tablet-alt"></i> Tablets</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="cartDetails.jsp">
							<span class="cart-icon-container">
								<%
								if (notf == 0) {
								%>
								<i class="fas fa-shopping-cart cart-badge"></i>
								<%
								} else {
								%>
								<i class="fas fa-shopping-cart cart-badge" data-count="<%=notf%>"></i>
								<%
								}
								%>
							</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="orderDetails.jsp">
							<i class="fas fa-box"></i> Orders
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="userProfile.jsp">
							<i class="fas fa-user-circle"></i> Profile
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="./LogoutSrv">
							<i class="fas fa-sign-out-alt"></i> Logout
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="adminViewProduct.jsp">
				<i class="fas fa-home"></i>Shopping Center
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarNav" aria-controls="navbarNav" 
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="adminViewProduct.jsp">
							<i class="fas fa-shopping-bag"></i> Products
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="categoryDropdown" 
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-th-large"></i> Category
						</a>
						<ul class="dropdown-menu" aria-labelledby="categoryDropdown">
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=mobile">
								<i class="fas fa-mobile-alt"></i> Mobiles</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=tv">
								<i class="fas fa-tv"></i> Tvs</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=laptop">
								<i class="fas fa-laptop"></i> Laptops</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=camera">
								<i class="fas fa-camera"></i> Camera</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=speaker">
								<i class="fas fa-volume-up"></i> Speakers</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=tablet">
								<i class="fas fa-tablet-alt"></i> Tablets</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="adminStock.jsp">
							<i class="fas fa-warehouse"></i> Stock
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="shippedItems.jsp">
							<i class="fas fa-shipping-fast"></i> Shipped
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="unshippedItems.jsp">
							<i class="fas fa-clipboard-list"></i> Orders
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="updateDropdown" 
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-edit"></i> Update Items
						</a>
						<ul class="dropdown-menu" aria-labelledby="updateDropdown">
							<li><a class="dropdown-item" href="addProduct.jsp">
								<i class="fas fa-plus-circle"></i> Add Product</a></li>
							<li><a class="dropdown-item" href="removeProduct.jsp">
								<i class="fas fa-trash-alt"></i> Remove Product</a></li>
							<li><a class="dropdown-item" href="updateProductById.jsp">
								<i class="fas fa-sync-alt"></i> Update Product</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="./LogoutSrv">
							<i class="fas fa-sign-out-alt"></i> Logout
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
</body>
</html>