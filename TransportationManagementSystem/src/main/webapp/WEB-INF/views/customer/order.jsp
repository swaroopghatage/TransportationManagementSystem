<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>place order</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>YRC Transport</h1>

	<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/customer/dashboard'/>">Customer Dashboard</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/customer/logout"/>'>logout</a> </li>
		
	</ul>
	<div class="container">
		<h2>Fill Order Details</h2>
		
		<form:form method="post" modelAttribute="customer">
		<div class="form-group">
				<label for="type">Vehicle Type :</label> 
				
							<select id="type" name="type">
 							 <option value="SMALL">SMALL</option>
 							 <option value="MEDIUM">MEDIUM</option>
  							<option value="BIG">BIG</option>

						</select>
			</div>
		
			<div class="form-group">
				<label for="pickupAddress">Pickup Address :</label> <input type="text"
					class="form-control" id="pickupAddress" placeholder="Enter pickupAddress"
					name="pickupAddress" required="required">
			</div>
			<div class="form-group">
				<label for="deliveryAddress">Delivery Address :</label> <input type="text"
					class="form-control" id="deliveryAddress" placeholder="Enter deliveryAddress"
					name="deliveryAddress" required="required">
			</div>
			<div class="form-group">
				<label for="pickupDate">Pickup Date :</label> <input type="date"
					class="form-control" id="pickupDate" placeholder="pickupDate"
					name="pickupDate">
			</div>
			<div class="form-group">
				<label for="mobileNo">Mobile No :</label> <input type="number"
					class="form-control" id="mobileNo" placeholder="mobileNo"
					name="mobileNo">
			</div>
			<div class="form-group">
				<label for="distanceInKm">Distance In KM:</label> <input type="number"
					class="form-control" id="distanceInKm" placeholder="distanceInKm"
					name="distanceInKm" >
			</div>
	
			
			<div class="form-group form-check">
				<label class="form-check-label"> <input
					class="form-check-input" type="checkbox" name="remember">
					Remember me
				</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
</form:form>
	</div>
</body>
</html>