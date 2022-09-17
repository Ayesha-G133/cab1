<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false"   %>    
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
<p class="fs-4 text-center">Driver Dashbord</p>
<c:if test="${empty driverObj}"> 
<c:redirect url="../driver_login.jsp"></c:redirect>
</c:if> 

<div class="container p-5">
	<%
	Driver d =(Driver)session.getAttribute("driverObj");
	DriverDAO dao=new DriverDAO(DBConnect.getConn()); %>	
	
		
	<div class="row">
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
			<i class="fa-solid fa-person"></i><br>
			<p class="fs-4 text-center">
			Driver<br><%=dao.countDriver() %>
			</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
			<i class="fa-solid fa-person"></i><br>
			<p class="fs-4 text-center">
			Booking<br><%=dao.countBookingBYDriverId(d.getDriverId()) %>
			</p>
				</div>
			</div>
		</div>

	
			
	
	</div>
	</div>
	
	


</body>

</html>