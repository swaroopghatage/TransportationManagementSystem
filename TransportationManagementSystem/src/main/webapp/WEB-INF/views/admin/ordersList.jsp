<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="width=device-width, initial-scale=1">
<title>Dash board</title>
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
		<li><a href="<spring:url value='/admin/dashboard'/>">Admin Dashboard</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/admin/logout"/>'>logout</a> </li>
	</ul>
	<h5>${requestScope.message}</h5>

	
	<div class="container">
  <h2>Orders List</h2>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>Order Id</th>
			<th>Order Status</th>
			<th>Payment Status</th>
			<th>Mobile No</th>
			<th>Accept</th>
			<th>Reject</th>
			<th>Payment Due</th>
			<th>Payment Received</th>
			<th>Bill Generation</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="o" items="${requestScope.orderList }">
      <tr>
        <td>${o.oId}</td>
				<td>${o.orderStatus}</td>
				<td>${o.paymentStatus}</td>
				<td>${o.mobileNo}</td>

				<td><a href='<spring:url value="/admin/accept?oid=${o.oId}"/>'><button type="button" class="btn btn-success">Accept</button></a></td>
				
				<td><a href="<spring:url value='/admin/reject?oid=${o.oId}'/>"><button type="button" class="btn btn-danger">Reject</button></a></td> 
				
				<td><a href="<spring:url value='/admin/paymentDue?oid=${o.oId}'/>"><button type="button" class="btn btn-outline-warning">Due</button></a></td>
				
				<td><a href="<spring:url value='/admin/paymentReceived?oid=${o.oId}'/>"><button type="button" class="btn btn-outline-success">Received</button></a></td> 
				
				<td><a href="<spring:url value='/order/bill?oid=${o.oId}'/>"><button type="button" class="btn btn-primary">Generate Bill</button></a></td> 
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
	
</body>
</html>