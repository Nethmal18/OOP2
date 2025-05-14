package com.shcool.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.school.Controller.DBConnection;
import com.school.model.Card;

public class PaymentDBUtil {
	
	private static Connection con = null;
	private static ResultSet rs = null;
	private static Statement stmt = null;
	
	
	//Method to get saved card information
	
	public static List<Card> getCard()
	{
		ArrayList<Card> card = new ArrayList<Card>();
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			
			
			String sql = "SELECT*FROM card";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String cardNum = rs.getString(1);
				String expDate = rs.getString(2);
				int cvv = rs.getInt(3);
				String bank = rs.getString(4);
				
				Card cd = new Card(cardNum, expDate, cvv, bank);
				
				
				card.add(cd);
	
			}	
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return card;
		
	}
	
	//Method to insert payment information to the DB
	
	public static boolean payAmount(String std_id, float amount, String date)
	{
		boolean isTrue = false;
		
		try
		{
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO payment (std_id, amount, payment_date, payment_method) VALUES ('"+std_id+"', '"+amount+"', '"+date+"', 'card')"; 
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				System.out.println("Data retreived !!");
				isTrue = true;
			}
			else
			{
				System.out.println("Data not retreived!!");
				isTrue = false;
			}
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isTrue;
	}
	
	//Method to store card information in the DB
	
	public static boolean saveCard(String cardNum, String expDate, int cvv, String bank)
	{
		boolean isTrue = false;
		
		try
		{
		con = DBConnection.getConnection();
		stmt = con.createStatement();
		
		String sql = "INSERT INTO card VALUES ('"+cardNum+"', '"+expDate+"', '"+cvv+"', '"+bank+"')";
		
		int rs = stmt.executeUpdate(sql);
		
			if (rs > 0)
			{
				isTrue = true;
				System.out.println("Data inserted successfully!");
			}
			else
			{
				isTrue = false;
				System.out.println("Data insertion failed!");
			}
			
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isTrue;
	}

}
