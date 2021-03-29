package com.app.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.pojos.Order;
import com.app.pojos.OrderStatus;
import com.app.pojos.PaymentStatus;
import com.app.pojos.Status;

public interface IOrderDao extends JpaRepository<Order, Integer> {
	//updating orderStatus
	@Modifying
	@Query("update Order o set o.orderStatus=:sts  where o.oId=:oid")
	int acceptOrder(@Param("sts") Status sts,@Param("oid") int oid);
	
	@Modifying
	@Query("update Order o set o.orderStatus=:sts  where o.oId=:oid")
	int rejectOrder(@Param("sts") Status sts,@Param("oid") int oid);
	
	//updating paymentStatus
	@Modifying
	@Query("update Order o set o.paymentStatus=:sts  where o.oId=:oid")
	int paymentDue(@Param("sts") PaymentStatus sts,@Param("oid") int oid);
	
	
	@Modifying
	@Query("update Order o set o.paymentStatus=:sts  where o.oId=:oid")
	int paymentReceived(@Param("sts") PaymentStatus sts,@Param("oid") int oid);
	
	//getting order by  driver id
	@Query(value = "select * from orders  where driverId=:did", nativeQuery = true)
	Optional<Order> getOrderByDriverId(int did);
	
	//updating deliveryStatus
	@Modifying
	@Query("update Order o set o.deliveryStatus=:sts where o.driver.driverId=:did")
	int shippedOrder(@Param("sts") OrderStatus sts,@Param("did") int did);
	

	@Modifying
	@Query("update Order o set o.deliveryStatus=:sts where o.driver.driverId=:did")
	int deliveredOrder(@Param("sts") OrderStatus sts,@Param("did") int did);
	
}
