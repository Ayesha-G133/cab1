<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>
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
	
		
	<div class="col-mb-12">
        	
        <div class="card paint-card">
        <div class="card-body">
        <p class="fs-3 text-center">Driver Status</p>
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
        	<th scope="col">ID</th>
        	<th scope="col">Full Name</th>
        	     	  	
        	<th scope="col">Current Status</th>              	
        </tr>
        </thead>
      <tbody> 
      
     
    <%
    DriverDAO dao2=new DriverDAO(DBConnect.getConn());
    List<Driver> list2=dao2.getAllDriver();
    
    for(Driver d:list2)
    {%>
     <tr>
    	
    	<td><%=d.getNIC() %></td>
    	<td><%=d.getDriverName() %> </td>
    	<td><%=d.getStatus() %></td>  	
    	<td><a href="edit_Driver.jsp?id=<%=d.getDriverId() %>" class="btn btn-sm btn-primary">Edit</a></td>
    	<td><a href="../DeleteDriver?id=<%=d.getDriverId() %>" class="btn btn-sm btn-danger">Delete</a></td>
</tr>	
    	
<%}
    
    %>
         
   </tbody>
   </table>
   <form action="../DriChangePw" method="post">
	<div class="mb-3">
		<label class="form.label">Enter New Password</label><input required name="newPassword" type="text" class="form-control">
</div>
<div class="mb-3">
	<label class="form.label">Enter Old Password</label><input required name="oldPassword" type="password" class="form-control">
</div>
<input type="hidden" value="${driverObj.id}" name="userid">
<button type="Submit" class="btn bg-success text-white col-md-12">Change Password</button>
</form>
        </div>
        </div>
			</div>
			
		
			
		</div>	

</div>
</body>
</html>