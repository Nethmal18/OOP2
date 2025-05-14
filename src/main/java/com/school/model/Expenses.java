package com.school.model;

public class Expenses {
	    private int ex_id;
	    private String Expenses_type;
	    private double ex_amount;
	    private String date;
		public Expenses(int ex_id, String expenses_type, double ex_amount, String date) {
			
			this.ex_id = ex_id;
			Expenses_type = expenses_type;
			this.ex_amount = ex_amount;
			this.date = date;
		}
		public int getEx_id() {
			return ex_id;
		}
		public String getExpenses_type() {
			return Expenses_type;
		}
		public double getEx_amount() {
			return ex_amount;
		}
		public String getDate() {
			return date;
		}


}
