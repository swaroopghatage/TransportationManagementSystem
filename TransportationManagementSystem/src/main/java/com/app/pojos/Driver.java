 package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
@Entity
@Table(name = "drivers")
public class Driver {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer driverId;
	@Column(length = 20)
	@NotBlank(message = "Name is mandatory")
	private String dName;
	@NotBlank(message = "Email is mandatory")
	private String dEmail;
	@Column(length = 20)
	@NotNull
	private String dPassword;
	@Column(length = 20)
	private String  vehicleNumber;
	
	//one driver has one order
	@OneToOne(mappedBy = "driver",fetch = FetchType.EAGER)
	private Order  order;

	public Driver() {
	System.out.println("in driver class");
	}

	public Driver(Integer driverId, String dName, String dEmail, String dPassword, String vehicleNumber, Order order) {
		super();
		this.driverId = driverId;
		this.dName = dName;
		this.dEmail = dEmail;
		this.dPassword = dPassword;
		this.vehicleNumber = vehicleNumber;
		this.order = order;
	}

	public Integer getDriverId() {
		return driverId;
	}

	public void setDriverId(Integer driverId) {
		this.driverId = driverId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getdEmail() {
		return dEmail;
	}

	public void setdEmail(String dEmail) {
		this.dEmail = dEmail;
	}

	public String getdPassword() {
		return dPassword;
	}

	public void setdPassword(String dPassword) {
		this.dPassword = dPassword;
	}

	public String getVehicleNumber() {
		return vehicleNumber;
	}

	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Driver [driverId=" + driverId + ", dName=" + dName + ", dEmail=" + dEmail + ", dPassword=" + dPassword
				+ ", vehicleNumber=" + vehicleNumber + ", order=" + order + "]";
	}

	
	
	
	

}
