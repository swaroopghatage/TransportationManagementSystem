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

import com.app.pojos.Driver;
import com.app.service.IDriverService;
import com.app.service.IOrderService;

@Controller
@RequestMapping("/driver")
public class DriverController {

	@Autowired
	private IDriverService driverService;

	@Autowired
	private IOrderService ordService;

	@GetMapping("/login")
	public String showLoginPage() {
		System.out.println("driver login page");
		return "/driver/login";
	}

	
	@GetMapping("/register")
	public String showRegPage(Driver d) {
		System.out.println("in show driver reg page method");
		return "/driver/register";
	}

	@PostMapping("/register")
	public String processRegistration(@Valid Driver d, BindingResult result, Model map, RedirectAttributes flashMap) {
		if (result.hasErrors()) {
			map.addAttribute("message", "Driver registration failed");
			return "/driver/register";
		}
		try {
			System.out.println(driverService.addNewDriver(d));
			flashMap.addFlashAttribute("message", "Registered successfully");
			return "redirect:/";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "registration failed : some validation failed");
			return "/driver/register";
		}
	}

	@PostMapping("/login")
	public String processLogin(@RequestParam String dEmail, @RequestParam String dPassword, Model map,
			RedirectAttributes flashMap, HttpSession session) {
		System.out.println("in process login");
		try {
			Driver d = driverService.getDriver(dEmail, dPassword);
			System.out.println("driver " + d);

			flashMap.addFlashAttribute("message", " Welcome " + d.getdName());
			session.setAttribute("driver", d);

			map.addAttribute("DriverId", d.getDriverId());
			return "redirect:/driver/dashboard";
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
			map.addAttribute("message", "wrong credentials");
			return "/driver/login";
		}
	}

	//for changing delivery status
	@GetMapping("/shipped")
	public String shippedOrder(@RequestParam Integer did, RedirectAttributes flashMap, Model map) {
		System.out.println("did = " + did);

		flashMap.addFlashAttribute("message", ordService.shippedOrder(did));

		return "redirect:/driver/dashboard";
	}

	@GetMapping("/delivered")
	public String deliveredOrder(@RequestParam Integer did, RedirectAttributes flashMap, HttpSession session) {
		System.out.println("did = " + did);

		flashMap.addFlashAttribute("message", ordService.deliveredOrder(did));
		return "redirect:/driver/dashboard";
	}

	
	//for refreshing driver dashboard
	@GetMapping("/dashboard")
	public String showDriverDashboard(Model map, HttpSession session, RedirectAttributes flashMap) {
		Driver d = (Driver) session.getAttribute("driver");
		Driver d1 = driverService.getDriverById(d.getDriverId()).get();

		session.setAttribute("driver", d1);

		System.out.println("in dashboard" + d);

		return "/driver/dashboard";
	}

	
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request, RedirectAttributes flashMap) {
		HttpSession httpSession = request.getSession();
		flashMap.addFlashAttribute("message", "You have logged out successfully ");
		httpSession.invalidate();
		return "redirect:/";
	}

}
