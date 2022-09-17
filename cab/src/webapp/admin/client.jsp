<%@page import ="com.db.DBConnect" %>
<%@page import ="com.entity.User" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.entity.Booking" %>
<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="com.dao.UserDAO"%>
<%@page import ="java.util.List"%>
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
        <p class="fs-3 text-center">booking Details</p>
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
      <th scope="col">Booking ID</th>
      <th scope="col">Pickup Location</th>
      <th scope="col">Dropup Location</th>
      <th scope="col">Date</th>
      <th scope="col">Time</th>
      <th scope="col">vehi</th>
       <th scope="col">number of passanges</th>
       <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
  <%
    BookingDAO dao=new BookingDAO(DBConnect.getConn());
    List<Booking> list=dao.getAllBooking();
    
    for(Booking book:list)
    {%>
     <tr>
    	
    	<td><%=book.getId() %></td>
    	<td><%=book.getPickLocation() %>
    	<td><%=book.getDropLocation() %> </td>
    	<td><%=book.getPickDate() %> </td>
    	<td><%=book.getPickTime() %>
    	<td><%=book.getVehiType() %>
    	<td><%=book.getNumPassanger() %>
    	<td><%=book.getStatus() %></td>  	
    	<td><% 
    	if("Pending".equals(book.getStatus()))
{%> <a href="action.jsp?id=<%=book.getId() %>" class="btn btn-success btn-sm">Action</a><%}else{%>
	<a href="# " class="btn btn-success btn-sm disabled">Action</a>
	
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