package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.spk.DAO.DeleteDetails;
import com.spk.DAO.UpdateDetails;

@WebServlet("/AdminProceedBtn")
public class AdminProceedBtn extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int o_id=Integer.parseInt(request.getParameter("value"));
		System.out.println("in admin proceed page");
		boolean result=UpdateDetails.proceedOrderDetails(o_id);
		
		if(result) {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/AdminOrders.jsp");
		}
		
	}
}
