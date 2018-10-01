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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			} else {
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
		String type = "";
		int id = 0;
		UserVO user = service.getUser(email);
		if( user.getBusinessId() == 0) {
			type = "user";
			id = user.getId();
		}else {
			type = "company";
			id = user.getBusinessId();
		}
		
		model.addAttribute("userType",type);
			
		/*****************************************************************************/
		/******************************* 사용자별 종합 그래프 ******************************/
		/*****************************************************************************/
		
		//< 1. 예약 관련 종합적인 데이터 
		List<List<Integer>> comprehensiveGraph = reservationService.getComprehensiveReservation(type, id);
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
		model.addAttribute("totalReservtionCount",reservationService.getReservationListNotState(type, id).size());
		
		//< 2. 카테고리별 예약 분포도
		List<Integer> categoryReservationList = reservationService.getCategoryReservationCount(type, id); //< 카테고리별 예약 횟수 리스트
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
		model.addAttribute("totalPayment",reservationService.getReservationTotalPrice(type, id));
		
		//< 2. 월 단위 총 지출/수입 내용
		List<Integer> MonthsPaymentList = reservationService.getMonthlyPrice(type, id); //< 월별 지불/수입 리스트
		model.addAttribute("MonthsPaymentList",MonthsPaymentList);

		//< 3. 화면단 표시 문자열
		if( type.equals("user") == true ) {
			model.addAttribute("sparkLineName","올해 지출");
		}if( type.equals("company") == true ) {
			model.addAttribute("sparkLineName","올해 수입");
		}
		
		return "/user/dashboard";
		
	}
}