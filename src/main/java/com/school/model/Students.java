package com.school.model;

//import java.sql.Date;

public class Students {
	private String sid;
	private String Fname;
	private String Lname;
	private String email;
	private String phone;
	private String address;
	private String nic;
	private String dob;
	private String pass;
	
	public Students(String sid, String fname, String lname, String email, String phone, String address, String nic,String dob, String pass)
	{
		super();
		this.sid = sid;
		Fname = fname;
		Lname = lname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.nic = nic;
		this.dob = dob;
		this.pass = pass;
	}
	public String getSid() {
		return sid;
	}
	public String getFname() {
		return Fname;
	}
	public String getLname() {
		return Lname;
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
	public String getPass() {
		return pass;
	}
	/*public void setSid(String sid) {
		this.sid = sid;
	}
	public void setFname(String fname) {
		Fname = fname;
	}
	public void setLname(String lname) {
		Lname = lname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	*/
	
	
}
