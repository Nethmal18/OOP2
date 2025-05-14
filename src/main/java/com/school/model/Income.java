package com.school.model;

public class Income {
	    private int id;
	    private String incomeType;
	    private double amount;
	    private String date;
		public Income(int id, String incomeType, double amount, String date) {
			this.id = id;
			this.incomeType = incomeType;
			this.amount = amount;
			this.date = date;
		}
		public int getId() {
			return id;
		}
		public String getIncomeType() {
			return incomeType;
		}
		public double getAmount() {
			return amount;
		}
		public String getDate() {
			return date;
		}

		

}
