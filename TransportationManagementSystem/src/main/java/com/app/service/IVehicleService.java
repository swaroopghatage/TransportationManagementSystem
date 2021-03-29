package com.app.service;

import java.util.List;

import com.app.pojos.Vehicle;
import com.app.pojos.VehicleInfo;

public interface IVehicleService {

	
	//add new vehicle
	VehicleInfo addNewVehicle(VehicleInfo v);

	//get all vehicle
	List<VehicleInfo> getVehicleList();
	
	//get all vehicle info by type
	VehicleInfo getVehicleInfoByType(Vehicle vType);
}
