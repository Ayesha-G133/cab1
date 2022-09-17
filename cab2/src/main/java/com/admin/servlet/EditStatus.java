package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookingDAO;
import com.db.DBConnect;
import com.entity.Booking;

@WebServlet("/EditStatus")
public class EditStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;



@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	try {	
		int id=Integer.parseInt(req.getParameter("bookingid"));
		String status=req.getParameter("stats");
		
		Booking S = new Booking (id,status);
		BookingDAO dao=new BookingDAO(DBConnect.getConn());
		
		HttpSession session=req.getSession();
				
	if(dao.changeStatus(S))
{
	session.setAttribute("succMsg", "Stats Updated Sucessfully");	
	resp.sendRedirect("admin/client.jsp");
	
	}else {
		session.setAttribute("errorMsg", "someting went wrong ");
		resp.sendRedirect("admin/client.jsp");
	}
	}catch(Exception ex){
		ex.printStackTrace();
}
	
	
}
}




















	
	
	
	
	
	
	
	
	
	
	
	
	
