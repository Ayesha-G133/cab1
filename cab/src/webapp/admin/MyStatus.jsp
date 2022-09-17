<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>

<%@page import ="com.dao.vehicleTypeDAO" %>
<%@page import ="com.entity.vehicleType" %>

<%@page import ="com.entity.Driver" %>
<%@page import ="com.dao.DriverDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.point-card{

	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
	}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="cotainer-fluid p-3">
<div class="row">

	<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
						
		<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>	
		
		<% 
		int Driverid=Integer.parseInt(request.getParameter("Driverid"));
		DriverDAO dao2= new DriverDAO(DBConnect.getConn());
		Driver d=dao2.getDriverBYId(Driverid);
		%>
				
		<form action="#" method="post">
        <div class="mb-3">
        	<label class="form-lable">Full Name</label><input type="text" required name="name" value="<%=d.getDriverName()%>" class="form-control" >
        </div>
         <div class="mb-3">
        	<label class="form-lable">NIC</label><input type="text" required name="nic" value="<%=d.getNIC() %>" class="form-control" >
        </div>
        
        <div class="mb-3">
        	<label class="form-lable">Address</label><input type="text" required name="address" value="<%=d.getAddress()%>" class="form-control">
        </div>
        
       
        <div class="mb-3">
        	<label class="form-lable">Mobile Number</label><input type="text" required name="mobileNum" value="<%=d.getMobileNum() %>" class="form-control" >
        </div>
         <div class="mb-3">
        	<label class="form-lable">Email</label><input type="text" required name="email"  value="<%=d.getEmail() %>" class="form-control">
        </div>
        <div class="mb-3">
        	<label class="form-lable">DOB</label><input type="date" value="<%=d.getDOB() %>" required name="dob" class="form-control">
        </div>
      
        <div class="mb-3">
        	<label class="form-lable">Password</label><input type="text" value="<%=d.getPassword() %>" required name="password" class="form-control" >
        </div>
        <div class="mb-3">
        	<label class="form-lable">Status</label><input type="text" value="<%=d.getStatus() %>" required name="status" class="form-control">
        </div>
        
        <input type="hidden" name="id" value="<%=d.getDriverId() %>">
        
        <button type="submit" class="btn btn-primary col-md-12">Update</button>
   </form>
        </div>
  	
			
		</div>	
</div>
</div>
</div>

</body>
</html>