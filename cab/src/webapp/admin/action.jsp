<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>

<%@page import ="com.dao.vehicleTypeDAO" %>
<%@page import ="com.entity.vehicleType" %>
<%@page import ="com.dao.VehicleDAO" %>
<%@page import ="com.entity.Vehicle" %>
<%@page import ="com.entity.Booking" %>
<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.entity.VehicleDriver" %>
<%@page import ="com.dao.VehicleDriverDAO" %>
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
<p class="fs-3 text-center">Add Driver & Vehicle</p>
						
		<table class="table">
        <thead>
        <tr>
        	<th scope="col"> ID</th>
        	<th scope="col">Full Name</th>
        	<th scope="col">NIC</th>
        	<th scope="col">Mobile Number</th>        	       	       	        	  	
        	<th scope="col">Action</th>              	
        </tr>
        </thead>
      <tbody> 
      
      
     
    <%
                DriverDAO dao2=new DriverDAO(DBConnect.getConn());
                    List<Driver> list2=dao2.getAllDriver();
                    
                    for(Driver d:list2)
                    {
                %>
     <tr>
     	<td><%=d.getDriverId()%> </td>
    	<td><%=d.getDriverName()%> </td>
    	<td><%=d.getMobileNum()%></td>
    	<td><%=d.getStatus()%></td>
    	
    	<td><%
    	    	if("available".equals(d.getStatus()))
    	    	    	{
    	    	%> <a href="edit_Driver.jsp?Driverid=<%=d.getDriverId()%>" class="btn btn-sm btn-primary">Edit</a><%
 }else{
 %>
    		<a href="# " class="btn btn-success btn-sm disabled">Action</a>
    		
    		<%
    		    		}
    		    		%>
    		</td>
    		</tr>
    	
	    	 <%
    		    	 }
    		    	 %>       
   </tbody>
   </table>
   	<p class="fs-3 text-center">Vehicle Details</p>
        <c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>
        <table class="table">
        <thead>
        <tr>
        	<th scope="col"></th>
        	<th scope="col">Number</th>
        	<th scope="col">Brand</th>
        	<th scope="col">CatId</th>
        	<th scope="col">Action</th>              	
        </tr>
        </thead>
      <tbody> 
      
     
    <%
                VehicleDAO dao=new VehicleDAO(DBConnect.getConn());
                    List<Vehicle> list=dao.getAllVehicle();
                    
                    for(Vehicle v:list)
                    {
                %>
     <tr>
    	<td><%=v.getVehiid()%> </td>
    	<td><%=v.getVehiNumber()%></td>
    	<td><%=v.getBrand()%></td>
    	<td><%=v.getCatId()%></td>
    	<td><%=v.getStatus()%></td>
    	    	
    	<td><a href="edit_Vehicle.jsp?Vehiid=<%=v.getVehiid()%>" class="btn btn-sm btn-primary">Edit</a></td>
    	
</tr>	
    	
<%
	    	}
	    	%>
         
   </tbody>
   </table>
    </div>	 
   
        </div>
 <div class="cotainer-fluid p-3">
<div class="row">
		<div class="col-md-5 offset-md-4 ">
			<div class="card paint-card">
				<div class="card-body">       
        <p class="fs-3 text-center">Edit Driver/veh</p>
						<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>
	
		
  <form action="../Adddrivervehicle" method="post">  
    
<div class="mb-3">
        	<label class="form-lable">Booking Number</label><input type="text" required name="Bookid"   class="form-control" >
</div> 
<div class="mb-3">
        	<label class="form-lable">Vehicle Number</label><input type="text" required name="Vehicleid"  class="form-control" >
</div> 	
<div class="mb-3">
        	<label class="form-lable">Driver Number</label><input type="text" required name="Driverid"  class="form-control" >
</div>

<div class="mb-3">
<button type="submit" class="btn btn-primary col-md-12">Add</button>
</div>
</form>			
</div>
</div>
</div>		
</div>
 
</div>
<div class="cotainer-fluid p-3">
<div class="row">
	<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
<p class="fs-3 text-center">Fill action</p>
						<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>	
				
		<form action="../EditStatus" method="post">
        <div class=col-md-12>
        <lable>Fill Action</lable>
        <textarea required name="stats" class="form-control" rows="3" cols=""></textarea>
        </div>
        
        <input type="text" name="bookingid" value="${bookObj.id}">
              
        <button type="submit" class="btn btn-primary col-md-12">Update</button>
   </form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>