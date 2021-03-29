<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}
.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}
</style>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
</head>

<body>
<h1>YRC Transport</h1>
<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		
			
	</ul>
<div class="about-section">
  <h1>About Us Page</h1>
  <p> Over the years, YRC has pioneered in providing a safe and reliable delivery network in the field of parcel
   service. It has spread its operations to Courier Service, Priority Cargo & Transport of Passengers by Air to meet the growing demands of its burgeoning customer base..</p>
 
  <p>YRC Freight is the leading transporter of industrial, commercial, and retail goods, specializing in solutions for businesses across India through a full-service network, advanced information technologies, and proactive customer service</p>
</div>


</body>
</html>