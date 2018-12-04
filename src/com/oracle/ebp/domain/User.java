package com.oracle.ebp.domain;

import java.sql.Date;

public class User {
private int uid;
private String username;
private String password;
private String name;
private int gender;
private int age;
private String idCard;
private String address;
private String telno;
private Date regTime;
private double balance;
private int status;
public User() {
	super();
	// TODO Auto-generated constructor stub
}
public User(int uid, String username, String password, String name, int gender, int age, String idCard, String address,
		String telno, Date regTime, double balance, int status) {
	super();
	this.uid = uid;
	this.username = username;
	this.password = password;
	this.name = name;
	this.gender = gender;
	this.age = age;
	this.idCard = idCard;
	this.address = address;
	this.telno = telno;
	this.regTime = regTime;
	this.balance = balance;
	this.status = status;
}
public void setUid(int uid) {
	this.uid = uid;
}
public void setUsername(String username) {
	this.username = username;
}
public void setPassword(String password) {
	this.password = password;
}
public void setName(String name) {
	this.name = name;
}
public void setGender(int gender) {
	this.gender = gender;
}
public void setAge(int age) {
	this.age = age;
}
public void setIdCard(String idCard) {
	this.idCard = idCard;
}
public void setAddress(String address) {
	this.address = address;
}
public void setTelno(String telno) {
	this.telno = telno;
}
public void setRegTime(Date regTime) {
	this.regTime = regTime;
}
public void setBalance(double balance) {
	this.balance = balance;
}
public void setStatus(int status) {
	this.status = status;
}
public int getUid() {
	return uid;
}
public String getUsername() {
	return username;
}
public String getPassword() {
	return password;
}
public String getName() {
	return name;
}
public int getGender() {
	return gender;
}
public int getAge() {
	return age;
}
public String getIdCard() {
	return idCard;
}
public String getAddress() {
	return address;
}
public String getTelno() {
	return telno;
}
public Date getRegTime() {
	return regTime;
}
public double getBalance() {
	return balance;
}
public int getStatus() {
	return status;
}
@Override
public String toString() {
	return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", name=" + name + ", gender="
			+ gender + ", age=" + age + ", idCard=" + idCard + ", address=" + address + ", telno=" + telno
			+ ", regTime=" + regTime + ", balance=" + balance + ", status=" + status + "]";
}

}
