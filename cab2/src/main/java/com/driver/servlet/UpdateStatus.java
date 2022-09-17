package com.driver.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.DriverDAO;
import com.db.DBConnect;


@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int Driverid=Integer.parseInt(req.getParameter("Driverid"));
			String status=req.getParameter("status");
			
				
			DriverDAO dao = new DriverDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
					
			if(dao.updateStatus(Driverid, status))
			{
				session.setAttribute("succMsg", "Action Complete");
				resp.sendRedirect("action.jsp");
			}else
				session.setAttribute("errorMsg", "Something wrong");
			resp.sendRedirect("action.jsp");	
		
	}catch (Exception ex) {
		ex.printStackTrace();
	}
	
	}

}
