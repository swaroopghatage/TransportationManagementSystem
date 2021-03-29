package com.app.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import com.app.pojos.Order;

public interface IOrderService {

	// order register
	Order addNewOrder(Order o);

	// update order to assign driver id
	String updateOrder(int orderId, int drvrId);

	//get order by id
	Optional<Order> getOrderById(int id);

	//get all orders
	List<Order> getOrderList();

	//for accepting or rejecting order
	String acceptOrder(Integer oid);

	String rejectOrder(Integer oid);
	
	//for payment status
	String paymentDue(Integer oid);
	
	String paymentReceived(Integer oid);

	//for deleting oders by id
	void deleteOrderById(Integer oid);

	//get order by driver id
	Optional<Order> getOrderByDriverId(int did);

	//delivery status
	String shippedOrder(Integer did);

	String deliveredOrder(Integer did);

}
