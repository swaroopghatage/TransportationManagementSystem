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
	
	<link rel="stylesheet" href='<spring:url value="/css/style.css"/>' type="text/css"/>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>YRC Transport</h1>

	<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/admin/dashboard'/>">Admin Dashboard</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/admin/logout"/>'>logout</a> </li>
		
	</ul>
	<div class="container">
		<h2>Fill Vehicle Details</h2>
		<form:form method="post" modelAttribute="admin">
		
			<div class="form-group">
				<label for="Type">Vehicle Type :</label> 
				
							<select id="Type" name="Type">
 							 <option value="SMALL">SMALL</option>
 							 <option value="MEDIUM">MEDIUM</option>
  							<option value="BIG">BIG</option>

						</select>
			</div>
		
			<div class="form-group">
				<label for="ratePerKm">RatePerKm:</label> <input type="number"
					class="form-control" id="ratePerKm" placeholder="Enter RatePerKm"
					name="ratePerKm" required="required">
			</div>
			
			<div class="form-group">
				<label for="LoadCarryingCapacity">LoadCarryingCapacity :</label> <input type="number"
					class="form-control" id="LoadCarryingCapacity" placeholder="LoadCarryingCapacity"
					name="LoadCarryingCapacity">
			</div>
				
			
		
			<button type="submit" class="btn btn-primary">Submit</button>
</form:form>
	</div>
</body>
</html>