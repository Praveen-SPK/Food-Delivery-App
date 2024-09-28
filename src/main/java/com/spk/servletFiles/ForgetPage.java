package com.spk.servletFiles;
import com.spk.DAO.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;

@WebServlet("/Forgetpage")
public class ForgetPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ForgetPage() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String email=request.getParameter("email");
		String newPassword=request.getParameter("newpassword");
		String confirmPassword=request.getParameter("confirmpassword");
		PrintWriter out=response.getWriter();
		
		if(!newPassword.equals(confirmPassword)) {
			
			out.println("<script>alert('new and confirm password are not equal')</script>");
		}
		else {
		try {
			int rs=ValidUserCheck.checkMyDetails(email,newPassword);
			if(rs==1) {
				response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Register.jsp");
			}
			else {
				out.println("Email Not Exist...");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
