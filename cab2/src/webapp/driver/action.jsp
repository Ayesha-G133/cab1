<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import ="java.util.List"%>

<%@page import ="com.dao.vehicleTypeDAO" %>
<%@page import ="com.entity.vehicleType" %>
<%@page import ="com.entity.Booking" %>
<%@page import ="com.dao.BookingDAO" %>
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
						<p class="fs-3 text-center">Edit Driver</p>
						<c:if test="${not empty errorMsg}"> 
		<p class=" fs-3 text-center test-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}"> 
		<div class="fs-3 text-center test-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
		</c:if>	
		<%
		int id=Integer.parseInt(request.getParameter("id"));
		BookingDAO dao =new BookingDAO(DBConnect.getConn());
		 
		Booking book=dao.getBookingBYId(id);
		
		%>		
		<form action="../updateStatus" method="post">
        <div class=col-md-12>
        <lable>Action</lable>
        <textarea required name="comm" class="form-control" rows="3" cols=""></textarea>
        </div>
        
        <input type="hidden" name="id" value="<%=book.getId() %>">
        <input type="hidden" name="did" value="">
        
        <button type="submit" class="btn btn-primary col-md-12">Update</button>
   </form>
        </div>
  	
			
		</div>	
</div>
</div>
</div>

</body>
</html>