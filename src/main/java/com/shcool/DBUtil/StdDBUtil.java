package com.shcool.DBUtil;

import java.sql.*;
import java.util.*;

import com.school.Controller.DBConnection;
import com.school.Controller.Students;

public class StdDBUtil {
	
	private static boolean isSuccess =false;
	private static Connection con = null;
	private static Statement stmt = null;
	//private static ResultSet rs = null;
	
    public static List<Students> Display() {
        ArrayList<Students> st = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection(); 
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM student";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String sid = rs.getString("std_id");
                //System.out.println("Found student: " + sid); // log
                String Fname = rs.getString("std_Fname");
                String Lname = rs.getString("std_Lname");
                String email = rs.getString("std_email");
                String phone = rs.getString("std_phone");
                String address = rs.getString("std_address");
                String nic = rs.getString("std_NIC");
                String dob = rs.getString("std_DOB");
                String passU = rs.getString("std_password");

                Students std = new Students(sid, Fname, Lname, email, phone, address, nic, dob, passU);
                st.add(std);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return st;
    }

	public static boolean insertStudent(String sid, String Fname, String Lname, String email, String phone, String address, 
			String nic, String dob, String pass) {
		
		
		try {
			con = DBConnection.getConnection();
    		stmt = con.createStatement();
    		
    		String sql = "INSERT INTO student VALUES('"+sid+"', '"+Fname+"', '"+Lname+"', '"+email+"','"+phone+"', '"+address+"', '"+nic+"', '"+dob+"', '"+pass+"')";
    		int rsin = stmt.executeUpdate(sql);
    		
    		//check have the sql statement executed correctly
    		if(rsin > 0) {
    			isSuccess = true;
    		}else {
    			isSuccess = false;
    		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
		//Update Student code[ there was a mistake that  had  a big space in where clause sql did not work]
	/*
	public static boolean updatestudent(String sid, String Fname, String Lname, String email, String phone, String address, 
			String nic, String dob, String pass) {
		
		try {
			con =DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE student SET std_Fname='"+Fname+"', std_Lname='"+Lname+"', std_email='"+email+"', std_phone='"+phone+"', std_address='"+address+"', std_NIC='"+nic+"', std_DOB='"+dob+"', std_password='"+pass+"'"
					+ "WHERE	 std_id='"+sid+"'";
			int rsm =stmt.executeUpdate(sql);
			
			//check have the sql statement executed correctly
    		if(rsm > 0) {
    			isSuccess = true;
    		}else {
    			isSuccess = false;
    		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	} */
	public static boolean updatestudent(String sid, String Fname, String Lname, String email, String phone, String address, 
            String nic, String dob, String pass) {
		
		boolean isSuccess = false;

		String sql = "UPDATE student SET std_Fname=?, std_Lname=?, std_email=?, std_phone=?, std_address=?, std_NIC=?, std_DOB=?, std_password=? WHERE std_id=?";

		try (
			Connection con = DBConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
				pstmt.setString(1, Fname);
				pstmt.setString(2, Lname);
				pstmt.setString(3, email);
				pstmt.setString(4, phone);
				pstmt.setString(5, address);
				pstmt.setString(6, nic);
				pstmt.setString(7, dob);
				pstmt.setString(8, pass);
				pstmt.setString(9, sid);
				
				int rsm = pstmt.executeUpdate();
				isSuccess = (rsm > 0);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		}

	public static boolean deleteStudent(String sid) {
		
		 boolean isSuccess = false;

		    try {
		        Connection con = DBConnection.getConnection();
		        Statement stmt = con.createStatement();

		        String sql = "DELETE FROM student WHERE std_id='" + sid + "'";
		        int result = stmt.executeUpdate(sql);

		        if (result > 0) {
		            isSuccess = true;
		        } else {
		            isSuccess = false;
		        }

		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return isSuccess;
	} 
	
	public static int getStudentCount() throws Exception {
		int count = 0;
		String CountSql = "SELECT COUNT(*) FROM student";
		
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
