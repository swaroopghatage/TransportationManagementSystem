package com.app.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.pojos.Customer;
import com.app.pojos.Order;

public interface ICustomerDao extends JpaRepository<Customer, Integer> {

	// find by email and password
	@Query("select c from Customer c where c_email=:email and c_password=:password")
	Optional<Customer> findByCredn(String email, String password);

	// find Order by Customer id
	@Query("select c from Order c where c_id=:cid")
	Optional<Order> findByCid(Integer cid);

	// find all orders by customer id
	@Query("select c from Order c where c_id=:cid")
	List<Order> findAllByCid(Integer cid);

}
