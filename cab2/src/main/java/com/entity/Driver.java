package com.entity;

public class Driver {

	private int DriverId;
	private String DriverName;
	private String NIC;
	private String Address; 
	private String MobileNum;
	private String Email;
	private String DOB;
	private String password;
	private String Status;
	
	public Driver() {
		super();
		// TODO Auto-generated constructor stub
	
	
	}
		

	public Driver(int driverid, String driverName, String nIC, String address, String mobileNum, String email, String dOB,
			 String password,String status) {
		super();
		this.DriverId = driverid;
		this.DriverName = driverName;
		this.NIC = nIC;
		this.Address = address;
		this.MobileNum = mobileNum;
		this.Email = email;
		this.DOB = dOB;
		
		this.password = password;
		this.Status = status;
	}


	public Driver(String driverName, String nIC, String address, String mobileNum, String email, String dOB,
			 String password,String status) {
		super();
		
		this.DriverName = driverName;
		this.NIC = nIC;
		this.Address = address;
		this.MobileNum = mobileNum;
		this.Email = email;
		this.DOB = dOB;		
		this.password = password;
		this.Status = status;
	}

	public Driver(String status) {
		super();
		
				this.Status = status;
	}

	


	public int getDriverId() {
		return DriverId;
	}

	public void setDriverId(int Driverid) {
		this.DriverId = Driverid;
	}


	public String getDriverName() {
		return DriverName;
	}

	public void setDriverName(String driverName) {
		this.DriverName = driverName;
	}


	public String getNIC() {
		return NIC;
	}


	public void setNIC(String nIC) {
		this.NIC = nIC;
	}

	public String getAddress() {
		return Address;
	}


	public void setAddress(String address) {
		this.Address = address;
	}

	public String getMobileNum() {
		return MobileNum;
	}


	public void setMobileNum(String mobileNum) {
		this.MobileNum = mobileNum;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		this.Email = email;
	}


	public String getDOB() {
		return DOB;
	}

	public void setDOB(String dOB) {
		this.DOB = dOB;
	}

	

	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		this.Status = status;
	}
	}
	
	
