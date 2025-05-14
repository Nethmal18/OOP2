package com.shcool.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;


import com.school.Controller.DBConnection;
import com.school.model.Admin;

public class adminDBUtil {
	
	private static boolean isSuccess =false;
	private static Connection con = null;
	private static Statement st = null;
	private static PreparedStatement ps1, ps2 = null;
	
	public static  List<Admin> Display(){
		
		List<Admin> admin = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection(); 
			st = con.createStatement();
			
			String sql = "SELECT s.*, a.ad_id, a.ad_systemAccess, a.ad_designation "
					+ "FROM staff s INNER JOIN admin a ON s.stf_id = a.ad_id";
			
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				// From Staff
	            String id = rs.getString("stf_id");
	            String fname =  rs.getString("stf_Fname");
	            String lname = rs.getString("stf_Lname");
	            String email =  rs.getString("stf_email");
	            String phone = rs.getString("stf_phone");
	            String address = rs.getString("stf_address");
	            String nic = rs.getString("stf_NIC");
	            String dob = rs.getString("stf_DOB");
	            Double sal =rs.getDouble("stf_salary");
	            String hd = rs.getString("stf_hireDate");
	            String pass = rs.getString("stf_password");
	            
	            //From Admin
	            String aid = rs.getString("ad_id");
	            int a_sys_acc = rs.getInt("ad_systemAccess"); 
	            String adesig = rs.getString("ad_designation");
	            
	            Admin ad = new Admin(id, fname, lname, email, phone, address, nic, dob, sal, hd, pass, aid, a_sys_acc, adesig);
	            admin.add(ad);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return admin;
	}
	
	public static boolean insertAdmin(String stf_id, String stf_hireDate, String stf_fname, String stf_lname,
	        String stf_email, String stf_phone, String stf_address, String stf_nic,
	        String stf_dob, double stf_salary, String stf_password,
	        int ad_systemAccess, String ad_designation) throws SQLException {
		
		try {
			con = DBConnection.getConnection();
			
			con.setAutoCommit(false);
			
			//Staff Stuff 😒
			String sql = "INSERT INTO Staff(stf_id, stf_date, stf_Fname, stf_Lname, stf_email, stf_phone, stf_address, stf_NIC, stf_DOB, stf_salary, stf_hireDate, stf_password)"
					+ "VALUES (?, CURDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			ps1 = con.prepareStatement(sql);
			
			ps1.setString(1, stf_id);
            ps1.setString(2, stf_fname);
            ps1.setString(3, stf_lname);
            ps1.setString(4, stf_email);
            ps1.setString(5, stf_phone);
            ps1.setString(6, stf_address);
            ps1.setString(7, stf_nic);
            ps1.setString(8, stf_dob);
            ps1.setDouble(9, stf_salary);
            ps1.setString(10, stf_hireDate);
            ps1.setString(11, stf_password);
            int result1 = ps1.executeUpdate();
            
            //Insert Administrator Staff
            String adminSql = "INSERT INTO admin(ad_id, ad_systemAccess, ad_designation) VALUES(? , ?, ?)";
            ps2 = con.prepareStatement(adminSql);
            ps2.setString(1, stf_id);
            ps2.setInt(2, ad_systemAccess);
            ps2.setString(3, ad_designation);
			int result2 = ps2.executeUpdate();
			
			if(result1 > 0 && result2 > 0) {
				con.commit(); //Command to insert date for me
    			isSuccess = true;
    		}else {
    			con.rollback(); //kind of like reset as it before cuz u suck at input 😂
    			isSuccess = false;
    		}
			
			con.commit(); //Command to insert date for me
			
	    }catch(SQLException e) {
	    	con.rollback(); //kind of like reset as it before cuz u suck at input 😂
	    	System.out.println("FICK");
			throw e;
		}finally {
		    if (ps1 != null) ps1.close();
		    if (ps2 != null) ps2.close();
		    if (con != null) con.close();
		}
		
		
		return isSuccess;
	}
	
	public static boolean updateAdmin(String stf_id, String stf_hireDate, String stf_fname, String stf_lname,
	        String stf_email, String stf_phone, String stf_address, String stf_nic,
	        String stf_dob, double stf_salary, String stf_password,
	        int ad_systemAccess, String ad_designation) {
		
		try{
			con = DBConnection.getConnection();
			
			//Staff
			String staffUpdate = "UPDATE staff SET stf_hireDate=?, stf_fname=?, stf_lname=?, stf_email=?, stf_phone=?, stf_address=?, stf_nic=?, stf_salary=?, stf_password=? WHERE stf_id=?";
	        PreparedStatement staffStmt = con.prepareStatement(staffUpdate);
	        staffStmt.setString(1, stf_hireDate);
	        staffStmt.setString(2, stf_fname);
	        staffStmt.setString(3, stf_lname);
	        staffStmt.setString(4, stf_email);
	        staffStmt.setString(5, stf_phone);
	        staffStmt.setString(6, stf_address);
	        staffStmt.setString(7, stf_nic);
	        staffStmt.setDouble(8, stf_salary);
	        staffStmt.setString(9, stf_password);
	        staffStmt.setString(10, stf_id);

	        int staffResult = staffStmt.executeUpdate();
	        
	        if(staffResult > 0) {
	        	//ADMIN
	        	String AdminUpdate = "UPDATE admin SET ad_systemAccess=?, ad_designation=? WHERE ad_id=?";
	        	PreparedStatement adminSt = con.prepareStatement(AdminUpdate);
	        	adminSt.setInt(1, ad_systemAccess);
	        	adminSt.setString(2, ad_designation);
	        	adminSt.setString(3, stf_id);
	        	
	        	int Success = adminSt.executeUpdate();
	        	isSuccess= (Success > 0);
	        }else {
	        	System.out.println("Error occures , During Staff Update ...");
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean deleteAdmin(String aid) {
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			
			String sql1 = "DELETE FROM admin WHERE ad_id = '"+aid+"'";
			String sql2 = "DELETE FROM staff WHERE stf_id = '"+aid+"'";
			
			int result1 = st.executeUpdate(sql1);
			int result2 = st.executeUpdate(sql2);
			
			if(result1 >0 && result2 > 0){
				isSuccess = true;				
			}else
				isSuccess =false;
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static int getAdminCount() throws Exception {
		int count = 0;
		String CountSql = "SELECT COUNT(*) FROM admin";
		
		try(Connection con = DBConnection.getConnection(); 
		         PreparedStatement ps = con.prepareStatement(CountSql);
		         ResultSet rs = ps.executeQuery()){
			if (rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
}
