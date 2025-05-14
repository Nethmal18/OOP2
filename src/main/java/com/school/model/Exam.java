package com.school.model;

public class Exam {
	
	private int exam_id;
	private String sub_id;
	private String date;
	private int duration;
	private String type;
	private int weight;
	private String description;
	
	
	public Exam(int exam_id, String sub_od, String date, int duration, String type, int weight, String description) {
		this.exam_id = exam_id;
		this.sub_id = sub_od;
		this.date = date;
		this.duration = duration;
		this.type = type;
		this.weight = weight;
		this.description = description;
	}
	
	public int getExam_id() {
		return exam_id;
	}

	public String getSub_id() {
		return sub_id;
	}

	public String getDate() {
		return date;
	}

	public int getDuration() {
		return duration;
	}

	public String getType() {
		return type;
	}

	public int getWeight() {
		return weight;
	}

	public String getDescription() {
		return description;
	}


}
