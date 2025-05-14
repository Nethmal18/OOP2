package com.school.model;

public class Teacher extends Staff{
	
	private int experience;
    private String specialization;
    private String designation;
    
	public Teacher(String id, String fname, String lname, String email, String phone, String address, String nic,
			String dob, double salary, String hireDate, String password, int ex, String sp, String ds) {
		super(id, fname, lname, email, phone, address, nic, dob, salary, hireDate, password);
		experience = ex;
		specialization =sp;
		designation = ds;
	}

	public int getExperience() {
		return experience;
	}

	public String getSpecialization() {
		return specialization;
	}

	public String getDesignation() {
		return designation;
	}

	
}
