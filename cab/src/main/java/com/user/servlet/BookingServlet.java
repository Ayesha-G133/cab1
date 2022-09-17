package com.user.servlet;

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






@WebServlet("/addBooking")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uID = Integer.parseInt(req.getParameter("clientid"));
		String PickLocation = req.getParameter("Pick_Location");
		String dropLocation = req.getParameter("dropoff_Location");
		String pickDate = req.getParameter("date_pickup");
		String pickTime = req.getParameter("pickup_time");
		int VehiType = Integer.parseInt(req.getParameter("VehiTypeID"));
		int numPassanger = Integer.parseInt(req.getParameter("num_passangers"));
		
		
		
		

	Booking book=new Booking(uID,PickLocation,dropLocation,pickDate,pickTime,numPassanger,VehiType,"Pending");
	BookingDAO dao = new BookingDAO(DBConnect.getConn());
	HttpSession session=req.getSession();
	
	if(dao.addbookig(book))
	{
		session.setAttribute("succMsg","Booking Succesfully" );
		resp.sendRedirect("user_booking.jsp");
	}
	else {
		session.setAttribute("errorMsg","Something Wrong" );
		resp.sendRedirect("user_booking.jsp");
	}
	}
}


