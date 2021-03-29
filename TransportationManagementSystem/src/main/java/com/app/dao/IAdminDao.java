package com.app.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.pojos.Admin;

public interface IAdminDao extends JpaRepository<Admin,Integer > {
	
	//for login
	@Query("select a from Admin a where a.aEmail=:email and a.password=:password")
	Optional<Admin>  findByCredn(String email, String password);

	//for deleting vehicle
	@Query(value = "DELETE FROM vehicle_info WHERE vehicleId=vid", nativeQuery = true)
	void deleteVehicleById(Integer vid); 
	
}
