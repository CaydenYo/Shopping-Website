package com.oracle.ebp.domain;

import java.sql.Date;


public class Ticket {
private int tid;
private String descs;
private Date startTime;
private int amount;
private int balance;
private double price;
private int status;
public int getTid() {
	return tid;
}
public void setTid(int tid) {
	this.tid = tid;
}
public String getDescs() {
	return descs;
}
public void setDescs(String descs) {
	this.descs = descs;
}
public Date getStartTime() {
	return startTime;
}
public void setStartTime(Date startTime) {
	this.startTime = startTime;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public int getBalance() {
	return balance;
}
public void setBalance(int balance) {
	this.balance = balance;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public Ticket(int tid, String descs, Date startTime, int amount, int balance, double price, int status) {
	super();
	this.tid = tid;
	this.descs = descs;
	this.startTime = startTime;
	this.amount = amount;
	this.balance = balance;
	this.price = price;
	this.status = status;
}
public Ticket() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "Ticket [tid=" + tid + ", descs=" + descs + ", startTime=" + startTime + ", amount=" + amount + ", balance="
			+ balance + ", price=" + price + ", status=" + status + "]";
}

}
