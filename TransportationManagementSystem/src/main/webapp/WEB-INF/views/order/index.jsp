<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<link rel="stylesheet" href='<spring:url value="/css/style.css"/>' type="text/css"/>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
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
  <h2>Order Actions</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
								<th>Order ID</th>		
								<th>Customer Id</th>				
								<th>Pickup Address</th>
									<th>Delivery Address</th>				
								<th>Assign Driver</th>
								
		</tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${requestScope.orderList }">
      <tr>								
								<td>${order.oId}</td>
								<td>${order.customer.cId}</td>
								<td>${order.pickupAddress}</td>
								<td>${order.deliveryAddress}</td>
								<td><a
									href='<spring:url value="/order/edit?oid=${order.oId}"/>'><button type="button" class="btn btn-primary">Assign Driver</button></a></td>

								<%-- <td><a
									href="<spring:url value='/order/delete?oid=${order.oId}'/>"><button type="button" class="btn btn-danger">Delete</button></a></td> --%>
							</tr>
		</c:forEach>
    </tbody>
  </table>
	</div>
</body>
</html>