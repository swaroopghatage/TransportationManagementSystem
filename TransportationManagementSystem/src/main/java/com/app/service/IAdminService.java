package com.app.service;

import java.util.List;

import javax.validation.Valid;

import com.app.pojos.Admin;
import com.app.pojos.ContactUs;

public interface IAdminService {
	
	//validating Admin Login
	Admin getAdmin(String email, String password);

	//for deleting vehicle
	void deleteVehicleById(Integer vid);

	//for customer review
	ContactUs addNewContact( ContactUs c);
	
	//for getting all reviews
	List<ContactUs> allReviews();
	
}
