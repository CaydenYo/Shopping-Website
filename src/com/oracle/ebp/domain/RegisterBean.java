package com.oracle.ebp.domain;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class RegisterBean {
	@NotBlank(message="用户名不能为空")
	private String username;
	@NotBlank(message="密码不能为空")
	private String password;
	@NotBlank(message="请确认密码")
	private String conPassword;
	@NotBlank(message="请输入姓名")
	private String name;
	@NotEmpty(message="请输入性别")
	private String gender;
	@NotNull(message="请输入年龄")
	@Range(min = 1, max = 99, message = "年龄超出范围")
	private Integer age;
	@NotEmpty(message="请输入身份证")
	private String idCard;
	@NotEmpty(message="请输入地址")
	private String address;
	@NotEmpty(message="请输入手机号码")
	private String telno;
	public RegisterBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RegisterBean(String username, String password, String conPassword, String name, String gender, Integer age,
			String idCard, String address, String telno) {
		super();
		this.username = username;
		this.password = password;
		this.conPassword = conPassword;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.idCard = idCard;
		this.address = address;
		this.telno = telno;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setConPassword(String conPassword) {
		this.conPassword = conPassword;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setAge(Integer age) {
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
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getConPassword() {
		return conPassword;
	}
	public String getName() {
		return name;
	}
	public String getGender() {
		return gender;
	}
	public Integer getAge() {
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
	@Override
	public String toString() {
		return "RegisterBean [username=" + username + ", password=" + password + ", conPassword=" + conPassword
				+ ", name=" + name + ", gender=" + gender + ", age=" + age + ", idCard=" + idCard + ", address="
				+ address + ", telno=" + telno + "]";
	}
	
	
}
