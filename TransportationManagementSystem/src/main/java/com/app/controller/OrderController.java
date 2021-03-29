package com.app.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojos.Order;
import com.app.service.ICustomerService;
import com.app.service.IDriverService;
import com.app.service.IOrderService;
import com.app.service.IVehicleService;
import com.demo.export.ExportPdf;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IVehicleService vehicleService;
	@Autowired
	private IDriverService driverService;
	@Autowired
	private ICustomerService custService;

	@GetMapping("/action")
	public String orderHomePage(Model model) {
		List<Order> orderList = orderService.getOrderList();
		model.addAttribute("orderList", orderList);
		System.out.print("Get  ");
		return "/order/index";
	}

	@GetMapping("/new")
	public String add(Model model) {
		System.out.println("in new order");
	//	model.addAttribute("order", new Order());

		return "/order/new";
	}

	@PostMapping("/save")
	public String saveOrder(@RequestParam int oId, @RequestParam int driverId, Model map) {
		System.out.println("assign drvr details " + oId + " " + driverId);

		orderService.updateOrder(oId, driverId);

		return "redirect:/order/index";
	}

	@GetMapping("/edit")
	public String showEditOrderPage(@RequestParam Integer oid, Model map) {

		System.out.println("in edit method oid " + oid);
		Order ord = orderService.getOrderById(oid).get();
		map.addAttribute("driverList", driverService.getDriversList());
		map.addAttribute("allOrders", orderService.getOrderList());
		map.addAttribute("orderList", ord);
		return "/order/new";
	}

	@GetMapping("/delete")
	public String deleteOrder(/* @PathVariable(name = "oid") */ @RequestParam Integer oid) {
		System.out.println("in delete method oid " + oid);
		orderService.deleteOrderById(oid);
		return "redirect:/order/index";
	}

	@GetMapping("/index")
	public String showIndex(Model map) {
		map.addAttribute("orderList", orderService.getOrderList());
		return "/order/index";
	}

	@GetMapping("/bill")
	public String generateBill(@RequestParam Integer oid, HttpSession session) {
		System.out.println("bill oid " + oid);
		Order order = orderService.getOrderById(oid).get();
//		map.addAttribute("myBill", order);
		session.setAttribute("myBill", order);
		session.setAttribute("ratePerKm", vehicleService.getVehicleInfoByType(order.getType()).getRatePerKm());
		return "/customer/invoice1";
	}

	@GetMapping(value = "/exportpdf", produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<InputStreamResource> billReport(HttpServletResponse response, HttpSession session)
			throws IOException {

		Order o = (Order) session.getAttribute("myBill");

		ByteArrayInputStream bis = ExportPdf.billReport(o);

		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Disposition", "attachment;filename=bill.pdf");

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/payment")
	public String payment(@RequestParam Integer oid, HttpSession session) {
		System.out.println("payment oid " + oid);
		session.setAttribute("paymentId", oid);
		return "/customer/payment";
	}

	@GetMapping("/paid")
	public String paymentPaid(@RequestParam Integer oid, RedirectAttributes flashMap, Model map) {
		System.out.println("oid = " + oid);
		flashMap.addFlashAttribute("message", orderService.paymentReceived(oid));
		Order ord = orderService.getOrderById(oid).get();
		map.addAttribute("myOrderList", custService.myOrders(ord.getCustomer().getcId()));

		return "/customer/myOrders";
	}

}
