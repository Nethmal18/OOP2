package com.shcool.DBUtil;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.school.Controller.DBConnection;
import com.school.model.Notice;

public class noticeDBUtil{
	
	//for the DB connection
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//Method for creating new notices
	public static boolean insertNotice(String t_id, String title, String description, String date, String type)
	{
	
	boolean isSuccess = false;
	
	try
	{
		//for the DB connection
		con = DBConnection.getConnection();
		stmt = con.createStatement();
		
		//dont insert PK manually since its incremnted automatically
		String sql = "INSERT INTO Notice VALUES (0, '"+t_id+"', '"+title+"','"+description+"', '"+date+"', '"+type+"')";
			
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0)
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
	
	//Method for retreiving and displaying notices in the Data base
	public static List<Notice> getNotice()
	{
		ArrayList<Notice> ntc = new ArrayList<>();
		
		try
		{
			con = DBConnection.getConnection() ;
			stmt = con.createStatement();
			
			String sql = "SELECT*FROM Notice";
			
			rs = stmt.executeQuery(sql);
			
			//retreiving data base values if the notice id is valid
			while(rs.next())
			{
				int n_id = rs.getInt(1);
				String t_id = rs.getString(2);
				String title = rs.getString(3);
				String description = rs.getString(4);
				String date = rs.getString(5);
				String type = rs.getString(6);
				
				Notice notice = new Notice(n_id, t_id, title, description, date, type);
				
				//adding object to the array list
				ntc.add(notice);
				
	
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//returning array list
		return ntc;
	}
	
	
	
	
	
	//Method to update notice
	public static boolean updateNotice(int notice_id, String t_id, String title, String description, String date, String type)
	{
		boolean isSuccess = false;
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//Query to update the table for the given notice ID
			String sql = "UPDATE Notice SET t_id = '"+t_id+"', notice_title = '"+title+"', notice_description =  '"+description+"', notice_date = '"+date+"', notice_type = '"+type+"' WHERE notice_id = '"+notice_id+"'";

			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
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
	
	
	//Method to delete notice
	
	public static boolean deleteNotice(int noticeId)
	{
		boolean isSuccess = false;
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "DELETE FROM Notice WHERE notice_id = '"+noticeId+"'";
			
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
	
	
}


