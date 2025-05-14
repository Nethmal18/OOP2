package com.school.model;

public class Subject {

	private String subId;
	private String subName;
	

	public Subject(String sub_id, String subName)
	{
		this.subId = sub_id;
		this.subName = subName;
	}

	public String getSubId() {
        return subId;
    }
	
	public String getSubName() {
        return subName;
    }
	

}
