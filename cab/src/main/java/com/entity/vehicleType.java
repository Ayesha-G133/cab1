package com.entity;

public class vehicleType {

	private int id;
	private String VehiType;
	
	
	
	public vehicleType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public vehicleType(int id, String vehiType) {
		super();
		this.id = id;
		VehiType = vehiType;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVehiType() {
		return VehiType;
	}
	public void setVehiType(String vehiType) {
		VehiType = vehiType;
	}
	
	
}
