package com.shcool.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.school.Controller.DBConnection;
import com.school.model.Exam;
import com.school.model.Result;
import com.school.model.Student;

public class StudentDBUtil {

	private static Connection con = null;
	private static ResultSet rs = null;
	private static Statement stmt = null;
	
	
	//method to get exam details
	
	public static List<Exam> getExams()
	{
		ArrayList<Exam> exm = new ArrayList<>();
		
		try
		{
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			
			String sql = "SELECT E.* FROM exam E, subject S WHERE E.sub_id = S.sub_id";
			rs = stmt.executeQuery(sql);	
			
			while(rs.next())
			{
				int exam_id = rs.getInt(1);
				String sub_id = rs.getString(2);
				String date = rs.getString(3);
				int duration = rs.getInt(4);
				String type = rs.getString(5);
				int weight = rs.getInt(6);
				String description = rs.getString(7);
			
				Exam exam = new Exam (exam_id, sub_id, date,duration, type, weight, description);
				
				exm.add(exam);
				
			}
			

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return exm;
	}
	
	
	/* Method to retreive student result */
	public static List<Result> getResult(String std_id)
	{
		ArrayList<Result> res = new ArrayList<Result>();
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT SR.sub_id, S.sub_name, S.sub_credits, SR.marks, SR.grade  FROM std_result SR, subject S  WHERE SR.sub_id = S.sub_id AND SR.std_id = '"+std_id+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String subId = rs.getString(1);
				String subName = rs.getString(2);
				int credit = rs.getInt(3);
				int mark = rs.getInt(4);
				String grade = rs.getString(5);
				
				Result result = new Result(std_id, subId, subName, credit, mark, grade);
				
				res.add(result);
	
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Result error detected\n");
			e.printStackTrace();
		}
		
		return res;
		
		
	}
	
	/* Method to retreive student data */
	
	public static List<Student> getName(String stdId)
	{
		ArrayList<Student> std = new ArrayList<Student>();
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT S.std_Fname, std_Lname, S.std_email, S.std_phone, S.std_address, S.std_NIC, SP.name, SP.phone, SP.NIC, SP.occupation, SP.nationality FROM std_parent SP, student S WHERE S.std_id = SP.std_id AND S.std_id = '"+stdId+"'";
			
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String fName = rs.getString(1);
				String lName = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);
				String NIC = rs.getString(6);
				String pName = rs.getString(7);
				String pPhone = rs.getString(8);
				String pNIC = rs.getString(9);
				String occupation = rs.getString(10);
				String nationality = rs.getString(11);
				
				
				Student student = new Student(stdId, fName, lName, email, phone, address, NIC, pName,  pPhone, pNIC, occupation, nationality);
				
				std.add(student);
	
			}
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return std;
	}
	


	
	//These are not used
	
	/*Create method to calculate the credits, GPA, feeddback, Cumulative Grade Points  */
	
	//Method to calculate the GPA
	public static float calcGpa(String std_id)
	{
		
		float gpa = 0;
		float totalCredits = 0;
		float multi = 0;
		
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			int i = 0;
			
			String sql = "SELECT SR.grade, S.sub_credits FROM std_result SR, subject S WHERE S.sub_id = SR.sub_id AND SR.std_id = '"+std_id+"'";

			rs = stmt.executeQuery(sql);
			
			List<String> grades = new ArrayList<>();
	        List<Integer> credits = new ArrayList<>();
			
			
			while(rs.next())
			{
				grades.add(rs.getString(1));
				credits.add(rs.getInt(2));
			}
			
			
			for(i = 0; i < grades.size(); i++)
			{
				totalCredits += credits.get(i);
				String grade = grades.get(i);
				
				switch (grade)
	            {
	                case "A":
	                		multi += 4 * credits.get(i);
	                		break;
	                case "B":
	                		multi += 3 * credits.get(i);
	                		break;
	                case "C":
	                    	multi += 2 * credits.get(i);
	                    	break;
	                case "D":
	                    	multi += 1 * credits.get(i);
	                    	break;
	                default:
	                    	multi += 0;
	            }
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		gpa = multi/totalCredits;
		
		System.out.println(gpa);
		
		return gpa;
	}
	
	
	
	//Method to calculate the total credits
	public static int totalCredits(String std_id)
	{
		int total = 0;
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT SUM(sub_credits) FROM std_result SR, subject S WHERE SR.sub_id = S.sub_id AND SR.std_id = '"+std_id+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
			
				total = rs.getInt(1);
			
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return total;
	
	}
	
	
	//Method to get the umulative grade points
	//Same as the GPA calculation, but its not devided by the total number of credits
	
	public static float getCPoints(String std_id)
	{
	
		float multi = 0;

		try
		{

			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			int i = 0;
			
			String sql = "SELECT SR.grade, S.sub_credits FROM std_result SR, subject S WHERE S.sub_id = SR.sub_id AND SR.std_id = '"+std_id+"'";

			rs = stmt.executeQuery(sql);
			
			List<String> grades = new ArrayList<>();
	        List<Integer> credits = new ArrayList<>();
	        
	        while(rs.next())
			{
				grades.add(rs.getString(1));
				credits.add(rs.getInt(2));
			}
			
			
			for(i = 0; i < grades.size(); i++)
			{
	
				String grade = grades.get(i);
				
				switch (grade)
	            {
	                case "A":
	                		multi += 4 * credits.get(i);
	                		break;
	                case "B":
	                		multi += 3 * credits.get(i);
	                		break;
	                case "C":
	                    	multi += 2 * credits.get(i);
	                    	break;
	                case "D":
	                    	multi += 1 * credits.get(i);
	                    	break;
	                default:
	                    	multi += 0;
	            }
			}
	        
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return multi;
		
	}
	
	
	//feedBack generation
	
	/*
	public static String genFeedback(float gpa)
	{
		String feedback = "";
		
		try
		{
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
				if(gpa < 2.0)
				{
					feedback = "This GPA is just one chapter, don't be discouraged. Keep learning, stay focused, and trust that your hard work will pay off.";
					
				}
				else if(gpa < 3.0 && gpa >= 2.0)
				{
					feedback ="You're on the right track, nice work! Keep building on this momentum, stay consistent, and aim even higher. You're capable of great things!";
				}
				else if (gpa >= 3.0 && gpa < 3.7)
				{
					feedback = "Great job! Your hard work is clearly paying off. Keep up the strong effort, you're well on your way to excellence!";
					
				}
				else if (gpa >= 3.7 && gpa <= 4.0)
				{
					feedback = "Great achievement! Your hard work is shining through. Keep pushing forward, you're doing fantastic!";
				}
				else
				{
					System.out.println("Invalid gpa value");
				}

			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return feedback;
		
	} */
}
