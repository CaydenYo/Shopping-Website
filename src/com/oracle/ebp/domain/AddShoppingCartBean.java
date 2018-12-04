package com.oracle.ebp.domain;


public class AddShoppingCartBean {

	private Integer scid;
	private Integer tid;
	private Integer quantity;
	private Integer uid;
	
	public AddShoppingCartBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddShoppingCartBean(Integer scid, Integer tid, Integer quantity, Integer uid) {
		super();
		this.scid = scid;
		this.tid = tid;
		this.quantity = quantity;
		this.uid = uid;
	}

	public void setScid(Integer scid) {
		this.scid = scid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getScid() {
		return scid;
	}

	public Integer getTid() {
		return tid;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public Integer getUid() {
		return uid;
	}

	@Override
	public String toString() {
		return "AddShoppingCartBean [scid=" + scid + ", tid=" + tid + ", quantity=" + quantity + ", uid=" + uid + "]";
	}

	
}
