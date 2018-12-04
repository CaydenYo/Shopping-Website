package com.oracle.ebp.domain;


public class UpdateUserBean {
	private String name;
	private Integer age;
	private Integer gender;
	private String password;
	private String conPassword;
	private String address;
	private String telno;
	
	public UpdateUserBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UpdateUserBean(String name, Integer age, Integer gender, String password, String conPassword, String address,
			String telno) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.password = password;
		this.conPassword = conPassword;
		this.address = address;
		this.telno = telno;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setConPassword(String conPassword) {
		this.conPassword = conPassword;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getName() {
		return name;
	}

	public Integer getAge() {
		return age;
	}

	public Integer getGender() {
		return gender;
	}

	public String getPassword() {
		return password;
	}

	public String getConPassword() {
		return conPassword;
	}

	public String getAddress() {
		return address;
	}

	public String getTelno() {
		return telno;
	}

	@Override
	public String toString() {
		return "UpdateUserBean [name=" + name + ", age=" + age + ", gender=" + gender + ", password=" + password
				+ ", conPassword=" + conPassword + ", address=" + address + ", telno=" + telno + "]";
	}
	
	
	
	
}
