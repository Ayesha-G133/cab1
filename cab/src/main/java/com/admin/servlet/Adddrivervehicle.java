package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.dao.VehicleDriverDAO;
import com.entity.VehicleDriver;

@WebServlet("/Adddrivervehicle")
public class Adddrivervehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int bookID=Integer.parseInt(req.getParameter("Bookid"));			
			int vehiID=Integer.parseInt(req.getParameter("Vehicleid"));
			int driverID=Integer.parseInt(req.getParameter("Driverid"));
			
			VehicleDriver add =new VehicleDriver(bookID,vehiID,driverID);
			VehicleDriverDAO dao = new VehicleDriverDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.Adddrivervehicle(add))
			
			{
				
			session.setAttribute("succMsg", "Driver/vehicle Add Sucessfully");	
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
	
	
