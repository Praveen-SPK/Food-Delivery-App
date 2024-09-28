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


@WebServlet("/Changepassword")
public class ChangePasswordPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ChangePasswordPage() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		String confirmPassword=request.getParameter("confirmPassword");
		
		if(!newPassword.equals(confirmPassword)) {
			PrintWriter out=response.getWriter();
			out.println("<script>alert('new and confirm password are not equal')</script>");
		}
		else {
		
		try {
			
			boolean result=UpdateDetails.changePassword(oldPassword, newPassword);
			
			if(result) {
				response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Register.jsp");
			}
			else {
				response.getWriter().println("enter valid password");
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
