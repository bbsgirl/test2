package com.min.UFC.dto;

public class GameBean {
	 private int idx;
	 private String g_name;
	 private String g_time;
	 private String g_date;
	 private String g_place;
	 private String g_player1;
	 private String g_player2;
	 private int t_ticket;
	 private int t_price;
	 private String g_img;
	 private String g_weight;
	 private String isfinish;
	 
	 
	 
	public GameBean() {	}
	
	public GameBean(int idx, String g_name, String g_time, String g_date, String g_place, String g_player1,
			String g_player2, int t_ticket, int t_price, String g_img, String g_weight, String isfinish) {
		super();
		this.idx = idx;
		this.g_name = g_name;
		this.g_time = g_time;
		this.g_date = g_date;
		this.g_place = g_place;
		this.g_player1 = g_player1;
		this.g_player2 = g_player2;
		this.t_ticket = t_ticket;
		this.t_price = t_price;
		this.g_img = g_img;
		this.g_weight = g_weight;
		this.isfinish = isfinish;
	}
	public String getIsfinish() {
		return isfinish;
	}
	public void setIsfinish(String isfinish) {
		this.isfinish = isfinish;
	}
	public String getG_weight() {
		return g_weight;
	}
	public void setG_weight(String g_weight) {
		this.g_weight = g_weight;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getG_player1() {
		return g_player1;
	}
	public void setG_player1(String g_player1) {
		this.g_player1 = g_player1;
	}
	public String getG_player2() {
		return g_player2;
	}
	public void setG_player2(String g_player2) {
		this.g_player2 = g_player2;
	}
	public int getT_ticket() {
		return t_ticket;
	}
	public void setT_ticket(int t_ticket) {
		this.t_ticket = t_ticket;
	}
	public String getG_img() {
		return g_img;
	}
	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_time() {
		return g_time;
	}
	public void setG_time(String g_time) {
		this.g_time = g_time;
	}
	public String getG_date() {
		return g_date;
	}
	public void setG_date(String g_date) {
		this.g_date = g_date;
	}
	public String getG_place() {
		return g_place;
	}
	public void setG_place(String g_place) {
		this.g_place = g_place;
	}
	
	public int getT_price() {
		return t_price;
	}
	public void setT_price(int t_price) {
		this.t_price = t_price;
	}
	
}
