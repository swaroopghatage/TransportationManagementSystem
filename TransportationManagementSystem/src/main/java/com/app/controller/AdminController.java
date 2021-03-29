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

import com.app.pojos.Admin;
import com.app.pojos.ContactUs;
import com.app.pojos.VehicleInfo;
import com.app.service.IAdminService;
import com.app.service.IOrderService;
import com.app.service.IVehicleService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private IAdminService adminService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IVehicleService VehicleService;
// @Autowired 
// private IDriverService driverService;
	
	public AdminController() {
		System.out.println("in ctor of" + getClass().getName());
	}

	// redirect to login page
	@GetMapping("/login")
	public String showLoginPage() {
		System.out.println("show login page");
		return "/admin/login";
	}

	// validation and redirecting to page
	@PostMapping("/login")
	public String processLoginForm(@RequestParam String aEmail, @RequestParam String password, Model map,
			RedirectAttributes flashMap, HttpSession session) {
		try {
			Admin a = adminService.getAdmin(aEmail, password);
			System.out.println(a);
			// session.setAttribute("admin_details", a);
			// saving all orders list in orderList Model
			map.addAttribute("orderList", orderService.getOrderList());
			flashMap.addAttribute("message", "Welcome " + a.getaName());
			return "/admin/dashboard";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "wrong credentials");
			return "/admin/login";
		}
	}

	// for accepting Order
	@GetMapping("/accept")
	public String acceptOrder(@RequestParam Integer oid, RedirectAttributes flashMap) {
		System.out.println("oid = " + oid);
		flashMap.addFlashAttribute("message", orderService.acceptOrder(oid));
		return "redirect:/admin/ordersList";
	}

	// for rejecting order
	@GetMapping("/reject")
	public String rejectOrder(@RequestParam Integer oid, RedirectAttributes flashMap) {
		System.out.println("oid = " + oid);
		flashMap.addFlashAttribute("message", orderService.rejectOrder(oid));
		return "redirect:/admin/ordersList";
	}

	// for changing payment status
	@GetMapping("/paymentDue")
	public String paymentDue(@RequestParam Integer oid, RedirectAttributes flashMap) {
		System.out.println("oid = " + oid);
		flashMap.addFlashAttribute("message", orderService.paymentDue(oid));
		return "redirect:/admin/ordersList";
	}

	@GetMapping("/paymentReceived")
	public String paymentReceived(@RequestParam Integer oid, RedirectAttributes flashMap) {
		System.out.println("oid = " + oid);
		flashMap.addFlashAttribute("message", orderService.paymentReceived(oid));
		return "redirect:/admin/ordersList";
	}

	// for refreshing dashboard page
	@GetMapping("/dashboard")
	public String showAdminDashboard(Model map) {
		map.addAttribute("orderList", orderService.getOrderList());
		return "/admin/dashboard";
	}

	// for logout
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request, RedirectAttributes flashMap) {
		HttpSession httpSession = request.getSession();
		flashMap.addFlashAttribute("message", "You have logged out successfully ");
		httpSession.invalidate();
		return "redirect:/";
	}

	// for redirecting to register vehicle
	@GetMapping("/registerVehicle")
	public String ShowVehicleRegPage(VehicleInfo v) {
		System.out.println("in show vehicle reg page method");
		return "/admin/registerVehicle";
	}

	// for registring vehicle
	@PostMapping("/registerVehicle")
	public String processVehicleRegistration(@Valid VehicleInfo v, BindingResult result, Model map,
			RedirectAttributes flashMap) {
		if (result.hasErrors()) {
			map.addAttribute("message", "vehicle registration failed");
			return "/admin/registerVehicle";
		}
		try {
			System.out.println(VehicleService.addNewVehicle(v));
			flashMap.addFlashAttribute("message", "Registered successfully");
			map.addAttribute("VehicleList", VehicleService.getVehicleList());
			return "redirect:/admin/dashboard";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "registration failed : some validation failed");
			return "/admin/dashboard";
		}
	}

	// for showing vehicle details
	@GetMapping("/VehicleDetails")
	public String showvehicleDetails(Model map) {
		map.addAttribute("VehicleList", VehicleService.getVehicleList());
		return "/admin/VehicleDetails";
	}

	// for deleting particular vehicle
	@GetMapping("/vdelete")
	public String deleteVehicleById(@RequestParam Integer vid) {
		System.out.println("in delete method oid " + vid);
		adminService.deleteVehicleById(vid);
		return "redirect:/admin/VehicleDetails";
	}

	// for showing all orders list
	@GetMapping("/ordersList")
	public String showOrdersLists(Model map) {
		map.addAttribute("orderList", orderService.getOrderList());
		return "/admin/ordersList";
	}

	// redirecting to contact page
	@GetMapping("/contact")
	public String showContactPage() {
		System.out.println("show contact page");
		return "/admin/contact";
	}

	// for adding new review
	@PostMapping("/contact")
	public String processContactUs(@Valid ContactUs c, BindingResult result, Model map, RedirectAttributes flashMap,
			HttpSession session) {
		if (result.hasErrors()) {
			map.addAttribute("message", "User request failed");
			return "/admin/contact";
		}
		try {

			System.out.println(adminService.addNewContact(c));

			flashMap.addFlashAttribute("message", "Details successfully submitted");
			return "redirect:/";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "submission failed : some validation failed");
			return "/admin/contact";
		}

	}

	// to get all reviews
	@GetMapping("/reviews")
	public String allReviews(Model map) {
		map.addAttribute("allReviews", adminService.allReviews());
		return "/admin/reviews";
	}

	// to show about us page
	@GetMapping("/about")
	public String showAboutPage() {
		System.out.println("show abt page");
		return "/admin/about";
	}

}
