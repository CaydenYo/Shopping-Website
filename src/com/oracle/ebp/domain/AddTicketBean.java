package com.oracle.ebp.domain;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class AddTicketBean {
	@NotBlank(message = "描述不能为空")
	private String descs;
	@NotNull(message = "开始时间不能为空")
	private Date startTime;
	@NotNull(message = "总票数不能为空")
	private Integer amount;
	@NotNull(message = "剩余票数不能为空")
	private Integer balance;
	@NotNull(message = "单价不能为空")
	private Double price;
	private Integer status;
	
	public AddTicketBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddTicketBean(String descs, Date startTime, Integer amount, Integer balance, Double price, Integer status) {
		super();
		this.descs = descs;
		this.startTime = startTime;
		this.amount = amount;
		this.balance = balance;
		this.price = price;
		this.status = status;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
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

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDescs() {
		return descs;
	}

	public Date getStartTime() {
		return startTime;
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

	public Integer getStatus() {
		return status;
	}

	@Override
	public String toString() {
		return "AddTicketBean [descs=" + descs + ", startTime=" + startTime + ", amount=" + amount + ", balance="
				+ balance + ", price=" + price + ", status=" + status + "]";
	}
	
	
}
