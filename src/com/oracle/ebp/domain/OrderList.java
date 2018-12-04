package com.oracle.ebp.domain;

public class OrderList {
private int lid;
private String descs;
private double price;
private int quantity;
private double amount;
private int oid;


public OrderList() {
	super();
	// TODO Auto-generated constructor stub
}


public OrderList(int lid, String descs, double price, int quantity, double amount, int oid) {
	super();
	this.lid = lid;
	this.descs = descs;
	this.price = price;
	this.quantity = quantity;
	this.amount = amount;
	this.oid = oid;
}


public void setLid(int lid) {
	this.lid = lid;
}


public void setDescs(String descs) {
	this.descs = descs;
}


public void setPrice(double price) {
	this.price = price;
}


public void setQuantity(int quantity) {
	this.quantity = quantity;
}


public void setAmount(double amount) {
	this.amount = amount;
}


public void setOid(int oid) {
	this.oid = oid;
}


public int getLid() {
	return lid;
}


public String getDescs() {
	return descs;
}


public double getPrice() {
	return price;
}


public int getQuantity() {
	return quantity;
}


public double getAmount() {
	return amount;
}


public int getOid() {
	return oid;
}


@Override
public String toString() {
	return " 描述：" + descs + " 单价(元)" + price + "  数量：" + quantity + "  总金额："
			+ amount + "  订单号：" + oid;
}

}
