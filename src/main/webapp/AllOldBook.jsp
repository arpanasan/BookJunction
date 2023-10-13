<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DbConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDAOImp"%>
<%@ page import="com.entity.book"%>
<%@ page import="java.util.*"%>
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
</style>

</head>
<body style="background-color: #f7f7d7;">
	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImp dao2 = new BookDAOImp(DbConnect.getConnection());
			List<book> list2 = dao2.getAllOldBook();
			for (book b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b2.getPhoto()%>"
							style="width: 110px; height: 160px" class="img-thumblin">
						<p><%=b2.getBookname()%></p>

						<p><%=b2.getAuthor()%></p>
						<p>
							Categories:
							<%=b2.getBookCategory()%></p>
						<div class="row text-center">
							<a href="view_book.jsp?bid=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><%=b2.getPrice()%><i
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