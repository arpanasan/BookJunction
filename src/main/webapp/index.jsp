
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DbConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDAOImp"%>
<%@ page import="com.entity.book"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.user" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ebOOk : Index</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/BOOK.png");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f7e8d5;
}
</style>
</head>
<body style="background-color: #f7f7d7;">
 <%
   user u=(user)session.getAttribute("userobj"); %>
   
   
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Management System</h2>
	</div>

	<!-- start Recent Book -->

	<div class="container p-2">
		<h3 class="text-center mt-2">Recent Books</h3>

		<div class="row">

			<%
			BookDAOImp dao1 = new BookDAOImp(DbConnect.getConnection());
			List<book> list1 = dao1.getRecentBook();
			for (book b1 : list1) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b1.getPhoto()%>"
							style="width: 170px; height: 220px" class="img-thumblin">
						<p><%=b1.getBookname()%></p>
						<p><%=b1.getAuthor()%></p>
						<p>
							<%
							if (b1.getBookCategory().equals("Old Book")) {
							%>
							Categories:<%=b1.getBookCategory()%></p>

						<div class="row text-center">
							<a href="view_book.jsp?bid=<%=b1.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b1.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>


						<%
						} else {
						%>
						Categories:<%=b1.getBookCategory()%></p>
						<div class="row">
						 <%
						    if(u==null){
						    	%>
						    		<a href="Login.jsp" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a>
						    	
						    	<% 
						    }else{
						    	%>
						    	
						    		<a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a>
						    	
						    	<%
						    }
						   
						   %>
							 <a href="view_book.jsp?bid=<%=b1.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm "><%=b1.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>

		<div class="text-center mt-3">
			<a href="AllRecentBook.jsp" class="btn btn-danger btn-sm text-white ">View
				All</a>
		</div>

	</div>
	<hr>
	<!-- End Recent Book -->



	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImp dao = new BookDAOImp(DbConnect.getConnection());
			List<book> list = dao.getNewBook();
			for (book b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhoto()%>"
							style="width: 170px; height: 220px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%>
						<p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
							
						<div class="row">
						   <%
						    if(u==null){
						    	%>
						    		<a href="Login.jsp" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a>
						    	
						    	<% 
						    }else{
						    	%>
						    	
						    		<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a>
						    	
						    	<%
						    }
						   
						   %>
								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> 
								<a href=""class="btn btn-danger btn-sm "><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="AllNewBook.jsp" class="btn btn-danger btn-sm text-white ">View
				All</a>
		</div>
	</div>
	<!-- End New Book -->
	<hr>


	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOImp dao2 = new BookDAOImp(DbConnect.getConnection());
			List<book> list2 = dao2.getOldBook();
			for (book b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b2.getPhoto()%>"
							style="width: 170px; height: 220px" class="img-thumblin">
						<p><%=b2.getBookname()%></p>

						<p><%=b2.getAuthor()%></p>
						<p>
							Categories:
							<%=b2.getBookCategory()%></p>
						<div class="row text-center">
							<a href="view_book.jsp?bid=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="AllOldBook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>



	<%@include file="AllComponent/Footer.jsp"%>
</body>
</html>