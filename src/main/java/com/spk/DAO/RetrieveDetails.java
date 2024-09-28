package com.spk.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;


public class RetrieveDetails {
	
	
	public static boolean signInProcess(String email_username,String password) throws ClassNotFoundException, SQLException {
		String query="SELECT * FROM userDetails WHERE (User_Email=? OR User_Name=? )AND User_Password=?";
		Connection con=DAO.dbConnection();
		PreparedStatement pst=con.prepareStatement(query);
		pst.setString(1, email_username);
		pst.setString(2, email_username);
		pst.setString(3, password);
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			return true;
		}
		return false;
	}
	
	
	public static ResultSet showProduct() {
		try {
			Connection con=DAO.dbConnection();
			String query="SELECT * FROM productDetails";
			Statement st=con.createStatement();
			return st.executeQuery(query);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public static List<String> retrieveProcess(String email_username)  {
		String query="SELECT * FROM userDetails WHERE (User_Email=? OR User_Name=? )";
		try {
		Connection con=DAO.dbConnection();
		PreparedStatement pst=con.prepareStatement(query);
		pst.setString(1, email_username);
		pst.setString(2, email_username);
		ResultSet rs=pst.executeQuery();
		List<String> result=new ArrayList<String>();
		while(rs.next()) {
			result.add(rs.getString(1));
			result.add(rs.getString(2));	
		}
		return result;
	}
	catch(Exception e) {
		e.printStackTrace();
	}
		return null;
		}
	
	public static ResultSet showOrderToUser(String userId) {
		try {
			String query="select * from orderDetails where u_Email=? or u_UserName=?";
			Connection con= DAO.dbConnection();
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, userId);
			pst.setString(2, userId);
			
			
			
			return pst.executeQuery();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public static int showTotalToUser(String userId) {
		try {
			String query="select p_Cost,u_quantity from orderDetails where u_Email=? or u_UserName=? ";
			Connection con= DAO.dbConnection();
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, userId);
			pst.setString(2, userId);
			ResultSet rs= pst.executeQuery();
			int value=0;
			while(rs.next()) {
				int cost=rs.getInt(1);
				int quantity=rs.getInt(2);
				value =value+(cost*quantity);
			}
			System.out.println(value);
			return value;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int getProductCount(int pId) {
		try {
			Connection con=DAO.dbConnection();
			String query="SELECT * FROM productDetails where pId="+pId;
			Statement st=con.createStatement();
			ResultSet result=st.executeQuery(query);
			while(result.next()) {
				
				return result.getInt(4);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public static ResultSet showOrderDetails() {
		try {
			Connection con=DAO.dbConnection();
			String query="SELECT * FROM orderDetails";
			Statement st=con.createStatement();
			return st.executeQuery(query);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
