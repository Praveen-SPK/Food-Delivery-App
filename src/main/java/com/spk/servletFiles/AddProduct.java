package com.spk.servletFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.spk.DAO.InsertDetails;

@MultipartConfig
@WebServlet("/addProducts")
public class AddProduct extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productId=request.getParameter("p-id");
		String productName=request.getParameter("p-name");
		String productPrice=request.getParameter("p-cost");
		String productStock=request.getParameter("p-stock");
		
		Part productImg=request.getPart("p-img");  			// receive the img file address
		
		String imgName=productImg.getSubmittedFileName(); 		//used to get the img name from their address
		
		String imgPath="C:/Users/91701/eclipse-workspace/E-Commerce Using JSP/src/main/webapp/Images/"+imgName;		//combine the project images path with img name to store it locally.
		
		try {
			FileOutputStream fos=new FileOutputStream(imgPath);  // it stores the actual img in local project folder
			InputStream is=productImg.getInputStream();  // it gets the choosen img.
			byte[] data=new byte[is.available()];   // it stores the actual details of choosen img
			is.read(data);						// it reads the choosen img 
			fos.write(data);					// it write the data in actual img from choosen img
			fos.close();							// finally close the file or stream
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		int result=InsertDetails.addProductDetails(productId, productName,productPrice, productStock, imgName);
		
		if(result>0) {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Admin.jsp?status=Added");
		}
		else {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Admin.jsp?status=Denied");
		}
		
		
	}

}
