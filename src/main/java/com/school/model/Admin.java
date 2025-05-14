package com.school.model;

public class Admin extends Staff{
	private String aid;
	private int systemAccess;
	private String designation;
	
	public Admin(String id, String fname, String lname, String email, String phone, String address, String nic,
			String dob, double salary, String hireDate, String password, String aid, int systemAccess,
			String designation) {
		super(id, fname, lname, email, phone, address, nic, dob, salary, hireDate, password);
		this.aid = aid;
		this.systemAccess = systemAccess;
		this.designation = designation;
	}

	public String getAid() {
		return aid;
	}

	public int getSystemAccess() {
		return systemAccess;
	}

	public String getDesignation() {
		return designation;
	}

}
