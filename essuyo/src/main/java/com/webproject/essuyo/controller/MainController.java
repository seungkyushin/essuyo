package com.webproject.essuyo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
//	@Autowired
//	private CompanyService service;
	
	@GetMapping("/")
	public String showMainPage(Model model) throws Exception {

		model.addAttribute("main", mainService.getMain());
//		model.addAttribute("list", service.listAll());

		return "main";
	}
	
}
