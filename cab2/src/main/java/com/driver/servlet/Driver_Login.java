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

@WebServlet("/driverLogin")
public class Driver_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String email=req.getParameter("email");
			String password =req.getParameter("password");
			
			HttpSession session=req.getSession();
			
			DriverDAO dao=new DriverDAO(DBConnect.getConn());
			Driver driver=dao.login(email, password);
			
			if(driver!=null) {
				session.setAttribute("driverObj", driver);
					resp.sendRedirect("driver/index.jsp");
				}else {
					session.setAttribute("errorMsg", "invalid email and password");
					resp.sendRedirect("driver_login.jsp");
			
				}
				}catch (Exception ex) {
			ex.printStackTrace();
		}
		}
	}


