package com.oracle.ebp.domain;

import java.sql.Date;

public class Order {
private int oid;
private Date commitTime;
private double amount;
private int uid;
private User user;
private OrderList orderList;

public Order() {
	super();
	// TODO Auto-generated constructor stub
}

public Order(int oid, Date commitTime, double amount, int uid, User user, OrderList orderList) {
	super();
	this.oid = oid;
	this.commitTime = commitTime;
	this.amount = amount;
	this.uid = uid;
	this.user = user;
	this.orderList = orderList;
}

public void setOid(int oid) {
	this.oid = oid;
}

public void setCommitTime(Date commitTime) {
	this.commitTime = commitTime;
}

public void setAmount(double amount) {
	this.amount = amount;
}

public void setUid(int uid) {
	this.uid = uid;
}

public void setUser(User user) {
	this.user = user;
}

public void setOrderList(OrderList orderList) {
	this.orderList = orderList;
}

public int getOid() {
	return oid;
}

public Date getCommitTime() {
	return commitTime;
}

public double getAmount() {
	return amount;
}

public int getUid() {
	return uid;
}

public User getUser() {
	return user;
}

public OrderList getOrderList() {
	return orderList;
}

@Override
public String toString() {
	return "Order [oid=" + oid + ", commitTime=" + commitTime + ", amount=" + amount + ", uid=" + uid + ", user=" + user
			+ ", orderList=" + orderList + "]";
}




}
