package com.min.myapp;

public class boardinsertDto {
	
	private int idx;
	private String id ;
	private String content;
	private String date;
	
	public boardinsertDto(int idx, String id, String content, String date) {
		super();
		this.idx = idx;
		this.id = id;
		this.content = content;
		this.date = date;
	}
	
	public boardinsertDto() {}
	
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
