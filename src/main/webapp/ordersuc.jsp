<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success</title>
<%@ include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #e8f5e9">
<%@ include file="AllComponent/navbar.jsp"%>
 <div class="container text-center mt-3">
 <i class="fas fa-check-circle fa-5x text-success"></i>
 <h1>Thankyou:)</h1>
 <h2>Your Order Has Been Successfully Placed!</h2>
 <h5>Your product will be delivered within 7 Days</h5>
 <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
  <a href="Order.jsp" class="btn btn-danger mt-3">View Order</a>
 </div>
</body>
</html>