package com.webproject.essuyo;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@GetMapping(path = "/detail")
	public String showdetailPage(Locale locale, Model model) {
		logger.info("{}", "detail 페이지 요청");
		return "detail";
	}

	@GetMapping(path = "/dashboard")
	public String showdashboardPage(Locale locale, Model model) {
		return "dashboard";
	}

	@GetMapping(path = "/error")
	public String showerrorPage(Locale locale, Model model) {
		return "error-404";
	}

	@GetMapping(path = "/form")
	public String showformPage(Locale locale, Model model) {
		return "form-basic";
	}

	@GetMapping(path = "/icon")
	public String showiconPage(Locale locale, Model model) {
		return "icon-material";
	}

	@GetMapping(path = "/profile")
	public String showprofilePage(Locale locale, Model model) {
		return "pages-profile";
	}

	@GetMapping(path = "/starter")
	public String showstarterPage(Locale locale, Model model) {
		return "starter-kit";
	}

	@GetMapping(path = "/table")
	public String showtablePage(Locale locale, Model model) {
		return "table-basic";
	}

	@GetMapping(path = "/res")
	public String showresPage(Locale locale, Model model) {
		return "reservation";
	}
	

	// 회원가입 페이지로 보내준다
	@GetMapping(path = "/regist")
	public String showregistPage(Locale locale, Model model) {
		return "regist";
	}

	@GetMapping(path = "/test")
	public String showtestPage(Locale locale, Model model) {
		return "test";
	}
	
	@GetMapping(path = "/userList")
	public String showuserListPage(Locale locale, Model model) {
		return "userList";
	}

	// doA 경로로 들어왔을 때, 콘솔에 doA.... 를 출력하고, views 폴더의 main.jsp로 보내준다.
	@RequestMapping(value = "/doA", method = RequestMethod.GET)
	public String doA(Locale locale, Model model) {
		System.out.println("doA.............");

		return "main";

	}

	// /doB로 왔을 때, 콘솔에 doB... 를 출력해 주고, "result", "DOB RESULT" 어트리뷰트를 추가,
	// 그리고 main.jsp로 보내준다.
	@RequestMapping(value = "/doB", method = RequestMethod.GET)
	public String doB(Locale locale, Model model) {
		System.out.println("doB.............");

		model.addAttribute("result", "DOB RESULT");

		return "main";

	}
}
