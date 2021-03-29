package com.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.pojos.Vehicle;
import com.app.pojos.VehicleInfo;

public interface IVehicleDao extends JpaRepository<VehicleInfo, Integer> {

	@Query("select v from VehicleInfo v where v.Type=:vType")
	VehicleInfo getVehicleInfoByType(Vehicle vType);
	
}
