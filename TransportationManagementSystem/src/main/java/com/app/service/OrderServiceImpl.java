package com.app.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.IDriverDao;
import com.app.dao.IOrderDao;
import com.app.pojos.Driver;
import com.app.pojos.Order;
import com.app.pojos.OrderStatus;
import com.app.pojos.PaymentStatus;
import com.app.pojos.Status;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private IOrderDao orderDao;
	@Autowired
	private IDriverDao driverDao;
	
	@Override
	public Order addNewOrder(Order o) {
	
		return orderDao.save(o);
	}

	@Override
	public String updateOrder(int orderId, int drvrId) {
		// get order detail from oid
		Order order = orderDao.findById(orderId).orElseThrow(() -> new RuntimeException("invalid order id"));
		// get driver details from driver id and link it
		Driver driver=driverDao.findById(drvrId).orElseThrow(() -> new RuntimeException("invalid drvr id"));
		order.setDriver(driver);
		driver.setOrder(order);
		order.setOrderStatus(Status.ACCEPTED);
		return "Order updated with driver details";
	}	

	@Override
	public Optional<Order> getOrderById(int id) {

		return orderDao.findById(id);
	}

	@Override
	public List<Order> getOrderList() {

		return orderDao.findAll();
	}

	@Override
	public String acceptOrder(Integer oid) {
		int order = orderDao.acceptOrder(Status.ACCEPTED, oid);
		return "accepted order " + order;
	}

	@Override
	public String rejectOrder(Integer oid) {
		int order = orderDao.rejectOrder(Status.REJECTED, oid);
		return "rejected order " + order;
	}

	@Override
	public void deleteOrderById(Integer oid) {
		System.out.println("ordr serv");
		orderDao.deleteById(oid);
	}

	@Override
	public String shippedOrder(Integer did) {
		orderDao.shippedOrder(OrderStatus.SHIPPED_IN_TRANSIT, did);
		return "Order shipped!!!!";
	}

	@Override
	public String deliveredOrder(Integer did) {
		orderDao.deliveredOrder(OrderStatus.DELIVERED, did);
		return "Order delivered !!";
	}

	@Override
	public Optional<Order> getOrderByDriverId(int did) {

		return orderDao.getOrderByDriverId(did);
	}

	@Override
	public String paymentDue(Integer oid) {
		orderDao.paymentDue(PaymentStatus.DUE, oid);
		return "Payment Due";
	}

	@Override
	public String paymentReceived(Integer oid) {
		orderDao.paymentReceived(PaymentStatus.RECEIVED, oid);
		return "Payment Received";
	}

	

}
