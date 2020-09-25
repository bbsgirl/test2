package com.min.UFC.dto;

public class TicketBean {
	private int idx;
	private String t_user;
	private int t_name;
	private String t_pd;
	private int p_num;
	
	
	
	public TicketBean() {}
	
	public TicketBean(int idx, String t_user, int t_name, String t_pd, int p_num) {
		super();
		this.idx = idx;
		this.t_user = t_user;
		this.t_name = t_name;
		this.t_pd = t_pd;
		this.p_num = p_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getT_pd() {
		return t_pd;
	}
	public void setT_pd(String t_pd) {
		this.t_pd = t_pd;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getT_user() {
		return t_user;
	}
	public void setT_user(String t_user) {
		this.t_user = t_user;
	}
	public int getT_name() {
		return t_name;
	}
	public void setT_name(int t_name) {
		this.t_name = t_name;
	}
}
