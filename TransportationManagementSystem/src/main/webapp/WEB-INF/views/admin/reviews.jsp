<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicles Details</title>
	<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>YRC Transport</h1>

	<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<%-- <li><a href="<spring:url value='/admin/contact'/>">Contact</a></li> --%>
		<li><a href="<spring:url value='/admin/dashboard'/>">Admin Dashboard</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/admin/logout"/>'>logout</a> </li>
		
	</ul>
	<h5>${requestScope.message}</h5>

	
		<div class="container">
  <h2>Customer Reviews</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
			<th>User Id</th>
			<th>Name</th>
			<th>Email</th>
			<th> Mobile No.</th>
			<th>Message</th>
			
		</tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${requestScope.allReviews}">
      <tr>
				<td>${r.uId}</td>
				<td>${r.uName}</td>
				<td>${r.uEmail}</td>
				<td>${r.uMobile}</td>
				<td>${r.message}</td>
				
			</tr>
      </c:forEach>
    </tbody>
  </table>
	</div>
</body>
</html>