package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;

import com.spk.DAO.RetrieveDetails;

@WebServlet("/Order")
public class AdminOrders extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultSet result=RetrieveDetails.showOrderDetails();
		HttpSession session=request.getSession();
		session.setAttribute("AdminOrders",result);
		response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/AdminOrders.jsp");
	}

}

