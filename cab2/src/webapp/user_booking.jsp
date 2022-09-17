<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>
<%@page import ="com.dao.vehicleTypeDAO" %>
<%@page import ="com.entity.vehicleType" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.dao.LocationDAO" %>
<%@page import ="com.entity.Location" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Bookig</title>
<%@include file="component/allcss.jsp"  %>
<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
} 

.bockImg{
background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.3)),
	url("img/slide1.jpg")
	height:20vh;
	width:100%
	background-size:cover;
	background-repeat: no-repeat;
	
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp"  %>

<div class="container-fulid backImg p-5">
<p class="text-center fs-2 text-white"></p>
</div>
<div class="container p-3">
<div class="row">
<div class="col-md-6 p-5">
	<img alt="" src="img/slide1.jpg">
</div>

<div class="col-md-6">

<div class="card point-card">
	<div class="card-body">
	<p class="text-center fs=3">User Booking</p>
	<c:if test="${not empty errorMsg}"> 
<p class="fs-4 text-center text-danger">${errorMsg}</p>
<c:remove var="errorMsg" scope="session"/>
</c:if>

<c:if test="${not empty succMsg}"> 
<p class="fs-4 text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<form class="row g-3" action="addBooking" method="post">


<div class="col-mb-6">
		<label for="inputEmail4" class="form.label"></label><input  value="${userObj.id}" class="form-control" name="clientid">
</div>
<div class="col-mb-6">
        	<label class="form-lable">Pickup Location</label> <select name="Pick_Location" required class="form-control">
        	<option>---select---</option>
        	<%LocationDAO dao =new LocationDAO(DBConnect.getConn());
        	  
        	List <Location> list=dao.getAllLocation();
        	for(Location l:list)
        	{%>
        	<option><%=l.getLocation() %></option>
        	<%}
        	%>
        	</select>
        </div>
 <div class="col-mb-6">
        	<label class="form-lable">Drop Location</label> <select name="dropoff_Location" required class="form-control">
        	<option>---select---</option>
        	<%LocationDAO dao1 =new LocationDAO(DBConnect.getConn());
        	  
        	List <Location> list1=dao1.getAllLocation();
        	for(Location l:list)
        	{%>
        	<option><%=l.getLocation() %></option>
        	<%}
        	%>
        	</select>
        </div>  
             	


<div class="col-mb-6">
		<label for="inputEmail4" class="form.label">Date of pickup</label><input required type="date" class="form-control" name="date_pickup">
</div>
<div class="col-mb-6">
		<label for="inputEmail4" class="form.label">pickup Time</label><input required type="time" class="form-control" name="pickup_time">
</div>

<div class="col-mb-6">
        	<label class="form-lable">vehicle Type</label> <select name="VehiTypeID" required class="form-control">
        	<option>---select---</option>
        	<%vehicleTypeDAO dao2 =new vehicleTypeDAO(DBConnect.getConn());
        	  
        	List <vehicleType> list2=dao2.getAllvehicleType();
        	for(vehicleType v:list2)
        	{%>
        	<option><%=v.getId() %></option>
        	<%}
        	%>
        	</select>
        	
        </div> 
        
        
        
		
<div class="col-mb-6">
		<label for="inputEmail4" class="form.label">Number of Passengers</label><input required type="number" class="form-control" name="num_passangers">
</div>



<c:if test="${empty userObj}">
<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-succes">Proceed</a>

</c:if>
<c:if test="${not empty userObj}">
<button class="col-md-6 offset-md-3 btn btn-success">Proceed</button>

</c:if>
</form>


	</div>
</div>

</div>
</div>
</div>

</body>
</html>