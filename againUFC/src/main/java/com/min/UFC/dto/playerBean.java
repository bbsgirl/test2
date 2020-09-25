package com.min.UFC.dto;

public class playerBean {
	
	
	private String name;
	private String age;
	private String nationality;
	private String height;
	private int weight;
	private int win;
	private int lose;
	
	
	public playerBean() {}
	
	public playerBean(String name, String age, String nationality, String height, int weight, int win, int lose) {
		super();
		this.name = name;
		this.age = age;
		this.nationality = nationality;
		this.height = height;
		this.weight = weight;
		this.win = win;
		this.lose = lose;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	
	
	

	

}
