<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DbConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDAOImp"%>
<%@ page import="com.entity.*"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User:Old Book</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7;">
	<%@include file="AllComponent/navbar.jsp"%>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				user u = (user) session.getAttribute("userobj");
				String email = u.getEmail();

				BookDAOImp dao2 = new BookDAOImp(DbConnect.getConnection());
				List<book> list2 = dao2.getBookByOld(email, "Old Book");
				for (book b2 : list2) {
				%>
				<tr>

					<td><%=b2.getBookname()%></td>
					<td><%=b2.getAuthor()%></td>
					<td><%=b2.getPrice()%></td>
					<td><%=b2.getBookCategory()%></td>
					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b2.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>





			</tbody>
		</table>


	</div>

</body>
</html>