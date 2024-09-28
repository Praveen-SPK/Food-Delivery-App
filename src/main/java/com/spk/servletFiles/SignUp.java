package com.spk.servletFiles;

import com.spk.DAO.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Signup")
public class SignUp extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName=request.getParameter("name");
		String userEmail=request.getParameter("email");
		String userMobileNo=request.getParameter("mobile");
		String userPassword=request.getParameter("password");
		
		boolean result=InsertDetails.signUpDetails(userName, userEmail, userMobileNo, userPassword);
		
		
		if(result) {
			HttpSession session=request.getSession();
			session.setAttribute("userEmail",userEmail );
			session.setAttribute("userPassword",userPassword );
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/index.jsp");
		}
		else {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Register.jsp");
		}
		
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
