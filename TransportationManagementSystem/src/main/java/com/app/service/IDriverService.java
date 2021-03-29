package com.app.service;

import java.util.List;
import java.util.Optional;

import com.app.pojos.Driver;

public interface IDriverService {
	//for adding new driver
	Driver addNewDriver(Driver d);
	
	//for validating driver (login)
	Driver getDriver(String dEmail, String dPassword);

	//for getting driver by id
	Optional<Driver> getDriverById(Integer did);

	//for getting all drivers
	List<Driver> getDriversList();
	
}
