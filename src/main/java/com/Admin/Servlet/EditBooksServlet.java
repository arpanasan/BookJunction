package com.Admin.Servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImp;
import com.DB.DbConnect;
import com.entity.book;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookname = req.getParameter("bname");
			String authorname = req.getParameter("author");
			String price = req.getParameter("price");
			
			String status = req.getParameter("bstatus");
			
			book b=new book();
			b.setBookId(id);
			b.setBookname(bookname);
			b.setAuthor(authorname);
			b.setPrice(price);
			b.setStatus(status);
			
           BookDAOImp dao=new BookDAOImp(DbConnect.getConnection());
           boolean f=dao.updateEditBooks(b);
           
           HttpSession session = req.getSession();
           if(f) {
        	   
        	   session.setAttribute("succMsg", "Updation Sucessfull...");
				resp.sendRedirect("Admin/all_books.jsp");
           }else {
        	   session.setAttribute("failedMsg", "Something went wrong on server...");
				resp.sendRedirect("Admin/all_books.jsp");
           }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 
}
