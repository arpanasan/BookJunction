package com.Admin.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImp;
import com.DB.DbConnect;

@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		      int id=Integer.parseInt(req.getParameter("id"));
		      
		      BookDAOImp dao = new BookDAOImp(DbConnect.getConnection());
		      boolean f= dao.deleteBooks(id);
		      HttpSession session = req.getSession();
		      if(f) {
		        session.setAttribute("succMsg", "Book Deleted Successfully..");
		        resp.sendRedirect("Admin/all_books.jsp");
		      }
		      else {
		        session.setAttribute("failedMsg", "Something wrong on server");
		        resp.sendRedirect("Admin/all_books.jsp");
		      }

		    }catch(Exception e) {
		      e.printStackTrace();
		    }
		
	}

	
}
