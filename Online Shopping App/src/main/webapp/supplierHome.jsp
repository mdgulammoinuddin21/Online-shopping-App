<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page
import="com.rockstar.service.impl.*,com.rockstar.service.*,com.rockstar.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Supplier Home - Rockstar Electronics</title>
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
    background: linear-gradient(135deg, #FFF8E1 0%, #FFECB3 100%);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height: 100vh;
}

.page-header-section {
    background: linear-gradient(135deg, #FF6F00 0%, #FF8F00 100%);
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

.action-buttons {
    margin-bottom: 30px;
    text-align: center;
}

.btn-custom {
    margin: 10px;
    padding: 12px 30px;
    border-radius: 8px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    border: none;
}

.btn-primary-custom {
    background: linear-gradient(135deg, #2196F3 0%, #1976D2 100%);
    color: white;
}

.btn-primary-custom:hover {
    background: linear-gradient(135deg, #0D47A1 0%, #1565C0 100%);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(25, 118, 210, 0.4);
    color: white;
}

.btn-success-custom {
    background: linear-gradient(135deg, #4CAF50 0%, #2E7D32 100%);
    color: white;
}

.btn-success-custom:hover {
    background: linear-gradient(135deg, #1B5E20 0%, #388E3C 100%);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(46, 125, 50, 0.4);
    color: white;
}

.btn-danger-custom {
    background: linear-gradient(135deg, #F44336 0%, #C62828 100%);
    color: white;
}

.btn-danger-custom:hover {
    background: linear-gradient(135deg, #B71C1C 0%, #D32F2F 100%);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(198, 40, 40, 0.4);
    color: white;
}

#message {
    color: #FF6F00;
    font-size: 16px;
    font-weight: 600;
    margin: 20px 0;
    padding: 15px;
    background: rgba(255, 111, 0, 0.1);
    border-radius: 8px;
    border-left: 4px solid #FF6F00;
}

.products-container {
    padding: 20px 0 60px 0;
}

.product-card {
    height: 500px;
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
    color: #FF6F00;
    margin: 15px 0;
    padding: 8px 0;
    border-top: 2px solid #e9ecef;
    border-bottom: 2px solid #e9ecef;
}

.product-actions {
    margin-top: auto;
    padding-top: 15px;
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
}
</style>
</head>
<body>

<%
/* Checking the supplier credentials */
String userName = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");
String userType = (String) session.getAttribute("usertype");

boolean isValidUser = true;

if (userType == null || userName == null || password == null || !userType.equals("supplier")) {

isValidUser = false;
response.sendRedirect("login.jsp?message=Please Login First as Supplier!");
}

ProductServiceImpl prodDao = new ProductServiceImpl();
List<ProductBean> products = new ArrayList<ProductBean>();

String message = request.getParameter("message");
%>

<jsp:include page="header.jsp" />

<div class="page-header-section">
    <div class="container">
        <h1 class="page-title"><i class="fa fa-store"></i> Welcome Supplier!</h1>
    </div>
</div>

<div class="text-center" id="message">
    <% if (message != null) { %>
        <%=message%>
    <% } %>
</div>

<div class="container action-buttons">
    <a href="supplierAddProduct.jsp" class="btn btn-custom btn-primary-custom">
        <i class="fa fa-plus"></i> Add New Product
    </a>
    <a href="supplierHome.jsp" class="btn btn-custom btn-success-custom">
        <i class="fa fa-refresh"></i> Refresh
    </a>
    <a href="LogoutSrv" class="btn btn-custom btn-danger-custom">
        <i class="fa fa-sign-out"></i> Logout
    </a>
</div>

<!-- Start of Product Items List -->
<div class="container products-container">
    <div class="row">

<%
products = prodDao.getProductsBySupplier(userName);
if (products.isEmpty()) {
%>
        <div class="col-12">
            <div class="no-products-message">
                <h3><i class="fa fa-inbox"></i> No Products Added Yet</h3>
                <p>Start by adding your first product to the catalog.</p>
            </div>
        </div>
<%
} else {
    for (ProductBean product : products) {
%>
        <div class="col-sm-4 product-card">
            <div class="thumbnail">
                <div class="product-image-wrapper">
                    <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product">
                </div>
                <p class="productname"><%=product.getProdName()%></p>
                <%
                String description = product.getProdInfo();
                if(description != null && description.length() > 100) {
                    description = description.substring(0, 100);
                }
                %>
                <p class="productinfo"><%=description%>..</p>
                <p class="price">Rs <%=product.getProdPrice()%></p>
                <p class="text-center"><strong>Stock: <%=product.getProdQuantity()%></strong></p>
                <div class="product-actions">
                    <form method="post">
                        <button type="submit" formaction="./SupplierRemoveProductSrv?prodid=<%=product.getProdId()%>"
                            class="btn btn-custom btn-danger-custom btn-block">
                            <span class="glyphicon glyphicon-trash"></span> Remove Product
                        </button>
                    </form>
                </div>
            </div>
        </div>
<%
    }
}
%>

    </div>
</div>
<!-- End of Product Items List -->


<%@ include file="footer.html"%>

</body>
</html>

