<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>'
	type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>YRC Transport</h1>
	<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/admin/dashboard'/>">Admin
				Dashboard</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>

		<li><a href='<spring:url value="/admin/logout"/>'>logout</a></li>
	</ul>

	<div class="container">
		<h2>Drivers List</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Driver Id</th>
					<th>Driver Name</th>
					<th>Vehicle Number</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="d" items="${requestScope.driverList}">
					<tr>
						<td>${d.driverId}</td>
						<td>${d.dName}</td>
						<td>${d.vehicleNumber}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="container">
		<h2>Orders assigned to the drivers</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Order Id</th>

					<th>Driver Id</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${requestScope.allOrders }">
					<tr>
						<td>${o.oId}</td>
						<td>${o.driver.driverId}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div align="center">
		<h1>Assign Driver</h1>
		<br />
		<div class="col-sm-4">

			<form action="/spring-mvc-boot/order/save" method="post"
				modelAttribute="order">

				<div alight="left">
					<tr>
						<label class="form-label">Order ID</label>
						<td><input type="number" name="oId" id="oId"
							value="${requestScope.orderList.oId}" readonly="readonly"
							class="form-control" placeholder="Order ID" /></td>
					</tr>
				</div>

				<div alight="left">
					<tr>
						<label class="form-label">Driver Id</label>
						<td><input type="number" name="driverId" id="driverId"
							class="form-control" placeholder="Driver Id" /></td>
					</tr>
				</div>
				<br>
				<tr>
					<td colspan="2"><button type="submit" class="btn btn-info">Save</button>
					</td>
				</tr>
		</div>

		</form>
	</div>
</body>
</html>