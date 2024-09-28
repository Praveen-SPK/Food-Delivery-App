package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.spk.DAO.DeleteDetails;
@WebServlet("/deleteProducts")
public class DeleteProduct extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pId=Integer.parseInt(request.getParameter("p-id"));
		
		int result=DeleteDetails.RemoveProducts(pId);
		
		if(result>0) {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Admin.jsp?status=Removed");
		}
		else {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Admin.jsp?status=Denied");
		}
		
	}

}
