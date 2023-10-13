package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImp;
import com.DB.DbConnect;

@WebServlet("/remove")
public class RemoveBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int bid=Integer.parseInt(req.getParameter("bid"));
	    int uid=Integer.parseInt(req.getParameter("uid"));
	    int cid=Integer.parseInt(req.getParameter("cid"));
	    CartDAOImp dao = new CartDAOImp(DbConnect.getConnection());
	   boolean f =dao.deleteBook(bid,uid,cid);
	   HttpSession session = req.getSession();
	   if(f) {
		   
		   
			session.setAttribute("succMsg", "Book Removed...");
			resp.sendRedirect("Cart.jsp");
			
	   }else {
		   session.setAttribute("failedMsg", "Something went wrong on server...");
			resp.sendRedirect("Cart.jsp");
	   }
	}
	

}
