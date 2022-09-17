package com.entity;

public class Booking {
	private int id;
	private int uID;
	private String PickLocation;
	private String DropLocation;
	private String PickDate;
	private String PickTime;
	private int VehiTypeID;
	private int NumPassanger;
	
	private String status;
	public Booking(int bookid ,int UID,String pickLocation, String dropLocation, String pickDate, String pickTime,
			int vehiTypeid, int numPassanger, String status) {
		super();
		id = bookid;
		uID = UID;
		PickLocation = pickLocation;
		DropLocation = dropLocation;
		PickDate = pickDate;
		PickTime = pickTime;
		VehiTypeID = vehiTypeid;
		NumPassanger = numPassanger;
		
		this.status = status;
	}
	
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Booking(int ID, String status) {
		super();
		id = ID;
		this.status = status;
	

	}
	public Booking(int UID,String pickLocation, String dropLocation, String pickDate, String pickTime,
			int vehiTypeid, int numPassanger, String status) {
		super();
		uID = UID;
		PickLocation = pickLocation;
		DropLocation = dropLocation;
		PickDate = pickDate;
		PickTime = pickTime;
		VehiTypeID = vehiTypeid;
		NumPassanger = numPassanger;
		
		this.status = status;
	

	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	public int getuID() {
		return uID;
	}


	public void setuID(int uID) {
		this.uID = uID;
	}


	public String getPickLocation() {
		return PickLocation;
	}


	public void setPickLocation(String pickLocation) {
		PickLocation = pickLocation;
	}


	public String getDropLocation() {
		return DropLocation;
	}


	public void setDropLocation(String dropLocation) {
		DropLocation = dropLocation;
	}


	public String getPickDate() {
		return PickDate;
	}


	public void setPickDate(String pickDate) {
		PickDate = pickDate;
	}


	public String getPickTime() {
		return PickTime;
	}


	public void setPickTime(String pickTime) {
		PickTime = pickTime;
	}
	public int getVehiType() {
		return VehiTypeID;
	}


	public void setVehiType(int vehiType) {
		VehiTypeID = vehiType;
	}

	public int getNumPassanger() {
		return NumPassanger;
	}


	public void setNumPassanger(int numPassanger) {
		NumPassanger = numPassanger;
	}


	


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	
	
	}
	
	


