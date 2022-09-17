package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LocationDAO;
import com.db.DBConnect;
@WebServlet("/addLocation")
public class AddLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String location=req.getParameter("location");
		LocationDAO dao =new LocationDAO(DBConnect.getConn());
		boolean f= dao.addlocation(location);
		HttpSession session = req.getSession();
		
		if(f) {
		session.setAttribute("succMsg","Location Add successfuly");
		resp.sendRedirect("admin/index.jsp");
		}else {
		session.setAttribute("errorMsg","Something wrong");
		resp.sendRedirect("admin/index.jsp");
		}	
}

}
