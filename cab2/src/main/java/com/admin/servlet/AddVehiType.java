package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.vehicleTypeDAO;
import com.db.DBConnect;

@WebServlet("/addVehiType")
public class AddVehiType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String vehitype=req.getParameter("vehitype");
		vehicleTypeDAO dao =new vehicleTypeDAO(DBConnect.getConn());
		boolean f= dao.addvehicle(vehitype);
		HttpSession session = req.getSession();
		
		if(f) {
		session.setAttribute("succMsg","Vehical Add successfuly");
		resp.sendRedirect("admin/index.jsp");
		}else {
		session.setAttribute("errorMsg","Something wrong");
		resp.sendRedirect("admin/index.jsp");
		}	
}
}
