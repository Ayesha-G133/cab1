<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>

<%@page import ="com.dao.vehicleTypeDAO" %>
<%@page import ="com.entity.vehicleType" %>
<%@page import ="com.entity.Vehicle" %>
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
<div class="row">
	
		
	<div class="col-mb-12">
        	
        <div class="card paint-card">
        <div class="card-body">
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
        	<th scope="col">Vehicle Name</th>
        	<th scope="col">NIC</th>
        	<th scope="col">Address</th>
        	<th scope="col">Mobile Number</th>
        	<th scope="col">Email</th>
        	<th scope="col">DOB</th>        	    	  	
        	<th scope="col">Action</th>              	
        </tr>
        </thead>
      <tbody> 
      
     
    <%
    VehicleDAO dao2=new VehicleDAO(DBConnect.getConn());
    List<Vehicle> list2=dao2.getAllVehicle();
    
    for(Vehicle v:list2)
    {%>
     <tr>
    	<td><%=v.getVehiid() %> </td>
    	<td><%=v.getVehiNumber() %></td>
    	<td><%=v.getBrand() %></td>
    	<td><%=v.getCatId() %></td>
    	<td><%=v.getStatus() %></td>
    	    	
    	<td><a href="edit_Vehicle.jsp?Vehiid=<%=v.getVehiid() %>" class="btn btn-sm btn-primary">Edit</a></td>
    	<td><a href="#=<%=v.getVehiid() %>" class="btn btn-sm btn-danger">Delete</a></td>
</tr>	
    	
<%}
    
    %>
         
   </tbody>
   </table>
        </div>
        </div>
			</div>
			
		
			
		</div>	

</div>

</body>
</html>