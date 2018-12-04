package com.oracle.ebp.domain;

public class AddOrderBean {

	private Integer oid;
	private Double amount;
	private Integer uid;
	private String descs;
	private Double price;
	private Integer quantity;
	
	public AddOrderBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddOrderBean(Integer oid, Double amount, Integer uid, String descs, Double price, Integer quantity) {
		super();
		this.oid = oid;
		this.amount = amount;
		this.uid = uid;
		this.descs = descs;
		this.price = price;
		this.quantity = quantity;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getOid() {
		return oid;
	}

	public Double getAmount() {
		return amount;
	}

	public Integer getUid() {
		return uid;
	}

	public String getDescs() {
		return descs;
	}

	public Double getPrice() {
		return price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	@Override
	public String toString() {
		return "AddOrderBean [oid=" + oid + ", amount=" + amount + ", uid=" + uid + ", descs=" + descs + ", price="
				+ price + ", quantity=" + quantity + "]";
	}

	

}
