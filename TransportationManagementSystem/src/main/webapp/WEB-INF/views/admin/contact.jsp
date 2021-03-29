<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>YRC Transport</h1>

	<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
	</ul>
	<div class="container">
		<h2>Fill Your Details</h2>
		
		<form:form method="post"  >
		
		
			<div class="form-group">
				<label for="uName">Name :</label> <input type="text"
					class="form-control" id="uName" placeholder="Enter Name"
					name="uName" required="required">
			</div>
			<div class="form-group">
				<label for="uEmail">Email :</label> <input type="text"
					class="form-control" id="uEmail" placeholder="Enter Email"
					name="uEmail" required="required">
			</div>
			<div class="form-group">
				<label for="uMobile">Mobile No :</label> <input type="number"
					class="form-control" id="uMobile" placeholder="mobileNo"
					name="uMobile">
			</div>
			<div class="form-group">
				<label for="message">Message :</label> <input type="text"
					class="form-control" id="message" placeholder="Message"
					name="message">
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
</form:form>
	</div>
</body>
</html>