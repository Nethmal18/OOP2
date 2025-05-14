package com.school.model;

public class Result {
	
	private String stdId;
	private String subId;
	private int mark;
	private String grade;
	private int credit;
	private String subName;
	
	public Result(String stdId, String subId, String subName, int credit, int mark, String grade) 
	{
		this.stdId = stdId;
		this.subName = subName;
		this.credit = credit;
		this.subId = subId;
		this.mark = mark;
		this.grade = grade;
	}
	
	public int getCredit() {
		return credit;
	}

	public String getSubName() {
		return subName;
	}

	public String getStdId() {
		return stdId;
	}
	public String getSubId() {
		return subId;
	}
	public int getMark() {
		return mark;
	}
	public String getGrade() {
		return grade;
	}

	
}
