package com.school.Controller;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.shcool.DBUtil.teacherDBUtil;

@WebServlet("/TeacherInsertServlet")
public class TeacherInsertServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		try {
			if ("insert".equals(action)) {
				insertTeacher(request, response);
			} else if ("update".equals(action)) {System.out.println("Update");
				updateTeacher(request, response);
				
			} else if ("delete".equals(action)) {
				deleteTeacher(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("unsuccess.jsp");
			System.out.println("Faliur");
		}
	}

	private void insertTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        // Get staff parameters
	        String stf_id = request.getParameter("stf_id");
	        String stf_hireDate = request.getParameter("stf_hireDate");
	        String stf_fname = request.getParameter("stf_fname");
	        String stf_lname = request.getParameter("stf_lname");
	        String stf_email = request.getParameter("stf_email");
	        String stf_phone = request.getParameter("stf_phone");
	        String stf_address = request.getParameter("stf_address");
	        String stf_nic = request.getParameter("stf_nic");
	        String stf_dob = request.getParameter("stf_dob");
	        String stf_password = request.getParameter("stf_password");

	        // Validate and parse stf_salary
	        String salaryStr = request.getParameter("stf_salary");
	        double stf_salary;
	        if (salaryStr != null && !salaryStr.trim().isEmpty()) {
	            stf_salary = Double.parseDouble(salaryStr.trim());
	        } else {
	            System.out.println("Salary field is empty");
	            response.sendRedirect("unsuccess.jsp");
	            return;
	        }

	        // Get and validate Teacher-specific fields
	        String experienceStr = request.getParameter("tc_experience");
	        int tc_experience;
	        if (experienceStr != null && !experienceStr.trim().isEmpty()) {
	            tc_experience = Integer.parseInt(experienceStr.trim());
	        } else {
	            System.out.println("Experience field is empty");
	            response.sendRedirect("unsuccess.jsp");
	            return;
	        }

	        String tc_specialization = request.getParameter("tc_specialization");
	        String tc_designation = request.getParameter("tc_designation");

	        // Insert into database
	        try (Connection con = DBConnection.getConnection()) {
	            String staffQuery = "INSERT INTO Staff (stf_id, stf_hireDate, stf_fname, stf_lname, stf_email, stf_phone, stf_address, stf_nic, stf_dob, stf_salary, stf_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement staffStmt = con.prepareStatement(staffQuery);
	            staffStmt.setString(1, stf_id);
	            staffStmt.setString(2, stf_hireDate);
	            staffStmt.setString(3, stf_fname);
	            staffStmt.setString(4, stf_lname);
	            staffStmt.setString(5, stf_email);
	            staffStmt.setString(6, stf_phone);
	            staffStmt.setString(7, stf_address);
	            staffStmt.setString(8, stf_nic);
	            staffStmt.setString(9, stf_dob);
	            staffStmt.setDouble(10, stf_salary);
	            staffStmt.setString(11, stf_password);

	            int staffResult = staffStmt.executeUpdate();

	            if (staffResult > 0) {
	                String teacherQuery = "INSERT INTO Teacher (tc_id, tc_experience, tc_specialization, tc_designation) VALUES (?, ?, ?, ?)";
	                PreparedStatement teacherStmt = con.prepareStatement(teacherQuery);
	                teacherStmt.setString(1, stf_id);
	                teacherStmt.setInt(2, tc_experience);
	                teacherStmt.setString(3, tc_specialization);
	                teacherStmt.setString(4, tc_designation);

	                int teacherResult = teacherStmt.executeUpdate();

	                if (teacherResult > 0) {
	                	request.setAttribute("targetPage", "TeacherServlet");
	                    response.sendRedirect("Success.jsp");
	                } else {
	                    response.sendRedirect("unsuccess.jsp");
	                }
	            } else {
	                response.sendRedirect("unsuccess.jsp");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Exception occurred during insertion");
	        response.sendRedirect("unsuccess.jsp");
	    }
	}



	private void updateTeacher(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException {
		    System.out.println("TeacherUpdate Started");
		    
		    // Get parameters from request
		    String stf_id = request.getParameter("stf_id");
		    String stf_hireDate = request.getParameter("stf_hireDate");
		    String stf_fname = request.getParameter("stf_fname");
		    String stf_lname = request.getParameter("stf_lname");
		    String stf_email = request.getParameter("stf_email");
		    String stf_phone = request.getParameter("stf_phone");
		    String stf_address = request.getParameter("stf_address");
		    String stf_nic = request.getParameter("stf_nic");
		    String stf_password = request.getParameter("stf_password");
		    String stf_dob = request.getParameter("stf_dob");
		    
		    // Debug print to check parameters
		    System.out.println("DOB Parameter: " + stf_dob);
		    
		    Double stf_salary = Double.parseDouble(request.getParameter("stf_salary"));
		    int tc_experience = Integer.parseInt(request.getParameter("tc_experience"));
		    String tc_specialization = request.getParameter("tc_specialization");
		    String tc_designation = request.getParameter("tc_designation");
		    
		    // Call database utility method with parameters in the correct order
		    boolean isTrue = teacherDBUtil.updateTeacher(stf_id, stf_hireDate, stf_fname, stf_lname, 
		        stf_email, stf_dob, stf_phone, stf_address, stf_nic, stf_salary, 
		        stf_password, tc_experience, tc_specialization, tc_designation);
		    
		    if(isTrue == true) {
		        request.setAttribute("targetPage", "TeacherServlet");
		        RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
		        dis.forward(request, response);
		    } else {
		        RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
		        dis1.forward(request, response);
		    }
		}



	private void deleteTeacher(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tid = request.getParameter("id");
		
		boolean isSuccess = false;

	    try {
	        Connection con = DBConnection.getConnection();
	        Statement stmt = con.createStatement();

	        String sql = "DELETE FROM teacher WHERE tc_id='" + tid + "'";
	        String Ssql = "DELETE FROM staff WHERE stf_id = '" + tid + "'";
	        
	        int result = stmt.executeUpdate(sql);
	        int Result = stmt.executeUpdate(Ssql);
	        
	        if (result > 0 && Result > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	    if (isSuccess) {
            response.sendRedirect("TeacherServlet"); // or reload the list
        } else {
            request.setAttribute("error", "Failed to delete student.");
            RequestDispatcher dis = request.getRequestDispatcher("TeacherServlet");
            dis.forward(request, response);
        }
	}
}
