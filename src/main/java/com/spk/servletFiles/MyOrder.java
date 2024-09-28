package com.spk.servletFiles;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.spk.DAO.DAO;
import com.spk.DAO.RetrieveDetails;
@WebServlet("/MyOrder")
public class MyOrder extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String userId=(String)session.getAttribute("userEmail");
		ResultSet rs=RetrieveDetails.showOrderToUser(userId);
		HttpSession ses=request.getSession();
		ses.setAttribute("myorders",rs);
		try {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Order.jsp");
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}

}
