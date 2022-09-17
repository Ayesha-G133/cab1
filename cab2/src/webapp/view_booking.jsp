
<%@page import ="com.db.DBConnect" %>
<%@page import ="com.entity.User" %>
<%@page import ="com.entity.Driver" %>
<%@page import ="com.entity.Booking" %>
<%@page import ="com.dao.BookingDAO" %>
<%@page import ="com.dao.DriverDAO" %>
<%@page import ="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"  %>
<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
}
.bockImg{
background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.3)),
	url("img/slide1.jpg")
	height:20vh;
	width:100%
	background-size:cover;
	background-repeat: no-repeat;
	
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp"  %>
<div class="container-fulid backImg p-5">
<p class="text-center fs-2 text-white"></p>
</div>
<div class="container p-3">
<div class="row">
<div class="col-md-9">
	<div class="card point-card">
	<div class="card-body">
	<p class="fs-4 fw-bold text-center text-success">Booking List</p>
	<table class="table">
  <thead>
    <tr>
     <th scope="col"></th>
      <th scope="col">Date</th>
      <th scope="col">FirstPickup Location</th>
      <th scope="col">Dropup Location</th>
      <th scope="col">Time</th>
     <th scope="col">number of passanges</th>
      <th scope="col">Vehicle Type</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  BookingDAO dao=new BookingDAO(DBConnect.getConn());
 List<Booking> list =dao.getAllBooking();
  for(Booking book:list){
	    %>
	<tr>
	<th><%=book.getuID() %></th>
   <th><%=book.getPickDate() %></th>
      <td><%=book.getPickLocation() %></td>
      <td><%=book.getDropLocation() %></td>
      <td><%=book.getPickTime() %></td>
      <td><%=book.getNumPassanger() %></td>
      <td><%=book.getVehiType() %></td>
      <td><%=book.getStatus()      %>
      </td>
     </tr>  
  <%
  }
  %>
  
    </tbody>
</table>
</div>
</div>
</div>
<div class="col-md-3 p-3">
	<img alt="" src="img/Taxi.JPG">
</div>
</div>
</div>
</body>
</html>