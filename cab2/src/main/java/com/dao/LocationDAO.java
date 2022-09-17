package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Location;





public class LocationDAO {

	private Connection conn;
	
	public LocationDAO(Connection conn) {
		super();
		this.conn = conn;
	}
		public boolean addlocation(String location)
		{
			boolean f=false;
			try {
				String sql ="insert into location(lacationName) values(?) ";
				PreparedStatement ps=conn.prepareStatement(sql)	;
				ps.setString(1, location);
				
				int i = ps.executeUpdate();
				if(i==1) {
					f=true;
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
			return f;
		}
		public List<Location> getAllLocation()
		{
List<Location> list=new ArrayList<Location>();
Location l= null;
	try	{
	String sql = "select * from location";
	PreparedStatement ps=conn.prepareStatement(sql)	;

	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		l=new Location();
		l.setId(rs.getInt(1));
		l.setLocation(rs.getString(2));
		list.add(l);
	}
	
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	return list;
		}

public int countLocation()
{
int i=0;

try {
	String sql="select * from location";
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

