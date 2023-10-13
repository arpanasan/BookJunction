package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImp;
import com.DB.DbConnect;
import com.entity.user;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAOImp dao = new UserDAOImp(DbConnect.getConnection());
		HttpSession session = req.getSession();

		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				user us = new user();
				us.setName("Admin");
				session.setAttribute("userobj", us);

				resp.sendRedirect("Admin/Home.jsp");
			} else {

				user us = dao.login(email, password);
				if (us != null) {
					//System.out.println("yes");
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Email & Password Invalid!");
					resp.sendRedirect("Login.jsp");
				}

				//resp.sendRedirect("Home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
