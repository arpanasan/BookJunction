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
<title>Recent Books</title>
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
	<%@include file="AllComponent/navbar.jsp"%>
 <%   user u=(user)session.getAttribute("userobj"); %>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch=request.getParameter("ch");
			BookDAOImp dao1 = new BookDAOImp(DbConnect.getConnection());
			List<book> list1 = dao1.getBookBySearch(ch);
			for (book b1 : list1) {
			%>

			<div class="col-md-3 ">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b1.getPhoto()%>"
							style="width: 120px; height: 170px" class="img-thumblin">
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
								class="btn btn-danger btn-sm ml-2"><%=b1.getPrice()%><i
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
	</div>
</body>
</html>