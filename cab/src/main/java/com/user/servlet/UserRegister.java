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
import com.entity.User;


@WebServlet("/User_register")
public class UserRegister extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String fullName=req.getParameter("fullname");
			String mobile=req.getParameter("mobile");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			
			User u=new User(fullName,mobile,email,password);
			
			UserDAO dao =new UserDAO(DBConnect.getConn());
		
			HttpSession session=req.getSession();
			
			boolean f=dao.register(u);
			
			if(f)
			{
				session.setAttribute("sucMsg","Register Sucessfull");
				
				resp.sendRedirect("signup.jsp");

				
			}else {


session.setAttribute("errorMsg","Something Went wrong");
				
				resp.sendRedirect("signup.jsp");
				
			
			}
			
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}
			
	}

	
	
	
}
