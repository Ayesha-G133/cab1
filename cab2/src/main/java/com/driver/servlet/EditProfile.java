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
import com.entity.Driver;
@WebServlet("/driverUpdateProfile")
public class EditProfile extends HttpServlet{
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
			 
			String status=req.getParameter("status");
			
			int id=Integer.parseInt(req.getParameter("Driverid"));
			
			Driver d= new Driver(id,name,nic,address,mobileNum,email,dob,"", status);	
			DriverDAO dao = new DriverDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.EditeDriverProfile(d))
			
			{
			Driver UpdateDriver=dao.getDriverBYId(id);	
			session.setAttribute("succMsgd", "Driver update Sucessfully");	
			session.setAttribute("driverObj",UpdateDriver);
			resp.sendRedirect("driver/edit_profile.jsp");
			
			}else {
				session.setAttribute("erroMsgd", "Something went wrong");
				resp.sendRedirect("driver/edit_profile.jsp");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		
		
	}
	
	
}
