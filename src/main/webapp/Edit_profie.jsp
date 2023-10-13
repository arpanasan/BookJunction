<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<bodystyle="background-color:#f7f7d7;"> <%@include
	file="AllComponent/navbar.jsp"%>
<div class="container p-2">
<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card ">
				<div class="card-body ">
					<h5 class="text-center text-primary p-1">Edit Profile</h5>
						<c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
					
					<form action="update_profile" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
						<div class="form-group">
							<label for="exampleInputEmail1">Name</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="fname" required="required"
								value="${userobj.name }">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email" required="required"
								value="${userobj.email }">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone Number</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="phon" required="required"
								value="${userobj.password}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="password"
								id="exampleInputPassword1" required="required" >
						</div>
						<div class="text_center p-2">
							<button type="submit" class="btn btn-primary">Update</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="AllComponent/Footer.jsp"%>
</body>
</html>