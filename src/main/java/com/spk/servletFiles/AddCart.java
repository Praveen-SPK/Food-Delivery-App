package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import com.spk.DAO.InsertDetails;
import com.spk.DAO.RetrieveDetails;

@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		String user_Name=(String)session.getAttribute("userEmail");
		
		
		List<String> user=RetrieveDetails.retrieveProcess(user_Name);
		
		String user_Name1 = user.get(0) ;
		String user_Email = user.get(1);
		int p_Id = Integer.parseInt(request.getParameter("pid"));
		int p_Stock = Integer.parseInt(request.getParameter("pstock"));
		int p_Cost = Integer.parseInt(request.getParameter("pcost"));
		String p_Name = request.getParameter("pname");
		int u_count=Integer.parseInt(request.getParameter("count"));
		
		int p_count=RetrieveDetails.getProductCount(p_Id);
		if(u_count>p_count) {
		    
		    out.println("<button ><a href='../E-Commerce_Using_JSP/JSP_Files/index.jsp'>go back</a> </button>"); 
		}
		else {
			InsertDetails.addOrderDetails(user_Name1, user_Email,u_count ,p_Id, p_Name, p_Cost, p_Stock);
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/index.jsp");
		}
		
		
	}

}
