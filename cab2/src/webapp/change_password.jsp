<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false"   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change password</title>
<%@include file="component/allcss.jsp"  %>
<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
} 
</style>
</head>
<body>
<%@include file="component/navbar.jsp"  %>
<div class="container p-5">
<div class="row">
<div class="col-md-4 offset-md-4"> 
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

<form action="userPasswordChange" method="post">
	<div class="mb-3">
		<label class="form.label">Enter New Password</label><input required name="newPassword" type="text" class="form-control">
</div>
<div class="mb-3">
	<label class="form.label">Enter Old Password</label><input required name="oldPassword" type="password" class="form-control">
</div>
<input type="hidden" value="${userObj.id}" name="userid">
<button type="Submit" class="btn bg-success text-white col-md-12">Change Password</button>
</form>

</div>
</div>
</div>

</div>
</div>

</body>
</html>