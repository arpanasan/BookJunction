package com.Admin.Servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImp;
import com.DB.DbConnect;
import com.entity.book;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String authorname = req.getParameter("aname");
			String price = req.getParameter("price");
			String categories = req.getParameter("btype");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String filename = part.getSubmittedFileName();
			book b = new book(bookname, authorname, price, categories, status, filename, "admin");
			// System.out.println(b);
			BookDAOImp dao = new BookDAOImp(DbConnect.getConnection());

			boolean f = dao.addBooks(b);
			HttpSession session = req.getSession();
			if (f) {

				String path = getServletContext().getRealPath("") + "img";

				File file = new File(path);
				part.write(path + File.separator + filename );

				session.setAttribute("succMsg", "Book Added Sucesfully!");
				resp.sendRedirect("Admin/add_books.jsp");
			} else {

				session.setAttribute("failedMsg", "Something went wrong on server!");
				resp.sendRedirect("Admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
