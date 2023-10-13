<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7;">

<c:if test="${empty userobj }">

		<c:redirect url="Login.jsp"></c:redirect>

	</c:if>
	
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container p-2">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
					<div class="card-body ">
						<h5 class="text-center text-primary p-1">Sell Old Book</h5>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-sucess">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<form action="add_old_book" enctype="multipart/form-data"
							method="post">
							
                                      	<input type="hidden" value="${userobj.email }" name="user">
								
						
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
								<label for="exampleInputFile1">Upload Photo</label> <input
									type="file" class="form-control" name="bimg"
									id="exampleInputFile1">
							</div>
							<button type="submit text-center"
								class="btn btn-primary text-center">Sell Book</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>