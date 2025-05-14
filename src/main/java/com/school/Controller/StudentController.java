package com.school.Controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class StudentController {
    
    // Method to get the next student ID
    private static String getNextStudentId(Connection con) throws SQLException {
        String nextId = "ST12341"; // Default starting ID if no records exist
        
        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT std_id FROM student ORDER BY std_id DESC LIMIT 1")) {
            
            if (rs.next()) {
                // Extract the current highest ID
                String currentId = rs.getString("std_id");
                
                // Extract the numeric part
                if (currentId != null && currentId.startsWith("ST")) {
                    String numPart = currentId.substring(2); // Remove "ST" prefix
                    try {
                        // Parse to integer, increment, and format back
                        int idNum = Integer.parseInt(numPart);
                        idNum++; // Increment
                        nextId = "ST" + idNum;
                    } catch (NumberFormatException e) {
                        System.out.println("Could not parse ID number: " + e.getMessage());
                        // Fall back to default
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting next student ID: " + e.getMessage());
            throw e;
        }
        
        return nextId;
    }
    
    //Insert Data Function
    public static boolean insertdata(String std_Fname, String std_Lname, String std_email, String std_phone,
            String std_address, String std_NIC, String std_DOB, String std_password) {
        
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            //DB Connection Call
            con = DBConnection.getConnection();
            
            // Get next available student ID
            String std_id = getNextStudentId(con);
            System.out.println("Generated student ID: " + std_id);
         
            //Using PreparedStatement to prevent SQL injection
            String sql = "INSERT INTO student (std_id, std_Fname, std_Lname, std_email, std_phone, std_address, std_NIC, std_DOB, std_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            
            // Set parameters in the prepared statement
            pstmt.setString(1, std_id);
            pstmt.setString(2, std_Fname);
            pstmt.setString(3, std_Lname);
            pstmt.setString(4, std_email);
            pstmt.setString(5, std_phone);
            pstmt.setString(6, std_address);
            pstmt.setString(7, std_NIC);
            pstmt.setString(8, std_DOB);
            pstmt.setString(9, std_password);
           
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("General error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
}