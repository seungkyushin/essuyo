package com.webproject.essuyo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.essuyo.domain.MainVO;
import com.webproject.essuyo.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@GetMapping("/")
	public String showMainPage(Model model) throws Exception {

		model.addAttribute("main",mainService.getMain(0));
		return "main";
	}
	
}
