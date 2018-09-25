package com.webproject.essuyo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.service.ProductService;
import com.webproject.essuyo.service.ReservationService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/reservation")
	public String showReservationPage(@RequestParam("id") int productId,
			@RequestParam("type") int businessTypeId,
			Model model) {
		
		Map<String,Object> result = productService.getProduct(productId);

		model.addAttribute("product", result);
		model.addAttribute("businessType", businessTypeId);
		
		return "reservation";
	}
	
	@PostMapping("/reserve")
	public String setReserve(@ModelAttribute ReservationVO reservationInfo,
			Model model) {
			String viewName = "main";
	
			int resultId = reservationService.regReservationInfo(reservationInfo);
			
			if(resultId == 0 ) {
				viewName = "redirect:reservation?id=" + reservationInfo.getProductId() +
							"&type="+reservationInfo.getCompanyId();
			}

		return viewName;
	}
}
