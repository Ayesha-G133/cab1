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
		<div class="col-md-5 offset-md-4 ">
			<div class="card paint-card">
				<div class="card-body">
						<p class="fs-3 text-center">Add Driver</p>
						<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>
		<form action="../AddDriver" method="post">
        <div class="mb-3">
        	<label class="form-lable">Full Name</label><input type="text" required name="name" class="form-control">
        </div>
         <div class="mb-3">
        	<label class="form-lable">NIC</label><input type="text" required name="nic" class="form-control">
        </div>
        
        <div class="mb-3">
        	<label class="form-lable">Address</label><input type="text" required name="address" class="form-control">
        </div>
        
       
        <div class="mb-3">
        	<label class="form-lable">Mobile Number</label><input type="text" required name="mobileNum" class="form-control">
        </div>
         <div class="mb-3">
        	<label class="form-lable">Email</label><input type="text" required name="email" class="form-control">
        </div>
        <div class="mb-3">
        	<label class="form-lable">DOB</label><input type="date" required name="dob" class="form-control">
        </div>
       
        <div class="mb-3">
        	<label class="form-lable">Password</label><input type="password" required name="password" class="form-control">
        </div>
        
        <div class="mb-3">
        	<label class="form-lable">Status</label> <input type= "text" required name="status" required class="form-control">
        	        	        	
        </div>
        <div class="text-center mt-3">
        <button type="submit" class="btn btn-primary">Add</button>
   
        </div>
         
        </form>
				</div>
			</div>
		</div>
<form action="../DriverDAO" method="post">		
	<div class="col-mb-5">
        	
        <div class="card paint-card">
        <div class="card-body">
        <p class="fs-3 text-center">Driver Details</p>
        <table class="table">
        <thead>
        <tr>
        	<th scope="col">Full Name</th>
        	<th scope="col">NIC</th>
        	<th scope="col">Address</th>
        	<th scope="col">Mobile Number</th>
        	<th scope="col">Email</th>
        	<th scope="col">DOB</th>
        	
        	<th scope="col">Password</th>   	
        	<th scope="col">Action</th>              	
        </tr>
        </thead>
      <tbody> 
      
     
    <%
    DriverDAO dao2=new DriverDAO(DBConnect.getConn());
    List<Driver> list2=dao2.getAllDriver();
    
    for(Driver d:list2)
    {%>
     <tr>
    	<td><%=d.getDriverName() %> </td>
    	<td><%=d.getNIC() %></td>
    	<td><%=d.getAddress() %></td>
    	<td><%=d.getMobileNum() %></td>
    	<td><%=d.getEmail() %></td>
    	<td><%=d.getDOB() %></td>
    	
    	<td><%=d.getPassword() %></td>
    	<td><%=d.getStatus() %></td>
    	<td><a href="edit_Driver.jsp?Driverid=<%=d.getDriverId() %>" class="btn btn-sm btn-primary">Edit</a></td>
    	<td><a href="#" class="btn btn-sm btn-danger">Delete</a></td>
</tr>	
    	
<%}
    
    %>
         
   </tbody>
   </table>
        </div>
        </div>
			</div>
			
	</form>		
			
		</div>	

</div>

</body>
</html>