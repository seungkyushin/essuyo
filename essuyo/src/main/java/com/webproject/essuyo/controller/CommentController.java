package com.webproject.essuyo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webproject.essuyo.domain.CommentVO;
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.CommentService;
import com.webproject.essuyo.service.UserService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Inject
	private CommentService service;
	@Inject
	private UserService userService;
	@Inject
	private HttpSession session;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register(CommentVO comment, RedirectAttributes rttr, Model model,
			@RequestParam("companyId") int companyId) throws Exception{
		logger.info("------- Comment 쓰기 register() -------");
		
		// user ID 받아오기
		String userEmail = (String) session.getAttribute("login");
		UserVO user = userService.getUserVO(userEmail);
		int userId = user.getId();
	
		logger.info("userId : " + userId + ", companyId : " + companyId);
		
		comment.setUserId(userId);
		comment.setCompanyId(companyId);
		model.addAttribute("commentVO", comment);
		
	}
	
	@RequestMapping(value = "/writerComment", method = RequestMethod.POST)
	public String  writerComment(CommentVO comment, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("------- Comment 입력 writerComment() -------");
		
		// user ID 받아오기
		String userEmail = (String) session.getAttribute("login");
		UserVO user = userService.getUserVO(userEmail);
		int userId = user.getId();
		comment.setUserId(userId);
		
		model.addAttribute("commentVO", comment);
		logger.info(comment.toString());
		
		service.writerComment(comment);
		
		return "redirect:/detail?id=" + comment.getCompanyId();
	}
}
