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

@WebServlet("/UpdateVehicle")
public class UpdateVehicle extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			String vehiNumber=req.getParameter("vehiNum");
			String brand=req.getParameter("vehibrand");
			int catId=Integer.parseInt(req.getParameter("CatId"));
			String status=req.getParameter("vehiStatus"); 					
			int id=Integer.parseInt(req.getParameter("Vehiid"));
			
			Vehicle v= new Vehicle(id,vehiNumber,brand,catId,status);	
			VehicleDAO dao = new VehicleDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.UpdateVehicle(v))
			
			{
				
			session.setAttribute("succMsg", "Vehicle update Sucessfully");	
			resp.sendRedirect("admin/action.jsp");
			
			}else {
				session.setAttribute("erroMsg", "Something went wrong");
				resp.sendRedirect("admin/action.jsp");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		
}
	}
