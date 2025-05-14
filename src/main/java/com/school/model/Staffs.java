package com.school.model;

public class Staffs {
    protected String id;
    protected String fname;
    protected String lname;
    protected String email;
    protected String phone;
    protected String address;
    protected String nic;
    protected String dob;
    protected double salary;
    protected String hireDate;
    protected String password;
    
    //    
	public Staffs(String id, String fname, String lname, String email, String phone, String address, String nic,
			String dob, double salary, String hireDate, String password) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.nic = nic;
		this.dob = dob;
		this.salary = salary;
		this.hireDate = hireDate;
		this.password = password;
	}
	
	//
	public Staffs(String stf_id1, String stf_passwords) {
		this.id = stf_id1;
		this.password=stf_passwords;
		
	}
	
	public String getId() {
		return id;
	}
	public String getFname() {
		return fname;
	}
	public String getLname() {
		return lname;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress() {
		return address;
	}
	public String getNic() {
		return nic;
	}
	public String getDob() {
		return dob;
	}
	public double getSalary() {
		return salary;
	}
	public String getHireDate() {
		return hireDate;
	}
	public String getPassword() {
		return password;
	}
	

    
}

