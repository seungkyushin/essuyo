package com.webproject.essuyo.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	// 포스트 핸들러. 로그인 기능이 실행된 다음에 작동
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");

		//userVO가 비어있지 않다면, 세션에 로그인 어트리뷰트를 세팅해준다.
		if (userVO != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);
//로그인 창에서 자동 로그인을 체크했다면 로그인 쿠키를 만들어 준다. 쿠키 기간은 1주일
			if (request.getParameter("useCookie") != null) {
				logger.info("remember me........");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			
			//dest에서 로그인 화면 이전에 가려고 했던 페이지를 받아와서 보내준다
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String) dest : "/");
		}
	}
//프리 핸들러. 로그인 기능이 실행되기 전에 작동
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
//세션이 이미 login 값이 들어있다면 이 값을 지워준다.
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}

}
