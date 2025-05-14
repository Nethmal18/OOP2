package com.shcool.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.school.Controller.DBConnection;
import com.school.model.Expenses;

import java.sql.Statement;
import java.sql.Connection;


public class ExpensesDBUtil {
	 private static boolean isSuccess;
	    private static Connection con = null;
	    private static Statement stmt = null;
	    private static ResultSet rs = null;

	    public static boolean addExpenses(String etype, double eamount, String edate) {
	        boolean isSuccess = false;

	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "INSERT INTO expenses (Expenses_type, ex_amount, date) VALUES ('"+etype+"', '"+eamount+"', '"+edate+"')";
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return isSuccess;
	    }

	    public static List<Expenses> getAllExpenses() {
	        ArrayList<Expenses> expenses = new ArrayList<>();

	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "SELECT * FROM expenses";
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                int eid = rs.getInt(1);
	                String etype = rs.getString(2);
	                double eamount = rs.getDouble(3);
	                String edate = rs.getString(4);

	                Expenses expense= new Expenses(eid, etype, eamount, edate);
	                expenses.add(expense);
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return expenses;
	    }
	    public static boolean updateExpenses(int eid, String etype, double eamount, String edate) {
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "UPDATE expenses SET Expenses_type='"+etype+"', ex_amount='"+eamount+"', date='"+edate+"' WHERE ex_id="+eid+"";
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return isSuccess;
	    }

	    public static boolean deleteExpenses(int eid) {
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "DELETE FROM expenses WHERE ex_id="+eid+"";
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return isSuccess;
	    }
	}


