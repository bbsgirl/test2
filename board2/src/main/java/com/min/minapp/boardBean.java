package com.min.minapp;

import java.util.Date;

public class boardBean {
	
	private int no;
	private String id;
	private String gender;
	private String content;
	private Date day;
	
	public boardBean() {}
	
	public boardBean(int no, String id ,String gender , String content, Date day) {
		this.no=no;
		this.id=id;
		this.gender=gender;
		this.content=content;
		this.day=day;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}
		

}
