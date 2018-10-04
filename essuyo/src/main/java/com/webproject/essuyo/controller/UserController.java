package com.webproject.essuyo.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webproject.essuyo.domain.BusinessVO;
import com.webproject.essuyo.domain.CompanyVO;
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
	//GET 방식으로 사업체 회원가입 페이지에 접근.
	@RequestMapping(value="/companyRegist", method=RequestMethod.GET)
	public void companyRegistGet(UserVO vo, CompanyVO cvo, Model model) throws Exception {
		logger.info("companyRegistGet.......");
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
	//POST 방식으로 사업체 회원가입 접근.
	//일반 회원가입 서비스와, 사업체 회원가입 서비스를 트랜잭션으로 묶음
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/companyRegist", method = RequestMethod.POST)
	public Integer companyRegistPost(UserVO vo, CompanyVO cvo, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		logger.info("companyRegistPost.......");
		
		//리퀘스트로 유저이름과 회사이름을 구분해서 넣어준다.		
		
		
		String userName = (String) request.getParameter("userName");
		String companyName = (String) request.getParameter("companyName");
		vo.setName(userName);
		cvo.setName(companyName);
		
		System.out.println("userName: "+ vo.getName());
		System.out.println("companyName: "+	 cvo.getName());
		//LAST_INSERT_ID()를 사용하기 때문에 반드시 아래의 순서대로 실행하는 게 중요하다
		try {
			service.companyRegist(cvo);
			service.businessRegist();
			service.ownerRegist(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	//컴퍼니 테이블을 수정하는 서비스의 컨트롤러(미완성)
	public void companyUpdate(CompanyVO cvo) throws Exception{
		logger.info("companyUpdate......");
		
		service.companyUpdate(cvo);
		
	}
	

	@GetMapping("/profile")
	public String showProfilePage(HttpSession httpSession, Model model) {
		
		String email = (String)httpSession.getAttribute("login");
		
		Map<String,Object> userInfo = service.getUserInfo(email);
		model.addAttribute("user", userInfo);
		
		if( userInfo.get("business") != null ) {
			BusinessVO business = (BusinessVO)userInfo.get("business");
			model.addAttribute("company", companyService.getSimpleCompanyInfo(business.getCompanyId()));
		}
	
		
		return "/user/profile";
	}
	
	@PostMapping("/profileUpdate")
	public String showProfilePage(UserVO newUserInfo, 
			RedirectAttributes redirectAttr, 
			HttpSession httpSession, Model model) {
		
		UserVO user = service.getUserVO((String)httpSession.getAttribute("login"));
		newUserInfo.setId(user.getId());

		int update = service.setUserInfo(newUserInfo);
		
		if(update > 0) {
			redirectAttr.addFlashAttribute("errorMessageTitle", "SUCCESS !");
			redirectAttr.addFlashAttribute("errorMessage", "회원 정보가 성공적으로 수정되었습니다.");
			
		}else {
			redirectAttr.addFlashAttribute("errorMessageTitle", "ERROR !");
			redirectAttr.addFlashAttribute("errorMessage", "회원 정보 수정에 실패하였습니다.");
		}
		
		return "redirect:/user/profile";
	}

	
			
		
	@GetMapping("/dashboard")
	public String showDashboardPage(HttpSession httpSession, Model model) {
		
		
		String email = (String)httpSession.getAttribute("login");
		UserVO user = service.getUserVO(email);
		
		if( user.getBusinessId() == 0) {
			model.addAttribute("userType","user");
			model.addAttribute("id",user.getId());
			setUserDashboard(email, "user", user.getId(), model);
		}else {
			int id = service.getBusinessInfo(email).getCompanyId();
			model.addAttribute("userType","company");
			model.addAttribute("id",id);
			setCompanyDashboard(email, "company", id, model);
		}
		
		return "/user/dashboard";
		
	}
	public void setCompanyDashboard(String email, String type, int id, Model model) {
	
		/*****************************************************************************/
		/********************************** 종합 그래프 *********************************/
		/*****************************************************************************/

		//< 1. 예약 관련 종합적인 데이터 
		List<List<Integer>> comprehensiveGraph = reservationService.getMonthlyReservationCount(type,id);
		model.addAttribute("lineGraph",comprehensiveGraph);
		
		//< 3. 화면단 표시 문자열
		model.addAttribute("lineGraphName","월별 상품 판매");
		
			
		/*****************************************************************************/
		/******************************* 사용자별 예약 횟수 ********************************/
		/*****************************************************************************/
	
		//< 1. 년 단위 사용자별 예약 횟수
		model.addAttribute("totalReservtionCount",reservationService.getReservationListNotState(type, id).size());
		
		//< 2. 남여 예약 분포도
		List<Integer> categoryReservationList = reservationService.getGenderReservationCount(id); //< 카테고리별 예약 횟수 리스트
		model.addAttribute("dounutChart",categoryReservationList);
	
		//< 3. 화면단 표시 문자열
		model.addAttribute("dounutChartName","예약 성별 비율");
		
		/*****************************************************************************/
		/******************************* 사용자별 지출/수입 *******************************/
		/*****************************************************************************/
		
		//< 1.  년 단위 총 지출/수입 내용
		model.addAttribute("totalPayment",reservationService.getReservationTotalPrice(type, id));
		
		//< 2. 월 단위 총 지출/수입 내용
		List<Integer> MonthsPaymentList = reservationService.getMonthlyPrice(type, id); //< 월별 지불/수입 리스트
		model.addAttribute("MonthsPaymentList",MonthsPaymentList);

		//< 3. 화면단 표시 문자열
		model.addAttribute("sparkLineName","한해 수입");
		
		
	}
	
	public void setUserDashboard(String email, String type, int id, Model model) {
		
		/*****************************************************************************/
		/******************************* 사용자별 종합 그래프 ******************************/
		/*****************************************************************************/
		
		//< 1. 예약 관련 종합적인 데이터 
		List<List<Integer>> comprehensiveGraph = reservationService.getComprehensiveReservation(type, id);
		model.addAttribute("lineGraph",comprehensiveGraph);
		
		//< 3. 화면단 표시 문자열
		model.addAttribute("lineGraphName","카테고리별 예약 종합");
	
		
		/*****************************************************************************/
		/******************************* 사용자별 예약 횟수 ********************************/
		/*****************************************************************************/
	
		//< 1. 년 단위 사용자별 예약 횟수
		model.addAttribute("totalReservtionCount",reservationService.getReservationListNotState(type, id).size());
		
		//< 2. 카테고리별 예약 분포도
		List<Integer> categoryReservationList = reservationService.getCategoryReservationCount(type, id); //< 카테고리별 예약 횟수 리스트
		model.addAttribute("dounutChart",categoryReservationList);
	
		//< 3. 화면단 표시 문자열
		model.addAttribute("dounutChartName","카테고리 별 예약횟수");
	
		/*****************************************************************************/
		/******************************* 사용자별 지출/수입 *******************************/
		/*****************************************************************************/
		
		//< 1.  년 단위 총 지출/수입 내용
		model.addAttribute("totalPayment",reservationService.getReservationTotalPrice(type, id));
		
		//< 2. 월 단위 총 지출/수입 내용
		List<Integer> MonthsPaymentList = reservationService.getMonthlyPrice(type, id); //< 월별 지불/수입 리스트
		model.addAttribute("MonthsPaymentList",MonthsPaymentList);

		//< 3. 화면단 표시 문자열
		model.addAttribute("sparkLineName","올해 지출");
		
	}
}