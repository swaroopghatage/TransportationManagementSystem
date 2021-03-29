package com.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojos.Customer;
import com.app.pojos.Order;
import com.app.pojos.OrderStatus;
import com.app.pojos.PaymentStatus;
import com.app.pojos.Status;
import com.app.pojos.Vehicle;
import com.app.service.ICustomerService;
import com.app.service.IOrderService;
import com.app.service.IVehicleService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private ICustomerService custService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IVehicleService vehicleService;

	public CustomerController() {
		System.out.println("in ctor of" + getClass().getName());
	}

	@GetMapping("/register")
	public String showRegPage(Customer c) {
		System.out.println("in show reg page method");
		return "/customer/register";
	}

	@PostMapping("/register")
	public String processRegistration(@Valid Customer c, BindingResult result, Model map, RedirectAttributes flashMap) {
		if (result.hasErrors()) {
			map.addAttribute("message", "Customer registration failed");
			return "/customer/register";
		}
		try {
			System.out.println(custService.addNewCustomer(c));
			flashMap.addFlashAttribute("message", "Registered successfully");
			return "redirect:/";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "registration failed : some validation failed");
			return "/customer/register";
		}

	}

	@GetMapping("/login")
	public String showLoginPage() {
		System.out.println("show login page");
		return "/customer/login";
	}

	@PostMapping("/login")
	public String processLogin(@RequestParam String cEmail, @RequestParam String cPassword, Model map,
			RedirectAttributes flashMap, HttpSession session) {
		System.out.println("in process login");
		try {
			Customer c = custService.getCustomer(cEmail, cPassword);
			System.out.println(c);

			flashMap.addFlashAttribute("message", "Welcome " + c.getcName());

			session.setAttribute("customer", c);
			map.addAttribute("VehicleList", vehicleService.getVehicleList());

			map.addAttribute("customerId", c.getcId());

			return "redirect:/customer/dashboard";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "wrong credentials");
			return "/customer/login";
		}
	}

	@GetMapping("/order")
	public String showOrderPage() {
		System.out.println("show Order page");
		return "/customer/order";
	}

	@PostMapping("/order")
	public String processOrder(@Valid Order o, BindingResult result, Model map, RedirectAttributes flashMap,
			HttpSession session) {
		if (result.hasErrors()) {
			map.addAttribute("message", "Customer registration failed");
			return "/customer/order";
		}
		try {
			// retriveing customer from session and initializing the Customer c
			Customer c = (Customer) session.getAttribute("customer");
			System.out.println("c");

			// setting customer in order
			o.setCustomer(c);

			// setting order status ,delivery status and payment status at beginning
			o.setOrderStatus(Status.PENDING);
			o.setDeliveryStatus(OrderStatus.INPROGRESS);
			o.setPaymentStatus(PaymentStatus.DUE);

			
			//getting distance from order object and for invoice calculation
			double distance = o.getDistanceInKm();
			//checking type of vehicle
			if (o.getType().equals(Vehicle.SMALL)) {
				//getting rate from vehicle info table and distance from order table for bill calculation
				double totalBill = distance * vehicleService.getVehicleInfoByType(Vehicle.SMALL).getRatePerKm();
				o.setTotalBill(totalBill);
			} else if (o.getType().equals(Vehicle.MEDIUM)) {
				double totalBill = distance * vehicleService.getVehicleInfoByType(Vehicle.MEDIUM).getRatePerKm();
				o.setTotalBill(totalBill);
			} else {
				double totalBill = distance * vehicleService.getVehicleInfoByType(Vehicle.BIG).getRatePerKm();
				o.setTotalBill(totalBill);
			}
			System.out.println(orderService.addNewOrder(o));

			map.addAttribute("customerId", c.getcId());
			flashMap.addFlashAttribute("message", "Order successfully registered");
			return "redirect:/customer/dashboard";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "registration failed : some validation failed");
			return "/customer/order";
		}

	}

	//redirecting to myorders
	@GetMapping("/myorders")
	public String myOrders(@RequestParam Integer cid, Model map) {
		System.out.println("cid = " + cid);

		map.addAttribute("myOrderList", custService.myOrders(cid));
		return "/customer/myOrders";
	}

	//for logout
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request, RedirectAttributes flashMap) {
		HttpSession httpSession = request.getSession();
		flashMap.addFlashAttribute("message", "You have logged out successfully ");
		httpSession.invalidate();
		return "redirect:/";
	}

	//for refreshing page
	@GetMapping("/dashboard")
	public String showCustDashboard(Model map, HttpSession session) {
		map.addAttribute("VehicleList", vehicleService.getVehicleList());
		Customer c = (Customer) session.getAttribute("customer");
		map.addAttribute("customerId", c.getcId());
		return "/customer/dashboard";
	}

}
