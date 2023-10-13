package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DbConnect;
import com.entity.Cart;
import com.entity.book;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
            BookDAOImp dao=new BookDAOImp(DbConnect.getConnection());
            book b=dao.getBookById(bid);
		    Cart c=new Cart();
		    c.setBid(bid);
            c.setUid(uid);
            c.setBook_name(b.getBookname());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotal_price(Double.parseDouble(b.getPrice()));
			
            CartDAOImp dao2=new CartDAOImp(DbConnect.getConnection());
            boolean f=dao2.addCart(c);
            HttpSession session = req.getSession();
            
            if(f) {
            	session.setAttribute("addCart", "Book Added To Cart!");

				resp.sendRedirect("AllNewBook.jsp");
            	
            }
            else {
            	session.setAttribute("failed", "Something Wrong On Server..");

				resp.sendRedirect("AllNewBook.jsp");
            }
            
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
   
}
