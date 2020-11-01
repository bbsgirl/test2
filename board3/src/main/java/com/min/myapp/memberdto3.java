package com.min.myapp;

public class memberdto3 {
	
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String email1;
	private String email2;
	private String gender;
	
	public memberdto3() {}

	public memberdto3(int idx, String id, String pw, String name, String email1, String email2, String gender) {
		super();
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
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

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	
	
}