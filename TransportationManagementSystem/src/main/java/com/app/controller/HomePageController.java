package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {

	public HomePageController() {
		System.out.println("in ctrl of " + getClass().getName());
	}

	@RequestMapping("/")
	public String showHomePage() {
		return "/index";
	}

}
