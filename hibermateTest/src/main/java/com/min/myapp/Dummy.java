package com.min.myapp;

public class Dummy {
	
	private int idx;
	private String pw;
	private String content;
	
	
	public Dummy() {}
	
	public Dummy(int idx) {
		this.idx = idx;
	}

	public Dummy(int idx, String content) {
		this.idx = idx;
		this.content = content;
	}
	
	public Dummy(String content) {
		this.content = content;
	}
	
	public Dummy(String pw, String content) {
		this.pw = pw;
		this.content = content;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
}
