package com.min.UFC.dto;

public class Product {
	private int idx;
	private String name;
	private int price;
	private int count;
	
	
	
	public Product() {}
	
	public Product(int idx, String name, int price, int count) {
		super();
		this.idx = idx;
		this.name = name;
		this.price = price;
		this.count = count;
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
