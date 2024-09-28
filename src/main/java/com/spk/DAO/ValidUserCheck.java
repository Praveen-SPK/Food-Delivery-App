package com.spk.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class ValidUserCheck {

	
	public static int checkMyDetails(String email,String password) throws ClassNotFoundException, SQLException {
		Connection con=DAO.dbConnection();
		String query="UPDATE userDetails SET User_Password=? WHERE User_Email=? ";
		PreparedStatement pst=con.prepareStatement(query);
		pst.setString(1, password);
		pst.setString(2, email);
		return pst.executeUpdate();
		
		
		
	}
}
