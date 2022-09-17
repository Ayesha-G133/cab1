package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.VehicleDAO;
import com.db.DBConnect;
import com.entity.Vehicle;

@WebServlet("/AddVehicle")
public class AddVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String vehicleNum=req.getParameter("vehiNum"); 
			
			String vehicleBrand=req.getParameter("vehibrand"); 
			int vehiclecat=Integer.parseInt(req.getParameter("vehiCat")); 
			
			
			

			Vehicle v= new Vehicle(vehicleNum,vehicleBrand,vehiclecat,"Available");
			VehicleDAO dao = new VehicleDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.registerVehicle(v))
			
			{
				
			session.setAttribute("succMsg", "Vehicle Add Sucessfully");	
			resp.sendRedirect("admin/vehicle.jsp");
			
			}else {
				session.setAttribute("erroMsg", "Something went wrong");
				resp.sendRedirect("admin/vehicle.jsp");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
}


