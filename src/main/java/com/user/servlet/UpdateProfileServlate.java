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

@WebServlet("/update_profile")
public class UpdateProfileServlate extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phon = req.getParameter("phon");
			String password = req.getParameter("password");
			
			UserDAOImp dao = new UserDAOImp(DbConnect.getConnection());

			user us = new user();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(password);
			HttpSession session = req.getSession();

			boolean f = dao.checkPassword(id, password);

			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMsg", "Profile Updated!");
					resp.sendRedirect("Edit_profie.jsp");
				} else {

					session.setAttribute("failedMsg", "Something went wrong on server...");
					resp.sendRedirect("Edit_profie.jsp");
				}

			} else {
				//System.out.print(phon+","+password);
				session.setAttribute("failedMsg", "Incorrect Password...");
				resp.sendRedirect("Edit_profie.jsp");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
