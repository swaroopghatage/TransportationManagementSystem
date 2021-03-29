package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.IVehicleDao;
import com.app.pojos.Order;
import com.app.pojos.Vehicle;
import com.app.pojos.VehicleInfo;


@Service
@Transactional
public class VehicleServiceImpl implements IVehicleService {

	@Autowired
	private IVehicleDao dao;
	
	
	public VehicleServiceImpl() {
		System.out.println("in vehicle service IMPL");
	}
	
	@Override
	public VehicleInfo addNewVehicle(VehicleInfo v) {
		System.out.println("adding new vehicle ");
	return dao.save(v);
	}
	
	@Override
	public List<VehicleInfo> getVehicleList() {
		
		return dao.findAll();
	}

	@Override
	public VehicleInfo getVehicleInfoByType(Vehicle vType) {
		
		return dao.getVehicleInfoByType(vType);
	}

}
