<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.dao.UserDAO"%>
<%@page import ="com.dao.vehicleTypeDAO"%>
<%@page import ="com.dao.LocationDAO"%>
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

<c:if test="${empty adminObj}"> 
<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if> 

<div class="container p-5">
		<p class="fs-4 text-center">Admin Dashbord</p>
		<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-success fs-3">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>

		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>
<%DriverDAO dao=new DriverDAO(DBConnect.getConn()); %>
<%BookingDAO dao2=new BookingDAO(DBConnect.getConn()); %>
<%UserDAO dao3=new UserDAO(DBConnect.getConn()); %>
<%vehicleTypeDAO dao4=new vehicleTypeDAO(DBConnect.getConn()); %>
<%LocationDAO dao5=new LocationDAO(DBConnect.getConn()); %>
	<div class="row">
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
			<i class="fa-solid fa-person"></i><br>
			<p class="fs-4 text-center">
			All Drivers<br><%=dao.countDriver() %>
			</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
			<i class="fa-solid fa-person"></i><br>
			<p class="fs-4 text-center">
			Total Booking<br><%=dao2.countBooking() %>
			</p>
				</div>
			</div>
		</div>

	
	
	<div class="col-md-4 ">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
					<i class="fa-solid fa-users"></i><br>
					<p class="fs-4 text-center">
					Total User<br><%=dao3.countUser() %>
					</p>
				</div>
			</div>
		</div>	
		
	<div class="col-md-4 mt-2">
			<div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
				<div class="card-body text-center text-success">
					<i class="fa-solid fa-car"></i><br>
					<p class="fs-4 text-center">
					Add Vehicle Type<br><%=dao4.countVehicleType() %>
					</p>
				</div>
			</div>		
	</div>	
	<div class="col-md-4 mt-2">
			<div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal1">
				<div class="card-body text-center text-success">
					<i class="fa-solid fa-car"></i><br>
					<p class="fs-4 text-center">
					Add Location<br><%=dao5.countLocation() %>
					</p>
				</div>
			</div>		
	</div>	
	</div>
	</div>
	
	

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="../addVehiType" method="post">
        <div class="form-group">
        	<label>Enter Vehicle Type</label><input type="text" name="vehitype" class="form-control">
        </div>
        <div class="text-center mt-3">
        <button type="submit" class="btn btn-primary">Add</button>
   
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
      
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="../addLocation" method="post">
        <div class="form-group">
        	<label>Enter Location</label><input type="text" name="location" class="form-control">
        </div>
        <div class="text-center mt-3">
        <button type="submit" class="btn btn-primary">Add</button>
   
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
</body>

</html>