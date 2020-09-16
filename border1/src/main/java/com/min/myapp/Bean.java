package com.min.myapp;

import java.util.Date;

public class Bean {
	
	private int idx;
	private String name;
	private String content;
	private Date date1;//date·Î ÁöÁ¤
	
	
	public Bean() {	}
	

	
	public Bean(int idx, String name, String content, Date date1 ) {
		this.idx=idx;
		this.name=name;
		this.content=content;
		this.date1=date1;
		
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	
	
	
}
