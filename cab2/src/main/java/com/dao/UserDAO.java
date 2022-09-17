package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean register(User u)
	{
		boolean f=false;
		
		try {
			String sql="insert into user(full_name,mobile,email,password)values(?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, u.getFullName());
		ps.setString(2, u.getmobile());
		ps.setString(3, u.getEmail());
		ps.setString(4, u.getPassword());
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
			return f;
	}
public User login (String email,String pw) {
	User u=null;
	try {
		String sql="select * from user where email=? and password=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2, pw);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			u=new User();
			u.setId(rs.getInt(1));
			u.setFullName(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPassword(rs.getString(4));
			u.setmobile(rs.getString(5));
		}
	}catch (Exception ex) {
	ex.printStackTrace();
}
return u;
}

public User getUserBYId (int UserID) {
	User u=null;
	try {
		String sql="select * from user where id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,UserID);
		
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			u=new User();
			u.setId(rs.getInt(1));
			u.setFullName(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPassword(rs.getString(4));
			u.setmobile(rs.getString(5));
		}
	}catch (Exception ex) {
	ex.printStackTrace();
}
return u;
}
public int countUser()
{
int i=0;

try {
	String sql="select * from user";
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
public boolean checkOldPassword(int userid,String oldPassword)
{
boolean f=false;
try {
	String sql="select * from user where id=? and password=?";
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
	String sql="update user set password=? where id=?";
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
}
