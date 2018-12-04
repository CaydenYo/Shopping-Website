package com.oracle.ebp.domain;

import java.sql.Date;

public class ShoppingCart {
 private int scid;
 private Date addTime;
 private int userId;
public ShoppingCart() {
	super();
	// TODO Auto-generated constructor stub
}
public ShoppingCart(int scid, Date addTime, int userId) {
	super();
	this.scid = scid;
	this.addTime = addTime;
	this.userId = userId;
}
public void setScid(int scid) {
	this.scid = scid;
}
public void setAddTime(Date addTime) {
	this.addTime = addTime;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public int getScid() {
	return scid;
}
public Date getAddTime() {
	return addTime;
}
public int getUserId() {
	return userId;
}
@Override
public String toString() {
	return "ShoppingCart [scid=" + scid + ", addTime=" + addTime + ", userId=" + userId + "]";
}
 
 
}