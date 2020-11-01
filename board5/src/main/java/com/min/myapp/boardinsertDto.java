package com.min.myapp;

import java.util.Date;

public class boardinsertDto {
	
	private int idx;
	private String id ;
	private String content;
	private String gender;
	private Date day;
	
	
	public boardinsertDto() {}
	
	
	public boardinsertDto(int idx, String id, String content, String gender, Date day) {
		
		this.idx = idx;
		this.id = id;
		this.content = content;
		this.gender = gender;
		this.day = day;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	
}
