package com.oracle.ebp.domain;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class ReChargeBean {
	@NotEmpty(message = "��ѡ��һ�ֳ�ֵ��ʽ")
	private String way;
	@NotNull(message = "��ֵ����Ϊ��")
	@Range(min = 0, message = "��ֵ��С��0")
	private Double money;
	public ReChargeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReChargeBean(String way, double money) {
		super();
		this.way = way;
		this.money = money;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getWay() {
		return way;
	}
	public Double getMoney() {
		return money;
	}
	@Override
	public String toString() {
		return "ReChargeBean [way=" + way + ", money=" + money + "]";
	}
	
	
}
