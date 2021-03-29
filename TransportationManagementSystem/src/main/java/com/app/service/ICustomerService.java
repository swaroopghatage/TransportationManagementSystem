package com.app.service;

import java.util.List;

import com.app.pojos.Customer;
import com.app.pojos.Order;

public interface ICustomerService {

	// register new User;
	Customer addNewCustomer(Customer c);

	// validating user login
	Customer getCustomer(String email, String password);

	//for getting all customers List
	List<Customer> getAllCustomers();

	//for getting all orders by customer id
	List<Order> myOrders(Integer cid);

}
