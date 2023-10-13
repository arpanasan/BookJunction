<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DbConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookOrderDAOImp"%>
<%@ page import="com.entity.Book_order"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>

</head>
<body style="background-color: #e8f5e9">
	<c:if test="${empty userobj }">
	 <c:redirect url="../Login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello,Admin</h3>
	<table class="table table-striped p-3">
		<thead class="bg-custom text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
				

			</tr>
		</thead>
		<tbody>
		<%
				user u = (user) session.getAttribute("userobj");
				BookOrderDAOImp dao = new BookOrderDAOImp(DbConnect.getConnection());
				List<Book_order> blist = dao.getAllOrder();
				for (Book_order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFulladdress() %></td>
					<td><%=b.getPhno() %></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>


				</tr>
				<%
				}
				%>
		</tbody>
	</table>
	<div style="margin-top:160px;">
	<%@ include file="Footer.jsp" %></div>
</body>
</html>