package com.spk.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateDetails {

	
	public static boolean changePassword(String oldpassword,String newpassword) throws ClassNotFoundException, SQLException {
		
		String query="UPDATE userDetails SET User_Password=? WHERE User_Password=?";
		
		Connection con=DAO.dbConnection();
		PreparedStatement pst=con.prepareStatement(query);
		pst.setString(1, newpassword);
		pst.setString(2, oldpassword);
		int result =pst.executeUpdate();
		
		if(result!=0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public static boolean updateProductDetails(String pId,String pCost,String pStock,String pImg) {
		int p_Id=Integer.parseInt(pId);
		int p_Cost=Integer.parseInt(pCost);
		int p_Stock=Integer.parseInt(pStock);
		
		String query="UPDATE productDetails SET pCost=pCost+?,pStock=pStock+?,pImage=? WHERE pId=?";
		try {
			Connection con=DAO.dbConnection();
			PreparedStatement pst=con.prepareStatement(query);
			pst.setInt(1, p_Cost);
			pst.setInt(2, p_Stock);
			pst.setString(3, pImg);
			pst.setInt(4, p_Id);
			pst.executeUpdate();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static boolean updateProductDetails(String pId,String pCost,String pStock) {
		int p_Id=Integer.parseInt(pId);
		int p_Cost=Integer.parseInt(pCost);
		int p_Stock=Integer.parseInt(pStock);
		
		String query="UPDATE productDetails SET pCost=pCost+?,pStock=pStock+? WHERE pId=?";
		try {
			Connection con=DAO.dbConnection();
			PreparedStatement pst=con.prepareStatement(query);
			pst.setInt(1, p_Cost);
			pst.setInt(2, p_Stock);
			pst.setInt(3, p_Id);
			pst.executeUpdate();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	public static boolean proceedOrderDetails(int o_Id) {
		
		String query="UPDATE orderDetails SET p_Status='Success' WHERE o_id="+o_Id;
		try {
			Connection con=DAO.dbConnection();
			Statement st=con.createStatement();
			st.executeUpdate(query);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	
}
