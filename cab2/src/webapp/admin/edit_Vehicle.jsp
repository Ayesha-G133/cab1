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
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
						<p class="fs-3 text-center">Edit Vehicle</p>
		<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>
		
		<% 
		int id=Integer.parseInt(request.getParameter("Vehiid"));
		VehicleDAO dao2= new VehicleDAO(DBConnect.getConn());
		Vehicle v=dao2.getVehicleBYId(id);
		%>
		
		<form action="../UpdateVehicle" method="post">
		
        <div class="mb-3">
        	<label class="form-lable">Vehicle Number</label><input type="text" required name="vehiNum" value="<%=v.getVehiNumber()%>" class="form-control" >
        </div>
         <div class="mb-3">
        	<label class="form-lable">brand</label><input type="text" required name="vehibrand" value="<%=v.getBrand() %>" class="form-control" >
        </div>
        
        <div class="mb-3">
        	<label class="form-lable">Catagory ID</label><input type="text" required name="CatId" value="<%=v.getCatId()%>" class="form-control">
        </div>
        
       
        <div class="mb-3">
        	<label class="form-lable">Status</label><input type="text" value="<%=v.getStatus() %>" required name="vehiStatus" class="form-control">
        </div>
        
        <input type="hidden" name="Vehiid" value="<%=v.getVehiid() %>">
        
        <button type="submit" class="btn btn-primary col-md-12">Update</button>
   </form>
        </div>
  	
			
		</div>	
</div>
</div>
</div>

</body>
</html>