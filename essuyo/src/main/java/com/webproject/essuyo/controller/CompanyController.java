package com.webproject.essuyo.controller;



import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.UserService;

@Controller
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Inject
	private CompanyService service;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void salesList(Model model) throws Exception{
		logger.info("ListGET()....");
		model.addAttribute("list", service.listAll());

	}
	
	@GetMapping("/detail")
	public String showCompanyDetailPage(@RequestParam("id") int companyId, Model model) throws Exception{
	
		model.addAttribute("company",service.getCompany(companyId));
		model.addAttribute("companyImage",service.getImagePath(companyId));
		model.addAttribute("facilityList",service.getCompanyFacility(companyId));
		model.addAttribute("user",userService.getSaleUserInfo(companyId));
		
		
		return "detail";
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
	
}
