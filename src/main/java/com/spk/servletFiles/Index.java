package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.spk.DAO.DAO;

@WebServlet("/Index")
public class Index extends HttpServlet {
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection con=DAO.dbConnection();
			String query="select * from productDetails";
			Statement st=con.createStatement();
			ResultSet rs= st.executeQuery(query);
			
			HttpSession session=request.getSession();
			session.setAttribute("userResult",rs);
			
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/index.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}

}
