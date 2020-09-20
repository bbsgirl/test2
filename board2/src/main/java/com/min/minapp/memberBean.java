package com.min.minapp;

public class memberBean {

	private int idx;
	private String id;
	private String pw;
	private String name;
	private String gender;
	
	public memberBean() {}
	public memberBean(int idx, String id, String pw, String name, String gender) {
		this.idx=idx;
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.gender=gender;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}
