package com.shcool.DBUtil;

import java.sql.*;
import java.util.*;

import com.school.Controller.DBConnection;
import com.school.Controller.Teacher;

public class teacherDBUtil {
	//private static boolean isSuccess =false;
	private static Connection con = null;
	//private static Statement stmt = null;
	
	
	public static List<Teacher> getAllTeachers(){
	    List<Teacher> tc = new ArrayList<>();

	    String sql = "SELECT s.*, t.tc_experience, t.tc_specialization, t.tc_designation " +
	                 "FROM Staff s JOIN Teacher t ON s.stf_id = t.tc_id";

	    try {
	    	Connection con = DBConnection.getConnection(); 
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

	        while (rs.next()) {

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

	            // From Teacher
	            int te =rs.getInt("tc_experience");
	            String ts = rs.getString("tc_specialization");
	            String td = rs.getString("tc_designation");
	            
	            Teacher tcr = new Teacher(id, fname, lname, email, phone, address, nic, dob, sal, hd, pass, te,ts, td);
	            
	            tc.add(tcr);
	        }
	    }catch(Exception e) {
	    			e.printStackTrace();
	    	}
	    

	    return tc;
	}

	
	public void insertTeacher(
	        String stf_id, String stf_hireDate, String stf_fname, String stf_lname,
	        String stf_email, String stf_phone, String stf_address, String stf_nic,
	        String stf_dob, double stf_salary, String stf_password,
	        int tc_experience, String tc_specialization, String tc_designation
	    ) throws SQLException {

	        try {
	        	con = DBConnection.getConnection();
	    		//stmt = con.createStatement();
	    		
	            con.setAutoCommit(false);

	            // Insert into Staff
	            String staffSql = "INSERT INTO Staff (stf_id, stf_date, stf_Fname, stf_Lname, stf_email, stf_phone, stf_address, stf_NIC, stf_DOB, stf_salary, stf_hireDate, stf_password) "
	                            + "VALUES (?, CURDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement ps1 = con.prepareStatement(staffSql);
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
	            ps1.executeUpdate();

	            // Insert into Teacher
	            String teacherSql = "INSERT INTO Teacher (tc_id, tc_experience, tc_specialization, tc_designation) VALUES (?, ?, ?, ?)";
	            PreparedStatement ps2 = con.prepareStatement(teacherSql);
	            ps2.setString(1, stf_id);
	            ps2.setInt(2, tc_experience);
	            ps2.setString(3, tc_specialization);
	            ps2.setString(4, tc_designation);
	            ps2.executeUpdate();

	            con.commit();

	        } catch (SQLException e) {
	            con.rollback();
	            throw e;
	        }
	    }
	public static int getTeacherCount() throws Exception {
		int count = 0;
		String CountSql = "SELECT COUNT(*) FROM teacher";
		
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
