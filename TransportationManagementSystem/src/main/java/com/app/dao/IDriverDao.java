package com.app.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.pojos.Customer;
import com.app.pojos.Driver;
import com.app.pojos.OrderStatus;
import com.app.pojos.Status;

public interface IDriverDao extends JpaRepository<Driver, Integer>{


	//for driver login
	@Query("select d from Driver d where d_email=:dEmail and d_password=:dPassword")
	Optional<Driver> findByCredn(String dEmail, String dPassword);
	
	//for getting driver by id
	@Query("select d from Driver d where driver_id=:did")
	Optional<Driver> getDriverById(Integer did);
	
	
	
	
	
	
	
	
	
}
