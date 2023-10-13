<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7d7;">
	<c:if test="${empty userobj }">

		<c:redirect url="Login.jsp"></c:redirect>

	</c:if>



	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<c:if test="${not empty userobj }">
              <h3 class="text-center">Hey!${userobj.name }</h3>
			
		</c:if>
		<div>
			
			<div class="row p-5">
				<div class="col-md-4">
					<a href="sell_book.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-primary">
									<i class="fa-solid fa-book-open fa-3x"></i>
								</div>
								<h4>Sell Old Book</h4>
							</div>
						</div>
					</a>

				</div>
				
				<div class="col-md-4">
					<a href="old_book.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-primary">
									<i class="fa-solid fa-book-open fa-3x"></i>
								</div>
								<h4>Old Book</h4>
							</div>
						</div>
					</a>

				</div>
				

				<div class="col-md-4">
					<a href="Edit_profie.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-primary">
									<i class="fa-solid fa-3x fa-pen-to-square"></i>
								</div>
								<h4>Edit Profile</h4>
							</div>
						</div>
					</a>

				</div>

				
				<div class="col-md-6 ">
					<a href="Order.jsp">
						<div class="card mt-3">
							<div class="card-body  text-center">
								<div class="text-danger">
									<i class="fa-solid fa-box-open fa-3x"></i>
								</div>
								<h4>My Order</h4>
								<p>Track Your Order</p>
							</div>
						</div>
					</a>

				</div>
				<div class="col-md-6 ">
					<a href="helpLine.jsp">
						<div class="card mt-3">
							<div class="card-body text-center">
								<div class="text-success ">
									<i class="fa-solid fa-user-circle fa-3x"></i>
								</div>
								<h4>Help Center</h4>
								<p>24*7 Service</p>
							</div>
						</div>
					</a>

				</div>

			</div>
		</div>
	</div>
	<%@include file="AllComponent/Footer.jsp"%>
</body>
</html>