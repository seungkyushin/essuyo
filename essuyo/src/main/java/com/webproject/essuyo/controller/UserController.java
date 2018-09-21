package com.webproject.essuyo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	//GET 방식으로 회원가입 페이지에 접근. 그냥 회원가입 페이지로 보내준다
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void registGet(UserVO vo, Model model) throws Exception {
		logger.info("registGet.......");
	}

	
	//POST 방식으로 회원가입 페이지 접근, form에 입력된 정보들은 받아야 하는데...
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPost(UserVO vo, HttpSession session, Model model) throws Exception{
		
		service.regist(vo);
		//회원가입이 끝나면 로그인 화면으로 리다이렉트
		return "redirect:/user/login";
		
	}
}
