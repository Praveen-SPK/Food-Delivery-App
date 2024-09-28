package com.spk.servletFiles;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.spk.DAO.DAO;
import com.spk.DAO.RetrieveDetails;

@WebServlet("/viewProduct")
public class ViewProduct extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultSet res=RetrieveDetails.showProduct();
		
		HttpSession session=request.getSession();
		session.setAttribute("result",res);
		
		response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/ViewProduct.jsp");
		
	}

}
