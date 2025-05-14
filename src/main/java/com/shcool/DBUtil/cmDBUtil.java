package com.shcool.DBUtil;

import java.sql.*;
import java.util.*;

import com.school.model.CM;
import com.school.Controller.DBConnection;

public class cmDBUtil {
	private static boolean isSuccess =false;
	private static Connection con = null;
	private static Statement st = null;
	private static PreparedStatement ps1, ps2 = null;
	
	public static  List<CM> Display(){
		
		List<CM> cm = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			
			String sql = "SELECT s.*, c.cm_id, c.cm_role FROM staff s INNER JOIN cr_manager c ON s.stf_id = c.cm_id";
			
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				//From Staff
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
	            
	            //From cm
	            String cid = rs.getString("cm_id");
	            String role = rs.getString("cm_role");
	            
	            CM cm1 = new CM(id, fname, lname, email, phone, address, nic, dob, sal, hd, pass,cid,role);
	            cm.add(cm1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cm;		
	}
	
	public static boolean insertCM(String stf_id, String stf_hireDate, String stf_fname, String stf_lname,
	        String stf_email, String stf_phone, String stf_address, String stf_nic,
	        String stf_dob, double stf_salary, String stf_password, String cm_role) throws SQLException{
		
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
            
            //CM
            String CMsql = "INSERT INTO cr_manager(cm_id, cm_role) VALUES(?, ?) ";
            ps2 = con.prepareStatement(CMsql);
            ps2.setString(1, stf_id);
            ps2.setString(2, cm_role);
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
			con.rollback();
			throw e;
		}finally {
		    if (ps1 != null) ps1.close();
		    if (ps2 != null) ps2.close();
		    if (con != null) con.close();
		}
		
		return isSuccess;		
	}
	
	public static boolean updateCM(String stf_id, String stf_hireDate, String stf_fname, String stf_lname,
	        String stf_email, String stf_phone, String stf_address, String stf_nic,
	        String stf_dob, double stf_salary, String stf_password, String cm_role){
			
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
	        	//CM
	        	String CMUpdate = "UPDATE cr_manager SET cm_role=? WHERE cm_id=?";
	        	PreparedStatement CMSt = con.prepareStatement(CMUpdate);
	        	CMSt.setString(1, cm_role);
	        	CMSt.setString(2, stf_id);
	        	
	        	int Success = CMSt.executeUpdate();
	        	isSuccess= (Success > 0);
	        	
	        }else {
	        	System.out.println("Error occures , During Staff Update ...");
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean deletCM(String cm_id) {
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			System.out.println("DELET");
			String sql1 = "DELETE FROM cr_manager WHERE cm_id = '"+cm_id+"'";
			String sql2 = "DELETE FROM staff WHERE stf_id = '"+cm_id+"'";
			
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
	
	public static int getCmCount() throws Exception {
		int count = 0;
		String CountSql = "SELECT COUNT(*) FROM cr_manager";
		
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
