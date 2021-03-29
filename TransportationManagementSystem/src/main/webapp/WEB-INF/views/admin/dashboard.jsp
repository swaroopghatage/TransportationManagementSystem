<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="width=device-width, initial-scale=1">

<title>Admin Dash board</title>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
function openLink(evt, animName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(animName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}
</script>
<style>
body {
  background-image: url("images/demo/backgrounds/adm.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
imgAdm{
	width: 100%;height: 100%;float: left;
}
</style>
</head>
<body>
<h1>YRC Transport </h1>
<h1></h1>
<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/admin/reviews'/>">Reviews</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/admin/logout"/>'>logout</a> </li>
	</ul>
	
<!-- <div class="bgded overlay" style="background-image:url('images/demo/backgrounds/adm.jpg');">  -->
<div class="w3-sidebar w3-bar-block w3-black w3-card" style="width:130px">
  <h5 class="w3-bar-item">Menu</h5>
  <button class="w3-bar-item w3-button tablink" onclick="location.href='<spring:url value="/admin/ordersList" />' ">Show Orders List</button>
  <button class="w3-bar-item w3-button tablink" onclick="location.href='<spring:url value="/order/action" />' ">Order Actions</button>
  <button class="w3-bar-item w3-button tablink" onclick="location.href='<spring:url value="/admin/registerVehicle" />' ">Register New Vehicle</button>
  <button class="w3-bar-item w3-button tablink" onclick="location.href='<spring:url value="/admin/VehicleDetails" />' ">Show Vehicle Details</button>
  <button class="w3-bar-item w3-button tablink" onclick="location.href='<spring:url value="/email/send_mail" />' ">Send Email</button>
</div>

<img class="imgAdm"  src='<spring:url value="/img/adm.jpg"/>' />
<%-- <h3 style="color: teal;">${requestScope.message}</h3> --%>

	</div>
</body>
</html>