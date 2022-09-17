package com.user.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
@WebServlet("/userPasswordChange")
public class ChangePassword extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid=Integer.parseInt(req.getParameter("userid"));
		String oldPassword=req.getParameter("oldPassword");
		String newPassword=req.getParameter("newPassword");
		
	

UserDAO dao=new UserDAO(DBConnect.getConn());
HttpSession session=req.getSession();

if(dao.checkOldPassword(userid,oldPassword))
{
	if(dao.changePassword(userid,newPassword)){
		session.setAttribute("succMsg", "Password Change Successfully");
		resp.sendRedirect("driver/edit_profile.jsp");
	}else {
		session.setAttribute("errorMsg", "Something wrong");
		resp.sendRedirect("driver/edit_profile.jsp");
	}
}else {
	session.setAttribute("errorMsg", "Incorrect Old Password");
	resp.sendRedirect("driver/edit_profile.jsp");
}
}
}
