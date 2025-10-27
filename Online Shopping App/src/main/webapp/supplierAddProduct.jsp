<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product - Supplier</title>
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

.form-container {
    background: white;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    margin-bottom: 40px;
}

.form-group label {
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
}

.form-control {
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    padding: 10px 15px;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #FF6F00;
    box-shadow: 0 0 0 0.2rem rgba(255, 111, 0, 0.15);
}

.btn-custom {
    padding: 12px 30px;
    border-radius: 8px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    border: none;
    margin-right: 10px;
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
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<%
String userName = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");
String userType = (String) session.getAttribute("usertype");

if (userType == null || userName == null || password == null || !userType.equals("supplier")) {

response.sendRedirect("login.jsp?message=Please Login First as Supplier!");
}
%>

<div class="page-header-section">
    <div class="container">
        <h1 class="page-title"><i class="fa fa-plus-circle"></i> Add New Product</h1>
    </div>
</div>

<div class="container">
    
<%
String message = request.getParameter("message");
%>

<%
if (message != null) {
%>
    <div class="text-center" id="message">
        <%=message%>
    </div>
<%
}
%>

    <div class="form-container">
        <form action="./SupplierAddProductSrv" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name"><i class="fa fa-tag"></i> Product Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter product name" required>
            </div>
            
            <div class="form-group">
                <label for="type"><i class="fa fa-list"></i> Product Type</label>
                <input type="text" class="form-control" id="type" name="type" placeholder="e.g., Mobile, Laptop, Tablet" required>
            </div>
            
            <div class="form-group">
                <label for="info"><i class="fa fa-info-circle"></i> Product Information</label>
                <textarea class="form-control" id="info" name="info" rows="4" placeholder="Enter product description and specifications" required></textarea>
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="price"><i class="fa fa-rupee"></i> Product Price</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="Enter price" required>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="quantity"><i class="fa fa-cubes"></i> Product Quantity</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="image"><i class="fa fa-image"></i> Product Image</label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                <small class="form-text text-muted">Please select a product image (JPG, PNG, etc.)</small>
            </div>
            
            <div class="text-center" style="margin-top: 30px;">
                <button type="submit" class="btn btn-success-custom btn-custom">
                    <i class="fa fa-check"></i> Add Product
                </button>
                <a href="supplierHome.jsp" class="btn btn-danger-custom btn-custom">
                    <i class="fa fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<%@ include file="footer.html"%>

</body>
</html>

