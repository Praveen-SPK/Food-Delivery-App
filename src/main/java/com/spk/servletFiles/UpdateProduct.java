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

import com.spk.DAO.UpdateDetails;

@MultipartConfig
@WebServlet("/updateProducts")
public class UpdateProduct extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String productId = request.getParameter("p-id");
		String productPrice = request.getParameter("p-cost");
		String productStock = request.getParameter("p-stock");

		String imgName = "";

		Part productImg = request.getPart("p-img");

		// this condition is to check whether the admin wants to change img or not!!!!
		if (!productImg.equals("")) {

			imgName = productImg.getSubmittedFileName();       

			String imgPath = "/E-Commerce Using JSP/src/main/webapp/Images/" + imgName;

			try {
				FileOutputStream fos = new FileOutputStream(imgPath);
				InputStream is = productImg.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		boolean result = false;
		// if imgName if found it means admin want to change the img so it go for else condition ... 
		if (imgName == "") {
			result = UpdateDetails.updateProductDetails(productId, productPrice, productStock);
		} else {
			result = UpdateDetails.updateProductDetails(productId, productPrice, productStock, imgName);
		}

		if (result) {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Admin.jsp?status=Updated");
		} else {
			response.sendRedirect("../E-Commerce_Using_JSP/JSP_Files/Admin.jsp?status=Denied");
		}
	}

}
