<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page
import="com.rockstar.service.impl.*,com.rockstar.service.*,com.rockstar.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Rockstar Electronics</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body {
    background: linear-gradient(135deg, #E6F9E6 0%, #F0FFF0 100%);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height: 100vh;
}

.page-header-section {
    background: linear-gradient(135deg, #2E7D32 0%, #4CAF50 100%);
    padding: 30px 0;
    margin-bottom: 40px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.page-title {
    color: white;
    font-size: 28px;
    font-weight: 700;
    text-align: center;
    margin: 0;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
}

#message {
    color: #2E7D32;
    font-size: 16px;
    font-weight: 600;
    margin: 20px 0;
    padding: 10px;
    background: rgba(76, 175, 80, 0.1);
    border-radius: 5px;
}

.products-container {
    padding: 20px 0 60px 0;
}

.product-card {
    height: 480px;
    margin-bottom: 30px;
    transition: all 0.3s ease;
}

.thumbnail {
    border: none;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    padding: 20px;
    height: 100%;
    background: white;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
}

.thumbnail:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 24px rgba(0,0,0,0.15);
}

.product-image-wrapper {
    height: 180px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    overflow: hidden;
}

.product-image-wrapper img {
    max-height: 100%;
    max-width: 100%;
    object-fit: contain;
    transition: transform 0.3s ease;
}

.thumbnail:hover .product-image-wrapper img {
    transform: scale(1.05);
}

.productname {
    font-size: 18px;
    font-weight: 700;
    color: #212529;
    margin: 15px 0 10px 0;
    min-height: 50px;
    line-height: 1.3;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.productinfo {
    font-size: 13px;
    color: #6c757d;
    margin: 10px 0;
    line-height: 1.5;
    min-height: 60px;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.price {
    font-size: 24px;
    font-weight: 800;
    color: #2E7D32;
    margin: 15px 0;
    padding: 8px 0;
    border-top: 2px solid #e9ecef;
    border-bottom: 2px solid #e9ecef;
}

.product-actions {
    margin-top: auto;
    padding-top: 15px;
}

.btn {
    border-radius: 6px;
    font-weight: 600;
    padding: 10px 20px;
    transition: all 0.3s ease;
    border: none;
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 0.5px;
}

.btn-success {
    background: linear-gradient(135deg, #2E7D32 0%, #4CAF50 100%);
    box-shadow: 0 2px 4px rgba(46, 125, 50, 0.3);
}

.btn-success:hover {
    background: linear-gradient(135deg, #1B5E20 0%, #2E7D32 100%);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(46, 125, 50, 0.4);
}

.btn-primary {
    background: linear-gradient(135deg, #1976D2 0%, #2196F3 100%);
    box-shadow: 0 2px 4px rgba(25, 118, 210, 0.3);
}

.btn-primary:hover {
    background: linear-gradient(135deg, #0D47A1 0%, #1976D2 100%);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(25, 118, 210, 0.4);
}

.btn-danger {
    background: linear-gradient(135deg, #C62828 0%, #E53935 100%);
    box-shadow: 0 2px 4px rgba(198, 40, 40, 0.3);
}

.btn-danger:hover {
    background: linear-gradient(135deg, #B71C1C 0%, #C62828 100%);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(198, 40, 40, 0.4);
}

.btn-block {
    width: 100%;
    margin-bottom: 8px;
}

.no-products-message {
    text-align: center;
    padding: 60px 20px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    margin: 40px auto;
    max-width: 600px;
}

.no-products-message h3 {
    color: #6c757d;
    font-weight: 600;
}

@media (max-width: 768px) {
    .product-card {
        height: auto;
        min-height: 450px;
    }
    
    .page-title {
        font-size: 22px;
    }
    
    .btn {
        padding: 8px 15px;
        font-size: 11px;
    }
}
</style>
</head>
<body>

<%
/* Checking the user credentials */
String userName = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");
String userType = (String) session.getAttribute("usertype");

boolean isValidUser = true;

if (userType == null || userName == null || password == null || !userType.equals("customer")) {

isValidUser = false;
}

ProductServiceImpl prodDao = new ProductServiceImpl();
List<ProductBean> products = new ArrayList<ProductBean>();

String search = request.getParameter("search");
String type = request.getParameter("type");
String message = "All Products";
if (search != null) {
products = prodDao.searchAllProducts(search);
message = "Showing Results for '" + search + "'";
} else if (type != null) {
products = prodDao.getAllProductsByType(type);
message = "Showing Results for '" + type + "'";
} else {
products = prodDao.getAllProducts();
}
if (products.isEmpty()) {
message = "No items found for the search '" + (search != null ? search : type) + "'";
products = prodDao.getAllProducts();
}
%>

<jsp:include page="header.jsp" />

<div class="page-header-section">
    <div class="container">
        <h1 class="page-title"><%=message%></h1>
    </div>
</div>

<div class="text-center" id="message"></div>

<!-- Start of Product Items List -->
<div class="container products-container">
    <div class="row">

<%
for (ProductBean product : products) {
int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
%>
        <div class="col-sm-4 product-card">
            <div class="thumbnail">
                <div class="product-image-wrapper">
                    <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product">
                </div>
                <p class="productname"><%=product.getProdName()%></p>
<%
String description = product.getProdInfo();
description = description.substring(0, Math.min(description.length(), 100));
%>
                <p class="productinfo"><%=description%>..</p>
                <p class="price">Rs <%=product.getProdPrice()%></p>
                <div class="product-actions">
                    <form method="post">
<%
if (cartQty == 0) {
%>
                        <button type="submit"
                            formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
                            class="btn btn-success btn-block">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
                        </button>
                        <button type="submit"
                            formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
                            class="btn btn-primary btn-block">
                            <span class="glyphicon glyphicon-flash"></span> Buy Now
                        </button>
<%
} else {
%>
                        <button type="submit"
                            formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
                            class="btn btn-danger btn-block">
                            <span class="glyphicon glyphicon-remove"></span> Remove From Cart
                        </button>
                        <button type="submit" formaction="cartDetails.jsp"
                            class="btn btn-success btn-block">
                            <span class="glyphicon glyphicon-ok"></span> Checkout
                        </button>
<%
}
%>
                    </form>
                </div>
            </div>
        </div>

<%
}
%>

    </div>
</div>
<!-- End of Product Items List -->


<%@ include file="footer.html"%>

</body>
</html>