<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #e8f5e9">
	<%@include file="navbar.jsp"%>
	<div class="container p-4 ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-sucess">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>


						<form action="../add_books" enctype="multipart/form-data"
							method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputAuthor1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputAuthor1"
									aria-describedby="emailHelp" name="aname">
							</div>
							<div class="form-group">
								<label for="exampleInputPrice">Price*</label> <input
									type="number" class="form-control" id="exampleInputPrice"
									aria-describedby="emailHelp" name="price">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Book Categories</label> <select
									type="text" class="form-control" name="btype"
									id="exampleInputPassword1">
									<option selected>---select---</option>
									<option value="New Book">New Book</option>

								</select>
							</div>
							<div class="form-group">
								<label for=inputstate">Book Status</label> <select type="text"
									class="form-control" name="bstatus" id="inputstate">
									<option selected>---select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>


							</div>
							<div class="form-group">
								<label for="exampleInputFile1">Upload Photo</label> <input
									type="file" class="form-control" name="bimg"
									id="exampleInputFile1">
							</div>
							<button type="submit text-center"
								class="btn btn-primary text-center">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 105px;">
		<%@ include file="Footer.jsp"%></div>
</body>
</html>