package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.spk.DAO.DeleteDetails;

@WebServlet("/removeMyOrder")
public class removeMyOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int o_Id=Integer.parseInt(request.getParameter("value"));
    	String o_status=request.getParameter("status");
    	System.out.println(o_status);
    	if(!o_status.equalsIgnoreCase("Success")){
        	int result=DeleteDetails.removeOrderDetails(o_Id);	
        	if(result>0) {
        		response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Order.jsp");
        	}
    	}
    	else {
    		response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Order.jsp");
    	}
    	
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
