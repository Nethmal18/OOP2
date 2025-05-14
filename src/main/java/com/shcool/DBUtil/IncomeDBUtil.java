package com.shcool.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.school.Controller.DBConnection;
import com.school.model.Income;

import java.sql.Statement;
import java.sql.Connection;


public class IncomeDBUtil {
	 private static boolean isSuccess;
	    private static Connection con = null;
	    private static Statement stmt = null;
	    private static ResultSet rs = null;

	    public static boolean addIncome(String type, double amount, String date) {
	        boolean isSuccess = false;

	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "INSERT INTO incomes (income_type, amount, date) VALUES ('"+type+"', '"+amount+"', '"+date+"')";
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return isSuccess;
	    }

	    public static List<Income> getAllIncomes() {
	        ArrayList<Income> incomes = new ArrayList<>();

	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "SELECT * FROM incomes";
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                int id = rs.getInt(1);
	                String type = rs.getString(2);
	                double amount = rs.getDouble(3);
	                String date = rs.getString(4);

	                Income income = new Income(id, type, amount, date);
	                incomes.add(income);
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return incomes;
	    }
	    public static boolean updateIncome(int id, String type, double amount, String date) {
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "UPDATE incomes SET income_type='"+type+"', amount='"+amount+"', date='"+date+"' WHERE id="+id+"";
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

	    public static boolean deleteIncome(int id) {
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "DELETE FROM incomes WHERE id="+id+"";
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

