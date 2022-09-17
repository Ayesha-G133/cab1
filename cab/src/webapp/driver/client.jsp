<%@page import ="com.db.DBConnect" %>
<%@page import ="com.entity.User" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.entity.Booking" %>
<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.dao.UserDAO" %>

<%@page import ="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<c:if test="${empty driverObj}"> 
<c:redirect url="../driver_login.jsp"></c:redirect>
</c:if> 
<%@include file="navbar.jsp" %>

<div class="cotainer-fluid p-3">
<div class="row">
	
		
	<div class="col-mb-12">
        	
        <div class="card paint-card">
        <div class="card-body">
        <p class="fs-3 text-center">Client Details</p>
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
        	<th scope="col">Full Name</th>
        	<th scope="col">Mobile Number</th>
        	<th scope="col">Date</th>
        	<th scope="col">PickUp Location</th>
        	<th scope="col">Dropup Location</th> 
        	<th scope="col">Status</th>        	 	  	
        	<th scope="col">Action</th>              	
        </tr>
        </thead>
      <tbody> 
      <% Driver d=(Driver)session.getAttribute("driverObj");
      BookingDAO dao = new BookingDAO(DBConnect.getConn());
      UserDAO dao2=new UserDAO(DBConnect.getConn());
      List<Booking> list=dao.getAllBookingBYDriverLogin(d.getDriverId());
      for (Booking book:list){
      User u=dao2.getUserBYId(book.getId());
      %>
     <tr>
    	<td><%=u.getFullName() %></td>
    	<td><%=u.getmobile() %></td>
    	<td><%=book.getPickDate() %></td>
    	<td><%=book.getPickLocation() %></td>
    	<td><%=book.getDropLocation() %></td>
    	<td><%=book.getStatus() %></td>
    	<td>
    	
    	<% 
    	if("pending".equals(book.getStatus()))
{%> <a href="action.jsp?id=<%=book.getId() %>" class="btn btn-success btn-sm">Action</a><%}else{%>
	<a href="#" 
			class="btn btn-success btn-sm disabled">Action</a>
	
	<%}
	%>
	</td>
	</tr>
<%} %>

    	

   </tbody>
   </table>
        </div>
        </div>
			</div>
			
		
			
		</div>	

</div>

</body>
</html>