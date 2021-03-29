<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dash board</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/driver/logout"/>'>logout</a> </li>
	</ul>
	
	<h3 style="color: teal;">${requestScope.message}</h3>
	
<div class="container">
  <h2>Orders List</h2>
  <table class="table">
    <thead class="thead-dark">
       <tr>
   	  <th scope="col">Sr. No</th>
      <th scope="col">Order Id</th>
      <th scope="col">Driver Id</th>
      <th scope="col">Order Status</th>
      <th scope="col">Delivery Status</th>
      <th scope="col">Shipped</th>
      <th scope="col">Delivered</th>
    </tr>
    </thead>
    <tbody>
      <tr>
      <th scope="row">1</th>
      <td>${sessionScope.driver.order.oId}</td>
      <td>${sessionScope.driver.driverId}</td>
      <td>${sessionScope.driver.order.orderStatus}</td>
      <td>${sessionScope.driver.order.deliveryStatus}</td>
      <td><a href='<spring:url value="/driver/shipped?did=${sessionScope.driver.driverId}"/>'><button type="button" class="btn btn-primary">Shipped</button></a></td>
      <td><a href='<spring:url value="/driver/delivered?did=${sessionScope.driver.driverId}"/>'><button type="button" class="btn btn-success">Delivered</button></a></td>
    </tr>     
    </tbody>
  </table>
  </div>
	
</body>
</html>