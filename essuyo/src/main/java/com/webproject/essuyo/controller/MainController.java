package com.webproject.essuyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private CompanyService companyService;
	
	
	@GetMapping("/")
	public String showMainPage(Model model) throws Exception {
		model.addAttribute("company", mainService.getMain());
		model.addAttribute("countList", mainService.getMainCount());
		model.addAttribute("rankCompanyList", companyService.getRankCompanyInfoList());
		
		return "main";
	}
	
}
