<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7;">
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
					<div class="card-body ">
					<h5 class="text-center text-success p-1">Edit Profile</h5>
					  <div class="form-row">
								
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
							
							
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								
								
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
								
								
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pincode</label> <input type=""
										class="form-control" id="inputPassword4" >
								</div>
							</div>
					     <div class="text-center p-2">
							<button type="submit" class="btn  btn-center btn-warning text-white">Add Address</button>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="AllComponent/Footer.jsp"%>
</body>
</html>