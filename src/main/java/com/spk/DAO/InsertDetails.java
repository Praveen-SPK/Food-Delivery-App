package com.spk.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertDetails {
	
	
	public static Boolean signUpDetails(String userName,String userEmail,String userMobile,String userPassword) {
		try {
			Connection con=DAO.dbConnection();
			String query="INSERT INTO userDetails VALUES(?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, userName);
			pst.setString(2, userEmail);
			pst.setString(3, userMobile);
			pst.setString(4, userPassword);
			pst.executeUpdate();
			return true;
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static int addProductDetails(String pId,String pName,String pCost,String pStock,String pImgName) {
		String query="insert into productDetails values(?,?,?,?,?)";
		
		int p_Id=Integer.parseInt(pId);
		int p_Cost=Integer.parseInt(pCost);
		int p_Stock=Integer.parseInt(pStock);
		try {
			Connection con=DAO.dbConnection();
			PreparedStatement pst=con.prepareStatement(query);
			pst.setInt(1, p_Id);
			pst.setString(2, pName);
			pst.setInt(3, p_Cost);
			pst.setInt(4, p_Stock);
			pst.setString(5, pImgName);	
			return pst.executeUpdate();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		return 0;

	}
	
	
	public static int addOrderDetails(String userName,String userEmail,int u_count, int pId,String pName,int pCost,int pStock) {
		
		
		
		String query1="update productDetails set pStock=pStock-? where pId=?";
			
		String query="insert into orderDetails(u_UserName,u_Email,u_quantity,p_Id,p_Quantity,p_Cost,p_Name) values(?,?,?,?,?,?,?)";
	
		try {
			Connection con=DAO.dbConnection();
			
			PreparedStatement pst1=con.prepareStatement(query1);
			pst1.setInt(1, u_count);
			pst1.setInt(2, pId);
			pst1.executeUpdate();	
			PreparedStatement pst2=con.prepareStatement(query);
			pst2.setString(1, userName);
			pst2.setString(2, userEmail);
			pst2.setInt(3, u_count);
			pst2.setInt(4, pId);
			pst2.setInt(5, pStock);
			pst2.setInt(6, pCost);
			pst2.setString(7, pName);
				
			return pst2.executeUpdate();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		return 0;

	}

}
