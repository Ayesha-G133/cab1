package com.dao;


	import java.sql.Connection;
	import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.entity.VehicleDriver;


	public class VehicleDriverDAO {
		
		private Connection Conn;

		public VehicleDriverDAO(Connection conn) {
			super();
			this.Conn = conn;
		}
		
		public boolean Adddrivervehicle(VehicleDriver add)
		{
			boolean f=false;
			try {
				String sql ="insert into add_driver_vehical(bookingID,vehicleID,driverID) values(?,?,?) ";
				PreparedStatement ps=Conn.prepareStatement(sql)	;
			
				ps.setInt(1,add.getBookID());
				ps.setInt(2,add.getVehiID());
				ps.setInt(3,add.getDriverID());
				
				
				int i = ps.executeUpdate();
				if(i==1) {
					f=true;
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
			return f;
}
		public VehicleDriver getadddrivevehiBYId(int id )
		{
			
			VehicleDriver add=null;
			
			try {
				String sql="select * from add_driver_vehical where bookingID=?";
				PreparedStatement ps=Conn.prepareStatement(sql)	;
				ps.setInt(1, id);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					add=new VehicleDriver();
					add.setBookID(rs.getInt(1));
					
					add.setVehiID(rs.getInt(2));
					add.setDriverID(rs.getInt(3));
					
									
				}
				
			}catch (Exception ex) {
			ex.printStackTrace();
			}
			return add;
			
		}
	}
