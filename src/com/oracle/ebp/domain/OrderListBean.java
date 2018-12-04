package com.oracle.ebp.domain;

import java.sql.Date;

public class OrderListBean {
	private Integer oid;
	private String descs;
	private Date commitTime;
	private Double price;
	private String name;
	private String username;
	private String idCard;
	
	public OrderListBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderListBean(Integer oid, String descs, Date commitTime, Double price, String name, String username,
			String idCard) {
		super();
		this.oid = oid;
		this.descs = descs;
		this.commitTime = commitTime;
		this.price = price;
		this.name = name;
		this.username = username;
		this.idCard = idCard;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public void setCommitTime(Date commitTime) {
		this.commitTime = commitTime;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Integer getOid() {
		return oid;
	}

	public String getDescs() {
		return descs;
	}

	public Date getCommitTime() {
		return commitTime;
	}

	public Double getPrice() {
		return price;
	}

	public String getName() {
		return name;
	}

	public String getUsername() {
		return username;
	}

	public String getIdCard() {
		return idCard;
	}

	@Override
	public String toString() {
		return "OrderListBean [oid=" + oid + ", descs=" + descs + ", commitTime=" + commitTime + ", price=" + price
				+ ", name=" + name + ", username=" + username + ", idCard=" + idCard + "]";
	}
	
	
}
