package com.min.myapp;

public class beanDto {
	private int idx;
	private String id;
	private String pw;
	private String name;
	
	public beanDto() {}
	public beanDto(int idx, String id, String pw, String name) {
		this.idx=idx;
		this.id=id;
		this.pw=pw;
		this.name=name;
		
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
	
}
