package com.spk.servletFiles;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spk.DAO.RetrieveDetails;

@WebServlet("/Signin")
public class SignIn extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email_username=request.getParameter("email-username");
		String password=request.getParameter("password");
		
		
		if(email_username.equals("spk@gmail.com")||email_username.equals("praveen")&&password.equals("spk@9492")) {
			
			HttpSession session=request.getSession();
			session.setAttribute("adminEmail", email_username);
			session.setAttribute("adminPassword", password);
			response.sendRedirect("./JSP_Files/Admin.jsp");
			
		}
		else {
		try {
			boolean rs=RetrieveDetails.signInProcess(email_username, password);
			if(rs) {
				
				HttpSession session=request.getSession();
				session.setAttribute("userEmail", email_username);
				session.setAttribute("userPassword", password);
				response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/index.jsp");
				
			}
			else {
				response.sendRedirect("./JSP_Files/Home.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			response.getWriter().println(e);
		}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
