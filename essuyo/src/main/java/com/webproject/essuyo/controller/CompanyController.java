package com.webproject.essuyo.controller;



import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webproject.essuyo.service.CompanyService;

@Controller
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Inject
	private CompanyService service;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void salesList(Model model) throws Exception{
		logger.info("ListGET()....");
		model.addAttribute("list", service.listAll());

	}

	
	
	
	
	
	
	
	
	
	
}
