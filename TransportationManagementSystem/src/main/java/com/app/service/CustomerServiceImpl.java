package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.custom_excep.MyCustomException;
import com.app.dao.ICustomerDao;
import com.app.pojos.Customer;
import com.app.pojos.Order;

@Service
@Transactional
public class CustomerServiceImpl implements ICustomerService {
	@Autowired
	private ICustomerDao dao;

	public CustomerServiceImpl() {
		System.out.println("in customer service impl ctor");
	}

	@Override
	public Customer addNewCustomer(Customer c) {
		System.out.println("adding new customer");
		return dao.save(c);
	}

	@Override
	public Customer getCustomer(String cemail, String cpassword) {
		return dao.findByCredn(cemail, cpassword).orElseThrow(() -> new MyCustomException("Invalid credentials"));
	}

	@Override
	public List<Customer> getAllCustomers() {
		return dao.findAll();
	}

	@Override
	public List<Order> myOrders(Integer cid) {

		return dao.findAllByCid(cid);
	}

}
