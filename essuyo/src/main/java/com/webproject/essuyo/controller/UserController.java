package com.webproject.essuyo.controller;

import java.util.HashMap;
import java.util.Map;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.ReservationService;
import com.webproject.essuyo.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserServiceImpl service;

	@Autowired
	private ReservationService reservationService;

	// GET 방식으로 회원가입 페이지에 접근. 그냥 회원가입 페이지로 보내준다
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registGet(UserVO vo, Model model) throws Exception {
		logger.info("registGet.......");
	}

	// POST 방식으로 회원가입 페이지 접근
	@ResponseBody
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public Integer registPost(UserVO vo, HttpSession session, Model model) throws Exception {
		logger.info("registPost.......");
		try {
			service.regist(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	// 회원가입 시 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public Map<String, Object> checkId(String email) {
		Map<String, Object> map = new HashMap<>();

		if (service.checkId(email)) {
			map.put("code", 99);
			map.put("msg", "사용가능한 이메일 입니다.");

		} else {
			map.put("code", -1);
			map.put("msg", "이미 등록된 이메일입니다.");

		}
		return map;
	}

	// 로그인 컨트롤. 로그인 페이지에 들어갈 때
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute UserVO vo) {

	}

	// 로그인 페이지에서, form을 전송할 때.
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(UserVO userVO, HttpSession session, Model model) throws Exception {
	
		//서비스의 로그인 메소드를 실행해서 UserVO 객체에 넣는다.
		UserVO vo = service.login(userVO);				

		//그 vo 객체가 null 이라면 해당되는 이메일, 비밀번호가 없다는 뜻이니까 다시 로그인 페이지로.
		if(vo == null) {			
			return "user/login";
		} 
		//만약 그렇지 않다면 해당 로그인 정보가 든 vo 객체를 model 어트리뷰트에 세트해 주고, 일단은 대쉬보드로 리다이렉트해 준다
		model.addAttribute("userVO", vo);
		return "redirect:/user/dashboard";
	}

	@GetMapping("/dashboard")
	public String showDashboardPage(Model model) throws Exception {

		String type = "user";

		/**/
		model.addAttribute("userType", type);

		List<List<Integer>> lineGraph = new ArrayList<List<Integer>>();

		int[][] lineGraphArry = { { 24, 28, 42, 32, 34, 48, 40, 24, 28, 42, 32, 34 },
				{ 4, 21, 30, 46, 56, 81, 70, 66, 28, 31, 20, 34 }, { 0, 32, 21, 30, 46, 56, 64, 21, 30, 46, 56, 64 },
				{ 100, 95, 81, 70, 66, 56, 44, 31, 20, 16, 6, 0 } };

		for (int[] data : lineGraphArry) {
			List<Integer> pointList = new ArrayList<Integer>();
			for (int d : data) {
				pointList.add(d);
			}
			lineGraph.add(pointList);
		}

		if (type.equals("user") == true) {
			model.addAttribute("lineGraphName", "카테고리별 예약 종합");
		}
		if (type.equals("company") == true) {
			model.addAttribute("lineGraphName", "사용자 선호도");
		}

		model.addAttribute("lineGraph", lineGraph);

		List<Integer> dounutChart = new ArrayList<Integer>();
		int[] dounutChartArry = { 28, 32, 10, 30 };

		for (int data : dounutChartArry) {
			dounutChart.add(data);
		}

		if (type.equals("user") == true) {
			model.addAttribute("dounutChartName", "카테고리 별 예약횟수");
		}
		if (type.equals("company") == true) {
			model.addAttribute("dounutChartName", "방문자 별");
		}
		List<ReservationVO> reservationList = reservationService.getReservationListAll(type, 2);

		model.addAttribute("dounutChart", dounutChart);
		model.addAttribute("totalReservtionCount", reservationList.size());

		int[] monthPayment = new int[12]; //
		int totalPayment = 0;
		for (ReservationVO data : reservationList) {
			LocalDate ld = new LocalDate(data.getRegDate());
			int month = ld.getMonthOfYear();
			monthPayment[month - 1] += data.getTotalPrice();
			totalPayment += data.getTotalPrice();
		}

		List<Integer> sparkline = new ArrayList<Integer>();
		int test = 0;
		for (int data : monthPayment) {
			test += 100000;
			data += test;
			sparkline.add(data);
		}

		model.addAttribute("totalPayment", totalPayment);

		if (type.equals("user") == true) {
			model.addAttribute("sparkLineName", "올해 지출");
		}
		if (type.equals("company") == true) {
			model.addAttribute("sparkLineName", "올해 수입");
		}
		model.addAttribute("sparkLine", sparkline);

		return "dashboard";

	}
}
