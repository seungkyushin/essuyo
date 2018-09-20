package com.webproject.essuyo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.essuyo.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/reservation")
	public String showReservationPage(@RequestParam("id") int productId,
			@RequestParam("type") int businessTypeId,
			Model model) {
		
		Map<String,Object> result = productService.getProduct(productId);

		model.addAttribute("product", result);
		model.addAttribute("businessType", businessTypeId);
		
		return "reservation";
	}
	
	@GetMapping("/reserve")
	public String setReserve(@RequestParam("id") int productId,
			@RequestParam("type") int businessTypeId,
			Model model) {
		
		Map<String,Object> result = productService.getProduct(productId);

		model.addAttribute("product", result);
		model.addAttribute("businessType", businessTypeId);
		
		return "reservation";
	}
}
