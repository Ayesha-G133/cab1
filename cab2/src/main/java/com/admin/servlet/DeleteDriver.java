package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DriverDAO;
import com.db.DBConnect;

@WebServlet("/DeleteDriver")
public class DeleteDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int Driverid=Integer.parseInt(req.getParameter("Driverid"));
		
		DriverDAO dao = new DriverDAO(DBConnect.getConn());
		
		HttpSession session=req.getSession();
		
		if(dao.DeleteDriver(Driverid))
		
		{
			
		session.setAttribute("succMsg", "Driver Delete Sucessfully");	
		resp.sendRedirect("admin/view_driver.jsp");
		
		}else {
			session.setAttribute("erroMsg", "Something went wrong");
			resp.sendRedirect("admin/view_driver.jsp");
		}
	}
	
	

}
