package com.oracle.ebp.domain;

public class UpdateTicketBean {
	private Integer tid;
	private String descs;
	private Integer amount;
	private Integer balance;
	private Double price;
	
	public UpdateTicketBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UpdateTicketBean(Integer tid, String descs, Integer amount, Integer balance, Double price) {
		super();
		this.tid = tid;
		this.descs = descs;
		this.amount = amount;
		this.balance = balance;
		this.price = price;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getTid() {
		return tid;
	}

	public String getDescs() {
		return descs;
	}

	public Integer getAmount() {
		return amount;
	}

	public Integer getBalance() {
		return balance;
	}

	public Double getPrice() {
		return price;
	}

	@Override
	public String toString() {
		return "UpdateTicketBean [tid=" + tid + ", descs=" + descs + ", amount=" + amount + ", balance=" + balance
				+ ", price=" + price + "]";
	}
	
	
}
