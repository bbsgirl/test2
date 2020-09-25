package com.min.UFC.dto;

public class MemberBean {
	private int idx;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String admin;
	
	
	
	public MemberBean() {}
	
	
	public MemberBean(int idx, String id, String pw, String name, int age, String gender, String admin) {
		super();
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.admin = admin;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
}
