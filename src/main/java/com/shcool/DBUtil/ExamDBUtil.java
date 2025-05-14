package com.shcool.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.school.Controller.DBConnection;
import com.school.model.Student;
import com.school.model.Subject;

public class ExamDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	/*method to store Exam details */
	
	public static boolean insertExam(String sub_id, String date, int duration, String type, int weight, String description)
	{
		boolean isSuccess = false;
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();			
			
			String sql = "INSERT INTO exam VALUES (0, '"+sub_id+"', '"+date+"', '"+duration+"', '"+type+"', '"+weight+"', '"+description+"')";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false;
			}
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	/* Method to store Exam results */
	
	public static boolean insertResult(String std_id, String sub_id, int marks, String date)
	{
		boolean isSuccess = false;
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//A trigger will be called to claculate the grade based on the marks
			String sql = "INSERT INTO std_result (std_id, sub_id, marks, res_date) VALUES ('"+std_id+"', '"+sub_id+"', '"+marks+"','"+date+"')";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false;
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Error occured");
			e.printStackTrace();
		}
		
		return isSuccess;
	}


	/*Method to retreive subject ID from the subject table and display them in the dropdown menu*/
	/*In publish result page */

	public static List<Subject> getSubId()
	{
		ArrayList<Subject> sub = new ArrayList<Subject>();

		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT sub_id, sub_name FROM subject";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String sub_id = rs.getString(1);
				String sub_name = rs.getString(2);
				
				Subject subject = new Subject(sub_id, sub_name);
				
				
				sub.add(subject);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Error detected");
		}
		
		return sub;
		

		
	}
	
	/* Method to retreive student ID nums that matches the subject ID*/
	
	public static List<Student> getStdId(String subId)
	{
		ArrayList<Student> std = new ArrayList<Student>();
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT std_id FROM std_subject WHERE sub_id = '"+subId+"'";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				String stdId = rs.getString(1);
				
				Student student = new Student(stdId, subId);
				
				std.add(student);
			}
	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Student Error detected");
			
		}
		
		return std;

	}
}
	

