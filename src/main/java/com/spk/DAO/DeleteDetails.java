package com.spk.DAO;

import java.sql.Connection;
import java.sql.Statement;

public class DeleteDetails {

	
	
	public static int RemoveProducts(int p_Id) {
		
		String query="delete from productDetails where pId="+p_Id;
		try {
			Connection con=DAO.dbConnection();
			Statement st=con.createStatement();
			return st.executeUpdate(query);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	public static int removeOrderDetails(int o_Id) {
		
		String query="delete from orderDetails where o_id="+o_Id;
		try {
			Connection con=DAO.dbConnection();
			Statement st=con.createStatement();
			return st.executeUpdate(query);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
