<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>
<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.dao.vehicleTypeDAO" %>
<%@page import ="com.entity.Vehicle" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.dao.VehicleDAO" %>
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
	
	<div class="col-mb-5">
        	
        <div class="card paint-card">
        <div class="card-body">
     
        <p class="fs-3 text-center">Driver Details</p>
        <table class="table">
        <thead>
        <tr>
        	<th scope="col">ID</th>
        	<th scope="col">Full Name</th>       	      	
        	<th scope="col">Mobile Number</th>  	
        	<th scope="col">Status</th>              	
        </tr>
        </thead>
      <tbody> 
      
     
     <%
    DriverDAO dao2=new DriverDAO(DBConnect.getConn());
    List<Driver> list2=dao2.getAllDriver();
    
    for(Driver d:list2)
    {%>
     <tr>
    	
    	<td><%=d.getDriverId() %></td>
    	<td><%=d.getDriverName() %> </td>
    	<td><%=d.getMobileNum() %></td> 
    	<td><%=d.getStatus() %></td>
    	<td><a href="edit_Driver.jsp?id=<%=d.getDriverId() %>"  >  	 	
    	<input type="button" value="Select">
    	</a></td>
</tr>	
    	
<%}
    
    %>
         
   </tbody>
   </table>
           <p class="fs-3 text-center">Vehicle Details</p>
        <table class="table">
        <thead>
        <tr>
        	<th scope="col">ID</th>
        	<th scope="col">Vehicle Number</th>       	      	
        	<th scope="col">Vehicle type</th>  	
        	<th scope="col">Status</th>              	
        </tr>
        </thead>
      <tbody> 
      
     
     <%
     VehicleDAO dao=new VehicleDAO(DBConnect.getConn());
     List<Vehicle> list=dao.getAllVehicle();
    
    for(Vehicle v:list)
    {%>
     <tr>
    	
    	<td><%=v.getVehiid() %></td>
    	<td><%=v.getVehiNumber() %> </td>
    	<td><%=v.getBrand() %></td> 
    	<td><%=v.getStatus() %></td>
    	
    	
</tr>	
    	
<%}
    
    %>
         
   </tbody>
   </table>
   
        </div>
        </div>
			</div>
			

	
              
       

</div>

</body>
</html>