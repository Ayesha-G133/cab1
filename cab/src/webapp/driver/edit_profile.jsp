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
<%@include file="navbar.jsp" %>
</head>
<body>
<c:if test="${empty driverObj}"> 
<c:redirect url="../driver_login.jsp"></c:redirect>
</c:if> 
<div class="container p-5">
<div class="row">
<div class="col-md-4"> 
<div class="card paint-card">
<div class="card-body">
<p class="fs-4 text center">Change Password</p>
<c:if test="${not empty succMsg}"> 

<p class="text-center test-success fs-3">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if> 

<c:if test="${not empty errorMsg}"> 
<p class="text-center test-success fs-3">${errorMsg}</p>
<c:remove var="errorMsg" scope="session"/>
</c:if>

<form action="../DriChangePw" method="post">
	<div class="mb-3">
		<label class="form.label">Enter New Password</label><input required name="newPassword" type="text" class="form-control">
</div>
<div class="mb-3">
	<label class="form.label">Enter Old Password</label><input required name="oldPassword" type="password" class="form-control">
</div>
<input type="hidden" value="${driverObj.Driverid}" name="Driverid">
<button type="Submit" class="btn bg-success text-white col-md-12">Change Password</button>
</form>

</div>
</div>
</div>
<div class="col-md-5 offset-md-2"> 
<div class="card paint-card">
<p class="txt-center fs-3">Edit Profile</p>
<c:if test="${not empty succMsgd}"> 

<p class="text-center test-success fs-3">${succMsgd}</p>
<c:remove var="succMsgd" scope="session"/>
</c:if> 

<c:if test="${not empty errorMsgd}"> 
<p class="text-center test-success fs-3">${errorMsgd}</p>
<c:remove var="errorMsgd" scope="session"/>
</c:if>
<div class="card-body">
<form action="../driverUpdateProfile" method="post">
<input type="hidden" name="Driverid" value=${driverObj.Driverid }>
        <div class="mb-3">
        	<label class="form-lable">Full Name</label><input type="text" required name="name" class="form-control" value="${driverObj.driverName}">
        </div>
         <div class="mb-3">
        	<label class="form-lable">NIC</label><input type="text" required name="nic" class="form-control" value="${driverObj.NIC}">
        </div>
        
        <div class="mb-3">
        	<label class="form-lable">Address</label><input type="text" required name="address" class="form-control"value="${driverObj.address}">
        </div>
        
       
        <div class="mb-3">
        	<label class="form-lable">Mobile Number</label><input type="text" required name="mobileNum" class="form-control" value="${driverObj.mobileNum}">
        </div>
         <div class="mb-3">
        	<label class="form-lable">Email</label><input type="text" required name="email" class="form-control" value="${driverObj.email}">
        </div>
        <div class="mb-3">
        	<label class="form-lable">DOB</label><input type="date" required name="dob" class="form-control" value="${driverObj.DOB }">
        </div>
        <div class="mb-3">
        	<label class="form-lable">status</label><input type="text" required name="status" class="form-control" value="${driverObj.status}">
        </div>
        
        <div class="text-center mt-3">
        
        <button type="submit" class="btn btn-primary">update</button>
   
        </div>
        </form>

</div>
</div>
</div>
</div>

</body>
</html>