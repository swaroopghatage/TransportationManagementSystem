package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.custom_excep.MyCustomException;
import com.app.dao.IAdminDao;
import com.app.dao.IContactUsDao;
import com.app.dao.IVehicleDao;
import com.app.pojos.Admin;
import com.app.pojos.ContactUs;

	
@Service
@Transactional
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminDao aDao;
	
	@Autowired
	private IVehicleDao vehicleDao;
	
	@Autowired 
	private IContactUsDao contactDao;
	
	public AdminServiceImpl() {
		System.out.println("in Admin service impl ctor");
	}
	
	@Override
	public Admin getAdmin(String email, String password) {
		return aDao.findByCredn(email, password).orElseThrow(() -> new MyCustomException("Invalid credentials"));
		
	}
	
	@Override
	 public void deleteVehicleById(Integer vid) {
	  System.out.println("vehicle admin serv");
	
	  vehicleDao.deleteById(vid);
	 }

	@Override
	public ContactUs addNewContact(ContactUs c) {
		
		return contactDao.save(c);
	}

	@Override
	public List<ContactUs> allReviews() {
		
		return contactDao.findAll();
	}

}
