package com.webproject.essuyo.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ProductService;
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
	public Integer companyRegistPost(UserVO vo, CompanyVO cvo, HttpSession session, Model model) throws Exception {
		logger.info("companyRegistPost.......");
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
		@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
		public String loginPOST(@ModelAttribute UserVO userVO, HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			session = request.getSession();
			//세션이 이미 login 값이 들어있다면 이 값을 지워준다.
					if (session.getAttribute("login") != null) {
						logger.info("clear login data before");
						session.removeAttribute("login");
					}
		
			//서비스의 로그인 메소드를 실행해서 UserVO 객체에 넣는다.
			UserVO vo = service.login(userVO);				

			//그 vo 객체가 null 이라면 해당되는 이메일, 비밀번호가 없다는 뜻이니까 다시 로그인 페이지로.
			if(vo == null) {			
				logger.info("login failed......");		
				if(!model.containsAttribute("msg")) {
				model.addAttribute("msg", "이메일이나 비밀번호가 잘못됐습니다.");
				} 
				return "/user/login";
			} else if(vo.getBusinessId() != -1){
				//만약 비즈니스 아이디가 -1(기본값)이 아닐 경우,
				//세션에 companyLogin과 login, 두가지 어트리뷰트를 세트해 주고, 메인 페이지로 보낸다.
				logger.info("new company login success");
				session.setAttribute("companyLogin", vo.getBusinessId());
				session.setAttribute("login",  vo.getEmail());
				return "redirect:/";
			} else {
				//비즈니스 아이디가 -1일 경우 그냥 login 어트리뷰트만 세트해 준다.
				logger.info("new login success");				
				session.setAttribute("login",  vo.getEmail());
				return "redirect:/";
			}
		}
		
		//로그 아웃 기능
		@RequestMapping(value="/logout", method=RequestMethod.GET)
		public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
			
			Object obj = session.getAttribute("login");
			
			if(obj != null) {
				
				//이것도 쿠키 기능을 위한 형변환
				//UserVO vo = (UserVO) obj;
				
				session.removeAttribute("login");
				session.invalidate();
				
				// 이 아래는 쿠키 기능. 아직 미구현
//				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//				
//				if(loginCookie != null) {
//					loginCookie.setPath("/");
//					loginCookie.setMaxAge(0);
//					response.addCookie(loginCookie);
//					service.keepLogin(vo.getEmail(), session.getId(), new Date());
//				}
			}
			return "user/logout";
		}
	
	@GetMapping("/dashboard")
	public String showDashboardPage(HttpSession httpSession, Model model) throws Exception{
		
		
		String email = (String)httpSession.getAttribute("login");
		UserVO user = service.getUser(email);
		
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