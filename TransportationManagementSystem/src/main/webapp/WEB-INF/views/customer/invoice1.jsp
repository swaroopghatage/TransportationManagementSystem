<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href='<spring:url value="/css/style.css"/>' type="text/css"/>
<link rel="stylesheet" href='<spring:url value="/css/header.css"/>' type="text/css"/>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Invoice</h2><h3 class="pull-right">${sessionScope.myBill.oId}</h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					${sessionScope.myBill.customer.cName}<br>
    					${sessionScope.myBill.customer.cEmail}<br>
  
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    				<strong>From :</strong>
    				${sessionScope.myBill.pickupAddress}<br>
        			<strong>Shipped To:</strong><br>
    					${sessionScope.myBill.deliveryAddress}<br>
    					
    				
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    					Online<br>
    					
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					${sessionScope.myBill.pickupDate}<br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Vehicle Type</strong></td>
        							<td class="text-center"><strong>Rate per Km</strong></td>
        							<td class="text-center"><strong>Distance</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td>${sessionScope.myBill.type}</td>
    								<td class="text-center">${sessionScope.ratePerKm}</td>
    								<td class="text-center">${sessionScope.myBill.distanceInKm}</td>
    								<td class="text-right">${sessionScope.myBill.totalBill}</td>
    							</tr>
                                
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal</strong></td>
    								<td class="thick-line text-right">${sessionScope.myBill.totalBill}</td>
    							</tr>
    							<!-- <tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping</strong></td>
    								<td class="no-line text-right">$15</td>
    							</tr> -->
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right">${sessionScope.myBill.totalBill}</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<div align="center">
<a href="<spring:url value='/order/exportpdf'/>"><button type="button" class="btn btn-primary">Print</button></a>
</div>
</body>
</html>