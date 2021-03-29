<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginPage</title>
<link rel="stylesheet" href='<spring:url value="/css/login.css"/>' type="text/css"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<script type="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>

</head>
<body>
<h1>YRC Transport</h1>
<ul>
		<li><a class="active" href="<spring:url value='/'/>">Home</a></li>
		<li><a href="<spring:url value='/admin/contact'/>">Contact</a></li>
		<li><a href="<spring:url value='/admin/about'/>">About</a></li>
		
		<li><a href='<spring:url value="/customer/logout"/>'>logout</a> </li>
		
	</ul>
	
		<h4 style="color:red">${requestScope.message}</h4>
		<form:form method="post" modelAttribute="customer">
		<div class="row">
    <div class="col-md-6 mx-auto p-0">
        <div class="card">
            <div class="login-box">
                <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label> <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
                    <div class="login-space">
                        <div class="login">
                            <div class="group"> <label for="cEmail" class="label">cEmail</label> <input id="cEmail" type="text" name ="cEmail" class="input" placeholder="Enter your email"> </div>
                            <div class="group"> <label for="cPassword" class="label">cPassword</label> <input id="cPassword" type="password" class="input" data-type="password" name="cPassword" placeholder="Enter your password"> </div>
                            
                            <div class="group"> <input type="submit" class="button" value="Login"> </div>
                            <div class="foot"> <a  href='<spring:url value="/customer/register"/>' >New User Register</a> </div>
                            <div class="hr"></div>
                           
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</form:form>
</body>
</html>