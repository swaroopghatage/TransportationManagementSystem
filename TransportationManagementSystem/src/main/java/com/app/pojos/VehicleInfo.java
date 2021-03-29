package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vehicle_info")
public class VehicleInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer vehicleId;

	@Column(length = 10)
	@Enumerated(EnumType.STRING)
	private Vehicle Type;
	@Column(length = 10)
	private double ratePerKm;
	@Column(length = 10)
	private double loadCarryingCapacity;
	
	
	public VehicleInfo() {
		System.out.println("in vehicleInfo");
	}


	public VehicleInfo(Integer vehicleId, Vehicle type, double ratePerKm, double loadCarryingCapacity) {
		super();
		this.vehicleId = vehicleId;
		Type = type;
		this.ratePerKm = ratePerKm;
		this.loadCarryingCapacity = loadCarryingCapacity;
	}


	public Integer getVehicleId() {
		return vehicleId;
	}


	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}


	public Vehicle getType() {
		return Type;
	}


	public void setType(Vehicle type) {
		Type = type;
	}


	public double getRatePerKm() {
		return ratePerKm;
	}


	public void setRatePerKm(double ratePerKm) {
		this.ratePerKm = ratePerKm;
	}


	public double getLoadCarryingCapacity() {
		return loadCarryingCapacity;
	}


	public void setLoadCarryingCapacity(double loadCarryingCapacity) {
		this.loadCarryingCapacity = loadCarryingCapacity;
	}


	@Override
	public String toString() {
		return "VehicleInfo [vehicleId=" + vehicleId + ", Type=" + Type + ", ratePerKm=" + ratePerKm
				+ ", loadCarryingCapacity=" + loadCarryingCapacity + "]";
	}




}
