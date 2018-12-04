package com.oracle.ebp.domain;

import java.sql.Date;

public class QueryShoppingCartBean {

	private Integer uid;
	private Integer scid;
	private Date addTime;
	private Integer tid;
	private String descs;
	private Double price; 
	private Integer quantity;
	
	public QueryShoppingCartBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QueryShoppingCartBean(Integer uid, Integer scid, Date addTime, Integer tid, String descs, Double price,
			Integer quantity) {
		super();
		this.uid = uid;
		this.scid = scid;
		this.addTime = addTime;
		this.tid = tid;
		this.descs = descs;
		this.price = price;
		this.quantity = quantity;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public void setScid(Integer scid) {
		this.scid = scid;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
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

	public Integer getUid() {
		return uid;
	}

	public Integer getScid() {
		return scid;
	}

	public Date getAddTime() {
		return addTime;
	}

	public Integer getTid() {
		return tid;
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
		return "QueryShoppingCartBean [uid=" + uid + ", scid=" + scid + ", addTime=" + addTime + ", tid=" + tid
				+ ", descs=" + descs + ", price=" + price + ", quantity=" + quantity + "]";
	}

	
}
