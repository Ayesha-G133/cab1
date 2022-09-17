
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Driver;



public class DriverDAO {
	private  Connection conn;

	public DriverDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean registerDriver(Driver d)
	{
		boolean f=false;
		
		try {
			String sql="insert into driver(driver_Name,driver_NIC,driver_Address,driver_mobile,driver_Email,driver_DOB,driver_pw,driver_Status) values (?,?,?,?,?,?,?,?)";
			
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, d.getDriverName());
		ps.setString(2, d.getNIC());
		ps.setString(3, d.getAddress());
		ps.setString(4,d.getMobileNum() );
		ps.setString(5,d.getEmail() );
		ps.setString(6,d.getDOB() );
		ps.setString(7,d.getPassword() );
		ps.setString(8,d.getStatus());
		
		
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
			return f;
	}
	
	
public List<Driver> getAllDriver(){
	
	List<Driver> list=new ArrayList<Driver>();
	Driver d=null;
	try {
		
		String sql="select * from driver order by driver_id desc";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			
		{
			d=new Driver();
			d.setDriverId(rs.getInt(1));
			d.setDriverName(rs.getString(2));
			d.setNIC(rs.getString(3));
			d.setAddress(rs.getString(4));
			d.setMobileNum(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setDOB(rs.getString(7));
			d.setPassword(rs.getString(8));
			d.setStatus(rs.getString(9));
			list.add(d);
		}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return list;
}

public Driver getDriverBYId(int id) {

 Driver d=null;
	
	
	try {
		
		String sql="select * from driver where driver_id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			
		{
			d=new Driver();
			d.setDriverId(rs.getInt(1));
			d.setDriverName(rs.getString(2));
			d.setNIC(rs.getString(3));
			d.setAddress(rs.getString(4));
			d.setMobileNum(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setDOB(rs.getString(7));
			d.setPassword(rs.getString(8));
			d.setStatus(rs.getString(9));
			
		}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return d;
}
public boolean UpdateDriver(Driver d)
{
	boolean f=false;
	
	try {
		String sql="update driver set driver_Name=?,driver_NIC=?,driver_Address=?,driver_mobile=?,driver_Email=?,driver_DOB=?,driver_pw=?,driver_Status=? where driver_id=?";
		
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, d.getDriverName());
	ps.setString(2, d.getNIC());
	ps.setString(3, d.getAddress());
	ps.setString(4,d.getMobileNum() );
	ps.setString(5,d.getEmail() );
	ps.setString(6,d.getDOB() );
	
	ps.setString(7,d.getPassword());
	ps.setString(8,d.getStatus() );
	ps.setInt(9, d.getDriverId());
	
	
	int i=ps.executeUpdate();
	
	if(i==1) {
		f=true;

	}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return f;
}
public boolean DeleteDriver(int id)

{
boolean f=false;
try {
	String sql="delete from driver where driver_id=?";
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

public Driver login (String email,String pw) {
	Driver d=null;
	try {
		String sql="select * from driver where driver_Email=? and driver_pw=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2, pw);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			d=new Driver();
			d.setDriverId(rs.getInt(1));
			d.setDriverName(rs.getString(2));
			d.setNIC(rs.getString(3));
			d.setAddress(rs.getString(4));
			d.setMobileNum(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setDOB(rs.getString(7));
			
			d.setPassword(rs.getString(8));
			d.setStatus(rs.getString(9));
		}
	}catch (Exception ex) {
	ex.printStackTrace();
}
return d;

}
public int countDriver()
{
int i=0;

try {
	String sql="select * from driver";
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
public int countBookingBYDriverId(int Driverid)
{
int i=0;

try {
	String sql="select * from booking where DriverId=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, Driverid);
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
public boolean checkOldPassword(int userid,String oldPassword)
{
boolean f=false;
try {
	String sql="select * from driver where driver_id=? and driver_pw=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, userid);
	ps.setString(2, oldPassword);
	
	ResultSet rs=ps.executeQuery();
	while(rs.next()) {
		f=true;
	}
	
}catch (Exception ex) {
	ex.printStackTrace();
}

return f;
}

public boolean changePassword(int userid,String newPassword)
{
boolean f=false;
try {
	String sql="update driver set driver_pw=? where driver_id=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	
	ps.setString(1, newPassword);
	ps.setInt(2, userid);
	
	int i=ps.executeUpdate();
	if(i==1)
	{
		f=true;
	}
	
	
}catch (Exception ex) {
	ex.printStackTrace();
}

return f;

}
public boolean EditeDriverProfile(Driver d)
{
	boolean f=false;
	
	try {
		String sql="update driver set driver_Name=?,driver_NIC=?,driver_Address=?,driver_mobile=?,driver_Email=?,driver_DOB=?,driver_Status=? where driver_id=?";
		
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, d.getDriverName());
	ps.setString(2, d.getNIC());
	ps.setString(3, d.getAddress());
	ps.setString(4,d.getMobileNum() );
	ps.setString(5,d.getEmail() );
	ps.setString(6,d.getDOB() );
	ps.setString(7,d.getStatus() );
	ps.setInt(8, d.getDriverId());
	
	
	int i=ps.executeUpdate();
	
	if(i==1) {
		f=true;

	}
}catch (Exception ex) {
	ex.printStackTrace();
	}


return f;
}
public boolean updateStatus(int id,String status)
{
boolean f=false;
try {
	String sql="update driver set driver_Status=? where driver_id=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	
	ps.setString(1, status);
	ps.setInt(2, id);
	
	int i=ps.executeUpdate();
	if(i==1)
	{
		f=true;
	}
	
	
}catch (Exception ex) {
	ex.printStackTrace();
}

return f;

}
}