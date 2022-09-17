package com.entity;

public class VehicleDriver {
	private int bookID;
	
	private int vehiID;
	private int driverID;
	public VehicleDriver() {
		super();
		// TODO Auto-generated constructor stub
	}
		public VehicleDriver( int bookID, int vehiID, int driverID) {
			super();
		this.bookID = bookID;
		this.vehiID = vehiID;

		this.driverID = driverID;
		
	}
	
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	
	
	
	public int getVehiID() {
		return vehiID;
	}
	public void setVehiID(int vehiID) {
		this.vehiID = vehiID;
	}
	public int getDriverID() {
		return driverID;
	}
	public void setDriverID(int driverID) {
		this.driverID = driverID;
	}
}

