package com.min.myapp;

import java.sql.Date;

public class boardminDto {

	private int no;
	private String id;
	private String content;
	private Date day;
	
	public boardminDto() {}
	public boardminDto(int no,String id,String content,Date day) {
		this.no=no;
		this.id=id;
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
