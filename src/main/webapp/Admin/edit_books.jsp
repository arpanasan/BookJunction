<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DbConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDAOImp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7;">
  <%@include file="navbar.jsp"%>
  <div class="container p-4">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card">
          <div class="card-body">
            <h4 class="text-center">Add Books</h4>

           

            <%
              int id=Integer.parseInt(request.getParameter("id"));
              BookDAOImp dao=new BookDAOImp(DbConnect.getConnection());
            book b = dao.getBookById(id);
              
            %>

            <form action="../edit_books" method="post">
            <input type="hidden" name="id" value="<%=b.getBookId() %>">

              <div class="form-group">
                <label for="exampleInputEmail1">Book Name</label> <input
                  type="text" class="form-control" id="exampleInputEmail1"
                  aria-describedby="emailHelp" name="bname" value="<%=b.getBookname()   %>">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Author Name</label> <input
                  type="text" class="form-control" id="exampleInputEmail1"
                  aria-describedby="emailHelp" name="author" value="<%=b.getAuthor()%>">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Price</label> <input
                  type="number" class="form-control" id="exampleInputEmail1"
                  aria-describedby="emailHelp" name="price" value="<%=b.getPrice()%>">
              </div>

              
              <div class="form-group">
                <label for="inputState">Book Status</label> <select
                  class="form-control" id="inputState" name="bstatus">
                  <% 
                  if ("Active".equals(b.getStatus())){
                  %>
                  <option value="Active">Active</option>
                  <option value="Inactive">Inactive</option>
                  <%
                  }else{
                  %>
                    <option value="Inactive">Inactive</option>
                    <option value="Active">Active</option>
                  <%
                  }
                  %>
                  
                  
                  
                </select>
              </div>

              <button type="submit" class="btn btn-primary">Update</button>



            </form>


          </div>
        </div>
      </div>
    </div>
  </div>
  <div style="margin-top: 90px">
    <%@include file="Footer.jsp"%>
  </div>
</body>
</html>