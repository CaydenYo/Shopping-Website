package com.oracle.ebp.domain;

public class Admin {
	int aid;
	String userName;
	String password;
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Admin(int aid, String userName, String password) {
		super();
		this.aid = aid;
		this.userName = userName;
		this.password = password;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAid() {
		return aid;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", userName=" + userName + ", password=" + password + "]";
	}
	
	
}
