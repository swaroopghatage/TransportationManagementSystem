<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dash board</title>
<link rel="stylesheet" href='<spring:url value="/css/style.css"/>' type="text/css"/>
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
		<li><a href="<spring:url value='/customer/dashboard'/>">Customer Dashboard</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/customer/logout"/>'>logout</a> </li>
		
	</ul>
	<h5>${requestScope.message}</h5>


	<div class="container">
  <h2>My Orders Details</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
			<th>Order Id</th>
			<th>Order Status</th>
			<th>Vehicle Type</th>
			<th>Pickup Address</th>
			<th>Delivery Address</th>
			<th>Pickup Date</th>
			<th>Mobile No</th>
			<th>Payment Status</th>
			<th>Invoice/Bill </th>
			<th>Payment </th>
		</tr>
    </thead>
    <tbody>
    <c:forEach var="o" items="${myOrderList}">
      <tr>
				<td>${o.oId}</td>				
				<td>${o.orderStatus}</td>
				<td>${o.type}</td>
				<td>${o.pickupAddress}</td>
				<td>${o.deliveryAddress}</td>
				<td>${o.pickupDate}</td>
				<td>${o.mobileNo}</td>
				<td>${o.paymentStatus}</td>
				<td><a href="<spring:url value='/order/bill?oid=${o.oId}'/>"><button type="button" class="btn btn-primary">Show Bill</button></a></td>			
				<td><a href="<spring:url value='/order/payment?oid=${o.oId}'/>"><button type="button" class="btn btn-primary">Pay Now</button></a></td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
	</div>
		
</body>
</html>