package com.webproject.essuyo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ProductService;
import com.webproject.essuyo.service.ReservationService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private CompanyService companyService;

	@GetMapping("/reservation")
	public String showReservationPage(@RequestParam("id") int productId, @RequestParam("type") int resType,
			Model model) {

		Map<String, Object> result = productService.getProduct(productId);

		if (result != null) {
			model.addAttribute("product", result);
			model.addAttribute("resType", resType);

			return "reservation";
		}

		// < list page 완성되면 수정
		return "main";

	}

	@PostMapping("/reserve")
	public String setReserve(@ModelAttribute ReservationVO reservationInfo,
			HttpSession httpSession, Model model) {

		String viewName = "";
		String email = (String) httpSession.getAttribute("login");
		
		if (email != null && email.equals("") == false) {
			int resultId = reservationService.regReservationInfo(email, reservationInfo);

			if (resultId == 0) {
				CompanyVO company = companyService.getCompany(reservationInfo.getCompanyId());

				if (company != null) {
					String companyType = company.getType();
					int type = 0;
					if (companyType.equals("음식점") || companyType.equals("박물관")) {
						type = 1;
					}
					viewName = "redirect:reservation?id=" + reservationInfo.getProductId() + "&type=" + type;
				}
				
				viewName = "redirect:/user/dashboard";
			}
		}
		
		return viewName;
	}
}
