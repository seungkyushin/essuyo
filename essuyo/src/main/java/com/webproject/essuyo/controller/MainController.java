package com.webproject.essuyo.controller;


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
	
	@GetMapping("/main")
	public String showMainPage(@RequestParam("id") int mainId, Model model) throws Exception {

		//< service
		  //< dao 
		/////////////////////
		
		MainVO result = mainService.getMain(mainId);
	
		model.addAttribute("id", result);
			
		return "main";
	}
	
	
	

}
