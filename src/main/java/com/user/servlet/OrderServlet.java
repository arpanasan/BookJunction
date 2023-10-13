package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DbConnect;
import com.entity.Book_order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(); 
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("uname");
			String email = req.getParameter("email");
			String phon = req.getParameter("phon");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("zip");
			String payment = req.getParameter("payment");

			String fulladdress = address + "," + landmark + "," + state + "," + pincode;
			
			//System.out.println(name+","+email+","+phon+","+fulladdress+","+payment);
			
			CartDAOImp dao = new CartDAOImp(DbConnect.getConnection());
			List<Cart> blist=dao.getBookByUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");

				resp.sendRedirect("Cart.jsp");
			}else {
				BookOrderDAOImp dao2 = new BookOrderDAOImp(DbConnect.getConnection());
				Random r=new Random();
				
				ArrayList<Book_order> ord_list=new ArrayList<Book_order>();
				for(Cart c:blist)
				{
					Book_order o=new Book_order();
					o.setOrderId("Book-ORD-ee"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phon);
					o.setFulladdress(fulladdress);
					o.setBookName(c.getBook_name());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(payment);
					ord_list.add(o);
					
				}

		

				if ("noselect".equals(payment)) {
					session.setAttribute("failedMsg", "Please Choose Payment Method..!");

					resp.sendRedirect("Cart.jsp");
				} else {
	               boolean f= dao2.saveOrder(ord_list);
	               if(f) {
	            	  resp.sendRedirect("ordersuc.jsp");
	               }else {
	            		session.setAttribute("failedMsg", "Failed!");
	    				resp.sendRedirect("Cart.jsp");
	               }
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
