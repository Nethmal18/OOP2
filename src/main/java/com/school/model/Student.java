package com.school.model;

public class Student {
	
	private String stdId;
	private String subId;
	private String fName;
	private String lName;
	private String email;
	private String phone;
	private String address;
	private String NIC;
	private String pName;
	private String pPhone;
	private String pNIC;
	private String occupation;
	private String nationality;
	
	
	public Student(String stdId, String subId) {
		
		this.stdId = stdId;
		this.subId = subId;
	}
	
	public Student(String stdId, String fName, String lName, String email, String phone, String address,
			String nIC, String pName, String pPhone, String pNIC,  String occupation, String nationality) {
		
		this.stdId = stdId;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.NIC = nIC;
		this.pName = pName;
		this.pPhone = pPhone;
		this.pNIC = pNIC;
		this.occupation = occupation;
		this.nationality = nationality;
	}





	public String getEmail() {
		return email;
	}
	

	public String getpNIC() {
		return pNIC;
	}

	public void setpNIC(String pNIC) {
		this.pNIC = pNIC;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public String getNIC() {
		return NIC;
	}

	public String getpName() {
		return pName;
	}

	public String getpPhone() {
		return pPhone;
	}

	public String getOccupation() {
		return occupation;
	}

	public String getNationality() {
		return nationality;
	}

	public String getStdId() {
		return stdId;
	}
	
	public String getSubId()
	{
		return subId;
	}
	

	public String getfName() {
		return fName;
	}

	public String getlName() {
		return lName;
	}


	
}
