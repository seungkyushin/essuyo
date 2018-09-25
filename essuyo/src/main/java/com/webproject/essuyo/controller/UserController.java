package com.webproject.essuyo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	//GET 방식으로 회원가입 페이지에 접근. 그냥 회원가입 페이지로 보내준다
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void registGet(UserVO vo, Model model) throws Exception {
		logger.info("registGet.......");
	}

	
	//POST 방식으로 회원가입 페이지 접근, form에 입력된 정보들은 받아야 하는데...
	@ResponseBody
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public Integer registPost(UserVO vo, HttpSession session, Model model) throws Exception{
		logger.info("registPost.......");
		try {
			service.regist(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return 1;
		
	}
	
	@GetMapping("/dashboard")
	public String showDashboardPage(Model model) throws Exception{
		
		
		String type = "user";
	
		/**/
		model.addAttribute("userType",type);
		
		List<List<Integer>> lineGraph = new ArrayList<List<Integer>>();
		
		
		int [][] lineGraphArry = {
							{24, 28, 42, 32, 34, 48, 40, 24, 28, 42, 32, 34},
							{4, 21, 30, 46, 56, 81, 70, 66, 28, 31, 20, 34},
							{0, 32, 21, 30, 46, 56, 64, 21, 30, 46, 56, 64},
							{100, 95, 81, 70, 66, 56, 44, 31, 20, 16, 6, 0}
							};

		for( int [] data : lineGraphArry ) {
			List<Integer> pointList = new ArrayList<Integer>();
			for( int d : data) {
				pointList.add(d);
			}
			lineGraph.add(pointList);
		}
		
		if( type.equals("user") == true ) {
			model.addAttribute("lineGraphName","카테고리별 예약 종합");
		}if( type.equals("company") == true ) {
			model.addAttribute("lineGraphName","사용자 선호도");
		}
		
		model.addAttribute("lineGraph",lineGraph);
		
		
	
		List<Integer> dounutChart = new ArrayList<Integer>();
		int [] dounutChartArry = {28,32,10,30};

		for( int data : dounutChartArry ) {
			dounutChart.add(data);
		}
		
		if( type.equals("user") == true ) {
			model.addAttribute("dounutChartName","카테고리 별 예약횟수");
		}if( type.equals("company") == true ) {
			model.addAttribute("dounutChartName","방문자 별");
		}
		List<ReservationVO> reservationList = reservationService.getReservationListAll(type, 2);
		
		model.addAttribute("dounutChart",dounutChart);
		model.addAttribute("totalReservtionCount",reservationList.size());
		
		List<Integer> sparkline = new ArrayList<Integer>();
		int [] sparklineArry = {2,9,5,10,9,10,12,10,9,11,9,10};

		for( int data : sparklineArry ) {
			sparkline.add(data);
		}
		
		if( type.equals("user") == true ) {
			model.addAttribute("sparkLineName","올해 지출");
		}if( type.equals("company") == true ) {
			model.addAttribute("sparkLineName","올해 수입");
		}
		model.addAttribute("sparkLine",sparkline);
				 
		 int totalPayment = 0;
		 for( ReservationVO data : reservationList) {
			 totalPayment +=  data.getTotalPrice();
		 }
		model.addAttribute("totalPayment",totalPayment);
		
		return "dashboard";
		
	}
}
