package com.entity;

public class Vehicle {
	private int Vehiid;
	private String VehiNumber;
	private String Brand;
	private int CatId;
	private String Status;
	public Vehicle() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vehicle(String vehiNumber, String brand, int catId,String status ) {
		super();
		
		VehiNumber = vehiNumber;
		Brand = brand;
		CatId = catId;
		Status=status;
	}
	public Vehicle(int vehiid, String vehiNumber, String brand, int catId,String status ) {
		super();
		Vehiid = vehiid;
		VehiNumber = vehiNumber;
		Brand = brand;
		CatId = catId;
		Status=status;
	}
	public int getVehiid() {
		return Vehiid;
	}
	public void setVehiid(int vehiid) {
		Vehiid = vehiid;
	}
	public String getVehiNumber() {
		return VehiNumber;
	}
	public void setVehiNumber(String vehiNumber) {
		VehiNumber = vehiNumber;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public int getCatId() {
		return CatId;
	}
	public void setCatId(int catId) {
		CatId = catId;
	} 
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	
}
}
