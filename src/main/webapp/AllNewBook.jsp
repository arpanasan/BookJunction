<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
<title>New Books</title>
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
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body style="background-color: #f7f7d7;">
 <%
   user u=(user)session.getAttribute("userobj"); %>

	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart" scope="session" />
	</c:if>

	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImp dao = new BookDAOImp(DbConnect.getConnection());
			List<book> list = dao.getAllNewBook();
			for (book b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhoto()%>"
							style="width: 120px; height: 170px" class="img-thumblin">
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
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm "><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
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