package com.entity;

public class User {
	private int id;
	private String fullName;
	private  String mobile;
	private String email;
	private String password;

	
	
		
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String fullName,String mobile, String email, String password) {
		super();
		this.fullName = fullName;
		this.mobile=mobile;
		this.email = email;
		this.password = password;
		
	}
	public int getId() {
		return id;

	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getmobile() {
		return mobile;
	}
	public void setmobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	


}


