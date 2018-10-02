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
	public String showReservationPage(@RequestParam("company") int companyId, @RequestParam("product") int productId,
			Model model) {

		Map<String, Object> result = productService.getProduct(productId);

		if (result != null) {
			model.addAttribute("product", result);
			model.addAttribute("companyType", companyService.getCompanyVO(companyId).getType());

			return "reservation";
		}

		// < list page 완성되면 수정
		return "main";

	}

	@PostMapping("/reserve")
	public String setReserve(@ModelAttribute ReservationVO reservationInfo, HttpSession httpSession, Model model) {

		String viewName = "";
		String email = (String) httpSession.getAttribute("login");

		if (email != null && email.equals("") == false) {
			int resultId = reservationService.regReservationInfo(email, reservationInfo);

			if (resultId == 0) {

				viewName = "redirect:reservation?company=" + reservationInfo.getCompanyId() + "&product="
						+ reservationInfo.getProductId();
			}

			viewName = "redirect:/user/dashboard";
		}

		return viewName;
	}
}
