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
						<p class="fs-3 text-center">Add vehicle</p>
						<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>
		<form action="../AddVehicle" method="post">
        <div class="mb-3">
        	<label class="form-lable">Vehicle ID</label><input type="text" required name="Vehiid" class="form-control">
        </div>
         <div class="mb-3">
        	<label class="form-lable">Vehicle Number</label><input type="text" required name="vehiNum" class="form-control">
        </div>
        
        <div class="mb-3">
        	<label class="form-lable">Brand</label><input type="text" required name="vehibrand" class="form-control">
        </div>
        <div class="col-mb-6">
        	<label class="form-lable">Pickup Location</label> <select   required class="form-control">
        	<option>---select---</option>
        	<%vehicleTypeDAO dao =new vehicleTypeDAO(DBConnect.getConn());
        	  
        	List <vehicleType> list=dao.getAllvehicleType();
        	for(vehicleType v:list)
        	{%>
        	<option><%v.getVehiType(); %></option>
        	
        	</select>
        	<input type="hidden" name="Vehiid" value="<%=v.getId() %>">
        	<%}
        	%>
        	
        </div>
       
        
          <div class="mb-3">
        	<label class="form-lable">Status</label><input type="text" required name="vehiStatus" class="form-control">
        </div>
        <div class="text-center mt-3">
        <button type="submit" class="btn btn-primary">Add</button>
   
        </div>
         
        </form>
				</div>
			</div>
		</div>

			
		</div>	

</div>

</body>
</html>