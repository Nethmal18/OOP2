package com.school.model;

public class Notice {
	private int noticeId;
	private String tId;
	private String title;
	private String description ;
	private String date;
	private String type;
	
	public Notice(int noticeId, String tId, String title, String description, String date, String type) {
		
		this.noticeId = noticeId;
		this.tId = tId;
		this.title = title;
		this.description = description;
		this.date = date;
		this.type = type;
	}
	
	public int getNoticeId() {
		return noticeId;
	}
	public String getTid() {
		return tId;
	}
	public String getTitle() {
		return title;
	}
	public String getDescription() {
		return description;
	}
	public String getDate() {
		return date;
	}
	public String getType() {
		return type;
	}
	
	
}
