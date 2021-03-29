package com.app.pojos;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer oId;
	
	@Column(length = 10)
	@Enumerated(EnumType.STRING)
	private Vehicle type;
	@Column(length = 100)
	private String pickupAddress;
	@Column(length = 100)
	private String deliveryAddress;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	 @NotNull @Future
	private LocalDate pickupDate;
	@Column(length = 12)
	private String mobileNo;

	@Column(length = 10)
	private double distanceInKm;
	
	//order status -accept, reject
	@Enumerated(EnumType.STRING)
	@Column(name = "order_status")
	private Status orderStatus;
	
	//delivery status -shipped ,deliver
	@Enumerated(EnumType.STRING)
	@Column(name = "delivery_status")
	private OrderStatus deliveryStatus;
	
	//payment status due, received
	@Enumerated(EnumType.STRING)
	@Column(name = "payment_status")
	private PaymentStatus paymentStatus;
	
	
	@ManyToOne
	@JoinColumn(name = "c_id")
	private Customer customer;
	
	@OneToOne
	@JoinColumn(name = "driver_id")
	private Driver driver;
	
	private double totalBill;
	
	public Order() {
		System.out.println("in ctor of " + getClass().getName());
	}

	public Order(Integer oId, Vehicle type, String pickupAddress, String deliveryAddress, LocalDate pickupDate,
			String mobileNo, double distanceInKm, Status orderStatus, OrderStatus deliveryStatus,
			PaymentStatus paymentStatus, Customer customer, Driver driver, double totalBill) {
		super();
		this.oId = oId;
		this.type = type;
		this.pickupAddress = pickupAddress;
		this.deliveryAddress = deliveryAddress;
		this.pickupDate = pickupDate;
		this.mobileNo = mobileNo;
		this.distanceInKm = distanceInKm;
		this.orderStatus = orderStatus;
		this.deliveryStatus = deliveryStatus;
		this.paymentStatus = paymentStatus;
		this.customer = customer;
		this.driver = driver;
		this.totalBill = totalBill;
	}


	public Integer getoId() {
		return oId;
	}

	public void setoId(Integer oId) {
		this.oId = oId;
	}

	public Vehicle getType() {
		return type;
	}

	public void setType(Vehicle type) {
		this.type = type;
	}

	public String getPickupAddress() {
		return pickupAddress;
	}

	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public LocalDate getPickupDate() {
		return pickupDate;
	}

	public void setPickupDate(LocalDate pickupDate) {
		this.pickupDate = pickupDate;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public Status getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Status orderStatus) {
		this.orderStatus = orderStatus;
	}

	public OrderStatus getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(OrderStatus deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	
	public double getDistanceInKm() {
		return distanceInKm;
	}

	public void setDistanceInKm(double distanceInKm) {
		this.distanceInKm = distanceInKm;
	}
	
	public double getTotalBill() {
		return totalBill;
	}

	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", Type=" + type + ", pickupAddress=" + pickupAddress + ", deliveryAddress="
				+ deliveryAddress + ", pickupDate=" + pickupDate + ", mobileNo=" + mobileNo + ", distanceInKm="
				+ distanceInKm + ", orderStatus=" + orderStatus + ", deliveryStatus=" + deliveryStatus
				+ ", paymentStatus=" + paymentStatus + ", totalBill=" + totalBill + "]";
	}

		
	

	
}
