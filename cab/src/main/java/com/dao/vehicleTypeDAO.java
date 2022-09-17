package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.vehicleType;

public class vehicleTypeDAO {

	private Connection conn;

	public vehicleTypeDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addvehicle(String vehitype)
	{
		boolean f=false;
		try {
			String sql ="insert into vehicale(vehicale_type) values(?) ";
			PreparedStatement ps=conn.prepareStatement(sql)	;
			ps.setString(1, vehitype);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return f;
	}
	
	public List<vehicleType> getAllvehicleType()
			{
	List<vehicleType> list=new ArrayList<vehicleType>();
	vehicleType v= null;
		try	{
		String sql = "select * from vehicale";
		PreparedStatement ps=conn.prepareStatement(sql)	;

		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			v=new vehicleType();
			v.setId(rs.getInt(1));
			v.setVehiType(rs.getString(2));
			list.add(v);
		}
		
			}catch (Exception ex) {
				ex.printStackTrace();
			}
		return list;
			}
	
	
	public List<vehicleType> getAllvehicleId()
	{
List<vehicleType> list=new ArrayList<vehicleType>();
vehicleType v= null;
try	{
String sql = "select * from vehicale where vehicale_type=?";
PreparedStatement ps=conn.prepareStatement(sql)	;


ResultSet rs = ps.executeQuery();

while(rs.next()) {
	v=new vehicleType();
	v.setId(rs.getInt(1));
	v.setVehiType(rs.getString(2));
	list.add(v);
}

	}catch (Exception ex) {
		ex.printStackTrace();
	}
return list;
	}
	public int countVehicleType()
	{
	int i=0;

	try {
		String sql="select * from vehicale";
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
}
