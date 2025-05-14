package com.school.model;

public class CM extends Staff{
	private  String cm_id;
	private String cm_role;
	
	public CM(String id, String fname, String lname, String email, String phone, String address, String nic, String dob,
			double salary, String hireDate, String password, String cm_id, String cm_role) {
		super(id, fname, lname, email, phone, address, nic, dob, salary, hireDate, password);
		this.cm_role = cm_role;
		this.cm_id = cm_id;
	}

	public String getCm_id() {
		return cm_id;
	}

	public String getCm_role() {
		return cm_role;
	}
	
}
