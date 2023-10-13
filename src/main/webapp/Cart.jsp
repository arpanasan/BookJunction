<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DAO.*"%>
<%@ page import="com.DB.*"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@ include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #e8f5e9">
<%@ include file="AllComponent/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success alert-center text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">

		<div class="alert alert-danger alert-center text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>





	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 ">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">BookName</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								user u = (user) session.getAttribute("userobj");
								CartDAOImp dao = new CartDAOImp(DbConnect.getConnection());
								List<Cart> c = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c1 : c) {
									totalPrice = c1.getTotal_price();
								%>

								<tr>
									<th scope="row"><%=c1.getBook_name()%></th>
									<td><%=c1.getAuthor()%></td>
									<td><%=c1.getPrice()%></td>
									<td><a href="remove?bid=<%=c1.getBid()%>&&uid=<%=c1.getUid() %>&&cid=<%=c1.getCid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>


								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6 ">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Order Details</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" name="uname"id="inputEmail4" required="required" value="${userobj.name}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" required="required" name="email"id="inputPassword4" value="${userobj.email}">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No</label> <input type="text"
										class="form-control"  required="required" name="phon" id="inputEmail4" value="${userobj.phno}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" required="required"  name="address"id="inputPassword4" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" required="required"  name="landmark" id="inputEmail4" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" required="required" name="city"id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control"required="required" name="state" id="inputEmail4" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type=""
										class="form-control" required="required" name="zip"id="inputPassword4" >
								</div>
							</div>
							<label class="my-1 mr-2" for="inlineFormCustomSelectPref">Payment
								Type</label> <select  name="payment" class="custom-select my-1 mr-sm-2"
								id="inlineFormCustomSelectPref">
								<option value="noselect"selected>Choose...</option>
								<option value="COD">COD</option>

							</select>
							<div class="text-center mt-2">
								<button class="btn btn-warning my-1">Order Now</button>
								<button href="index.jsp" class="btn btn-success my-1">Continue
									Shopping</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>