package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Booking;

public class BookingDAO {
	
	private Connection Conn;

	public BookingDAO(Connection conn) {
		super();
		this.Conn = conn;
	}
	
	public boolean addbookig(Booking book)
	{
		boolean f=false;
		try {
			String sql ="insert into newbooking(uid,pickLocation,dropLaction,date,time,vehiTypeID,numPassanger,status) values(?,?,?,?,?,?,?,?) ";
			PreparedStatement ps=Conn.prepareStatement(sql)	;
			ps.setInt(1,book.getuID());
			ps.setString(2, book.getPickLocation());
			ps.setString(3,book.getDropLocation());
			ps.setString(4,book.getPickDate());
			ps.setString(5,book.getPickTime());
			ps.setInt(6, book.getVehiType());
			ps.setInt(7,book.getNumPassanger());
			ps.setString(8,book.getStatus());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return f;
}
	public List<Booking> getAllBookingBYLoginUser(int uID)
	{
		List<Booking> list=new ArrayList<Booking>();
		Booking book=null;
		
		try {
			String sql="select * from newbooking where uid=?";
			PreparedStatement ps=Conn.prepareStatement(sql)	;
			ps.setInt(1, uID);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				book=new Booking();
				book.setId(rs.getInt(1));
				book.setPickLocation(rs.getString(3));
				book.setDropLocation(rs.getString(4));
				book.setPickDate(rs.getString(5));
				book.setPickTime(rs.getString(6));
				book.setVehiType(rs.getInt(7));
				book.setNumPassanger(rs.getInt(8));
				book.setStatus(rs.getString(9));
				list.add(book);
			}
			
		}catch (Exception ex) {
		ex.printStackTrace();
		}
		return list;
	}

	public List<Booking> getAllBookingBYDriverLogin(int DriverID )
	{
		List<Booking> list=new ArrayList<Booking>();
		Booking book=null;
		
		try {
			String sql="select * from newbooking where driverID=?";
			PreparedStatement ps=Conn.prepareStatement(sql)	;
			ps.setInt(1, DriverID);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				book=new Booking();
				book.setId(rs.getInt(1));
				book.setPickLocation(rs.getString(3));
				book.setDropLocation(rs.getString(4));
				book.setPickDate(rs.getString(5));
				book.setPickTime(rs.getString(6));
				book.setNumPassanger(rs.getInt(7));
				
				book.setStatus(rs.getString(11));
				list.add(book);
			}
			
		}catch (Exception ex) {
		ex.printStackTrace();
		}
		return list;
		
	}
	
	public Booking getBookingBYId(int id )
	{
		
		Booking book=null;
		
		try {
			String sql="select * from newbooking where bookingId=?";
			PreparedStatement ps=Conn.prepareStatement(sql)	;
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				book=new Booking();
				book.setId(rs.getInt(1));
				
				book.setPickLocation(rs.getString(3));
				book.setDropLocation(rs.getString(4));
				book.setPickDate(rs.getString(5));
				book.setPickTime(rs.getString(6));
				book.setNumPassanger(rs.getInt(8));
				
				book.setStatus(rs.getString(11));
			
			}
			
		}catch (Exception ex) {
		ex.printStackTrace();
		}
		return book;
		
	}
	
	
	public boolean updateActionStatus(int id,String status)
	{
		boolean f=false;
		try {
			String sql="update newbooking set status=? where bookingId=? ";
			PreparedStatement ps=Conn.prepareStatement(sql)	;
			ps.setInt(1, id);
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
	}
		return f;
}
	public List<Booking> getAllBooking()
	{
		List<Booking> list=new ArrayList<Booking>();
		Booking book=null;
		
		try {
			String sql="select * from newbooking";
			PreparedStatement ps=Conn.prepareStatement(sql)	;
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				book=new Booking();
				book.setId(rs.getInt(1));
				book.setuID(rs.getInt(2));
				book.setPickLocation(rs.getString(3));
				book.setDropLocation(rs.getString(4));
				book.setPickDate(rs.getString(5));
				book.setPickTime(rs.getString(6));
				book.setVehiType(rs.getInt(7));
				book.setNumPassanger(rs.getInt(8));
				book.setStatus(rs.getString(9));
				list.add(book);
			}
			
		}catch (Exception ex) {
		ex.printStackTrace();
		}
		return list;
	}
	public int countBooking()
	{
	int i=0;

	try {
		String sql="select * from newbooking";
		PreparedStatement ps=Conn.prepareStatement(sql);
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
	
	public boolean changeStatus(Booking S)
	{
				
		
	boolean f=false;
	try {
		String sql="update newbooking set status=? where bookinID=?";
		PreparedStatement ps=Conn.prepareStatement(sql);
		
		ps.setString(1, S.getStatus());
		ps.setInt(2, S.getId());
		
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


