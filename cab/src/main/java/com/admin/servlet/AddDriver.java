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
import com.entity.Driver;

@WebServlet("/AddDriver")
public class AddDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("name");
			String nic=req.getParameter("nic"); 
			String address=req.getParameter("address"); 
			String mobileNum=req.getParameter("mobileNum"); 
			String email=req.getParameter("email"); 
			String dob=req.getParameter("dob"); 
			String password=req.getParameter("password");
			String status=req.getParameter("status");
			

			Driver d= new Driver(name,nic,address,mobileNum,email,dob,password,status);	
			DriverDAO dao = new DriverDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.registerDriver(d))
			
			{
				
			session.setAttribute("succMsg", "Driver Add Sucessfully");	
			resp.sendRedirect("admin/driver.jsp");
			
			}else {
				session.setAttribute("erroMsg", "Something went wrong");
				resp.sendRedirect("admin/driver.jsp");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
}
