package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Vehicle;


public class VehicleDAO {
	private  Connection conn;

	public VehicleDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean registerVehicle(Vehicle v)
	{
		boolean f=false;
		
		try {
			String sql="insert into vehicle(VehicleNumber,Brand,catogaryId,vehiStats) values (?,?,?,?)";
			
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, v.getVehiNumber());
		ps.setString(2, v.getBrand());
		ps.setString(3,v.getStatus());
		ps.setInt(4, v.getCatId());
		
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
			return f;
	}
	
	
public List<Vehicle> getAllVehicle(){
	
	List<Vehicle> list=new ArrayList<Vehicle>();
	Vehicle v=null;
	try {
		
		String sql="select * from vehicle order by VehicleId desc";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			
		{
			v=new Vehicle();
			v.setVehiid(rs.getInt(1));
			v.setVehiNumber(rs.getString(2));
			v.setBrand(rs.getString(3));
			v.setCatId(rs.getInt(4));
			v.setStatus(rs.getString(5));
			list.add(v);
		}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return list;
}

public Vehicle getVehicleBYId(int id) {

	Vehicle v=null;
	
	
	try {
		
		String sql="select * from vehicle where VehicleId=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			
		{
			v=new Vehicle();
			v.setVehiid(rs.getInt(1));
			v.setVehiNumber(rs.getString(2));
			v.setBrand(rs.getString(3));
			v.setCatId(rs.getInt(4));
			v.setStatus(rs.getString(5));
			
			
		}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return v;
}
public boolean UpdateVehicle(Vehicle v)
{
	boolean f=false;
	
	try {
		String sql="update vehicle set VehicleNumber=?,Brand=?,catogaryId=?,vehiStats=? where VehicleId=?";
		
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, v.getVehiNumber());
	ps.setString(2, v.getBrand());
	ps.setInt(3, v.getCatId());
	ps.setString(4,v.getStatus());
	ps.setInt(5, v.getVehiid());
	
	int i=ps.executeUpdate();
	
	if(i==1) {
		f=true;

	}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return f;
}
public boolean DeleteVehicle(int id)

{
boolean f=false;
try {
	String sql="delete from vehicle where VehicleId=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, id);
	int i=ps.executeUpdate();
	if(i==1)
	{
		f=true;
	}
}catch(Exception ex) {
	ex.printStackTrace();
}
return f;
}


public int countVehicle()
{
int i=0;

try {
	String sql="select * from vehicle";
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		i++;
	}
	



}catch (Exception ex) {
	ex.printStackTrace();
}
return i;
}
public int countBookingBYvehicleId(int Vehicleid)
{
int i=0;

try {
	String sql="select * from vehicle where VehicleId=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, Vehicleid);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		i++;
	}
	



}catch (Exception ex) {
	ex.printStackTrace();
}
return i;
}




}
