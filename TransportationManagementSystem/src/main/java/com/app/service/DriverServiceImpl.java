package com.app.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.custom_excep.MyCustomException;
import com.app.dao.IDriverDao;
import com.app.pojos.Driver;
import com.app.pojos.OrderStatus;
import com.app.pojos.Status;

@Service
@Transactional
public class DriverServiceImpl implements IDriverService {

	@Autowired
	private IDriverDao driverDao;

	public DriverServiceImpl() {
		System.out.println("in driver service impl");
	}

	@Override
	public Driver addNewDriver(Driver d) {
		System.out.println(d);
		return driverDao.save(d);
	}

	@Override
	public Driver getDriver(String dEmail, String dPassword) {

		return driverDao.findByCredn(dEmail, dPassword).orElseThrow(() -> new MyCustomException("Invalid credentials"));
	}

	@Override
	public Optional<Driver> getDriverById(Integer did) {

		return driverDao.getDriverById(did);
	}

	@Override
	public List<Driver> getDriversList() {

		return driverDao.findAll();
	}

}
