package com.oracle.ebp.domain;

public class TicketDetail {
	private Integer tdid;
	private Integer tid;
	private String descs;
	private String images;
	
	public TicketDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TicketDetail(Integer tdid, Integer tid, String descs, String images) {
		super();
		this.tdid = tdid;
		this.tid = tid;
		this.descs = descs;
		this.images = images;
	}

	public void setTdid(Integer tdid) {
		this.tdid = tdid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public Integer getTdid() {
		return tdid;
	}

	public Integer getTid() {
		return tid;
	}

	public String getDescs() {
		return descs;
	}

	public String getImages() {
		return images;
	}

	@Override
	public String toString() {
		return "TicketDetail [tdid=" + tdid + ", tid=" + tid + ", descs=" + descs + ", images=" + images + "]";
	}
	
	
}
