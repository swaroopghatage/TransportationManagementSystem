<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='<spring:url value="/css/style.css"/>' type="text/css"/>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>

<body>

<h1>YRC Transport</h1>

<div>
	<ul>
	
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		<li><a href='<spring:url value="/customer/order"  />'>Book Vehicle</a></li>
		<li><a href='<spring:url value="/customer/myorders?cid=${customerId}"/>' >My Order Details</a></li>
		<li><a href='<spring:url value="/customer/logout"/>'>logout</a> </li>
		
	</ul>
		
<h3 style="color: teal;">${requestScope.message}</h3></div>
		
			<img class="imgstyle" src='<spring:url value="/img/small.jpg"/>' />
		
			<img class="imgstyle" src='<spring:url value="/img/Medium.jpg"/>' />
		
			<img class="imgstyle" src='<spring:url value="/img/big.jpg"/>' />
		
		<div class="container">
  <h2>Vehicles List</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
			<th>Vehicle Id</th>
			<th>Type</th>
			<th> RatePerKm</th>
			<th>LoadCarrying Capacity(Ton)</th>
	
		</tr>
    </thead>
    <tbody>
    <c:forEach var="v" items="${requestScope.VehicleList}">
      <tr>
				<td>${v.vehicleId}</td>
				<td>${v.type}</td>
				<td>${v.ratePerKm}</td>
				<td>${v.loadCarryingCapacity}</td>
				
			</tr>
      </c:forEach>
    </tbody>
  </table>
	</div>
		
</body>
</html>