package com.webproject.essuyo.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.CompanyService;
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
	
	@Autowired
	private CompanyService companyService;
	
	//GET 방식으로 회원가입 페이지에 접근. 그냥 회원가입 페이지로 보내준다
	@RequestMapping(value="/regist", method=RequestMethod.GET)
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
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
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
	
	@GetMapping("/dashboard")
	public String showDashboardPage(Model model) throws Exception{
		
		
		String type = "user";
		model.addAttribute("userType",type);
		
		List<ReservationVO> reservationList = reservationService.getReservationListNotState(type, 2);
		List<List<Integer>> comprehensiveGraph = new ArrayList<List<Integer>>();
		List<Integer> MonthsPaymentList = new ArrayList<Integer>(); //< 월별 지불/수입 리스트
		List<Integer> categoryReservationList = new ArrayList<Integer>(); //< 카테고리별 예약 횟수 리스트


		int MaxCategory = 4;
		int MaxMonth = 12;
		
		//< List 변수 초기화
		for(int i=0 ; i < MaxMonth; i++) {
			MonthsPaymentList.add(0);
		}
		for(int c=0 ; c < MaxCategory; c++) {
			List<Integer> monthList = new ArrayList<Integer>();
				for(int m=0 ; m < MaxMonth; m++) {
					monthList.add(0);
				}
			categoryReservationList.add(0);
			comprehensiveGraph.add(monthList);
		}
		
		
		for( ReservationVO data : reservationList) {
			
			if( data.getState().equals("취소") == true ) 
				continue;
			
				CompanyVO test = companyService.getCompany(data.getCompanyId());
			
				int categoryIndex =  test.getBusinessTypeId() - 1;
						
				//< 카테고리 별 개수 
				int value = categoryReservationList.get(categoryIndex);
				categoryReservationList.set(categoryIndex,value + 1);
			
				//< 월별 지불/수입 
				LocalDate ld = new LocalDate(data.getRegDate());
				int month = ld.getMonthOfYear() - 1;
				int monthPrice = MonthsPaymentList.get(month).intValue();
				MonthsPaymentList.set(month, (monthPrice + data.getTotalPrice()) );
							
				//< 카테고리 별로 월마다 예약한 횟수
				int count = comprehensiveGraph.get(categoryIndex).get(month);
				comprehensiveGraph.get(categoryIndex).set(month,  count + 1);
				
			}

		
		
		/*****************************************************************************/
		/******************************* 사용자별 종합 그래프 ******************************/
		/*****************************************************************************/
		
		//< 1. 
		model.addAttribute("lineGraph",comprehensiveGraph);
		
		//< 3. 화면단 표시 문자열
		if( type.equals("user") == true ) {
			model.addAttribute("lineGraphName","카테고리별 예약 종합");
		}if( type.equals("company") == true ) {
			model.addAttribute("lineGraphName","사용자 선호도");
		}
			
		/*****************************************************************************/
		/******************************* 사용자별 예약 횟수 ********************************/
		/*****************************************************************************/
	
		//< 1. 년 단위 사용자별 예약 횟수
		model.addAttribute("totalReservtionCount",reservationList.size());
		
		//< 2. 카테고리별 예약 분포도
		model.addAttribute("dounutChart",categoryReservationList);
	
		//< 3. 화면단 표시 문자열
		if( type.equals("user") == true ) {
			model.addAttribute("dounutChartName","카테고리 별 예약횟수");
		}if( type.equals("company") == true ) {
			model.addAttribute("dounutChartName","방문자 별");
		}
		
		/*****************************************************************************/
		/******************************* 사용자별 지출/수입 *******************************/
		/*****************************************************************************/
		
		//< 1.  년 단위 총 지출/수입 내용
		model.addAttribute("totalPayment",reservationService.getReservationTotalPrice(type, 2));
		
		//< 2. 월 단위 총 지출/수입 내용
		model.addAttribute("MonthsPaymentList",MonthsPaymentList);

		//< 3. 화면단 표시 문자열
		if( type.equals("user") == true ) {
			model.addAttribute("sparkLineName","올해 지출");
		}if( type.equals("company") == true ) {
			model.addAttribute("sparkLineName","올해 수입");
		}
		
		return "dashboard";
		
	}
}
