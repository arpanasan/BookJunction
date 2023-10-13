<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.DB.DbConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDAOImp"%>
<%@ page import="com.entity.book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7;">
	<%@include file="AllComponent/navbar.jsp"%>
	
	<%
	  int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImp  dao=new BookDAOImp(DbConnect.getConnection());
	book b=dao.getBookById(bid);
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="img/<%=b.getPhoto() %>" style="height: 170px; width: 120px;"><br>
				<h5 class="mt-3">
					BookName: <span class="text-success"><%=b.getBookname() %></span>
				</h5>
				<h5 class="mt-3">
					Author: <span class="text-success"><%=b.getAuthor() %></span>
				</h5>
				<h5>
					category: <span class="text-success"><%=b.getBookCategory() %></span>
				</h5>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname() %></h2>
				
				<%
				if("Old Book".equals(b.getBookCategory())){
					%>
					<h5 class="text-center text-success" > Contact To Seller</h5>
					<h5 class="text-center text-success"><i class="fa-solid fa-at"></i>Email:<%=b.getUser_email() %></h5>
					
					
					<%
				}
				
				
				
				%>
				
				
				<div class="row ">
					<div class="col-md-4 text-danger text-center">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Avaliable</p>
					</div>
					<div class="col-md-4 text-danger text-center">
						<i class="fa-solid fa-truck-moving fa-2x"> </i>
						<p>Free Shiping</p>
					</div>

</div>

                	<%
				if("Old Book".equals(b.getBookCategory())){
					%>
					
				<div class="text-center">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-plus"></i>Continue Shopping</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
				</div>
					
					
					<%
				}
				
				else{
					%>
					
				<div class="text-center">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
				</div>
					
					<%
				}
				
				
				%>


				

			</div>
		</div>
	</div>
</body>
</html>