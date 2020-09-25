package com.min.UFC.dto;

public class StoreBean {
	private int idx;
	private String id;
	private String p_name;
	private int price;
	private int count;
	private String dup;
	
	
	public StoreBean() {}
	
	public StoreBean(int idx, String id, String p_name, int price, int count, String dup) {
		super();
		this.idx = idx;
		this.id = id;
		this.p_name = p_name;
		this.price = price;
		this.count = count;
		this.dup = dup;
	}
	public String getDup() {
		return dup;
	}
	public void setDup(String dup) {
		this.dup = dup;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
