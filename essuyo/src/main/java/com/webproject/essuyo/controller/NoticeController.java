package com.webproject.essuyo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webproject.essuyo.domain.NoticeVO;
import com.webproject.essuyo.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@Inject
	private HttpSession session;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(NoticeVO notice, Model model) throws Exception {

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);
		notice.setUserID(userID);

		model.addAttribute("noticeVO", notice);

		logger.info(notice.toString());
		logger.info("register get...");
		
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registPOST(NoticeVO notice, RedirectAttributes rttr) throws Exception {
		
		logger.info("regist post...");
		logger.info(notice.toString());
		
		service.regist(notice);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/notice/listAll";
	}
	
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		
		logger.info("show all list..............");
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("noticeNum") int noticeNum, Model model) throws Exception{
		model.addAttribute(service.read(noticeNum));
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("noticeNum") int noticeNum, RedirectAttributes rttr) throws Exception{
		
		service.remove(noticeNum);
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/notice/listAll";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int noticeNum, Model model) throws Exception{
		model.addAttribute(service.read(noticeNum));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(NoticeVO notice, RedirectAttributes rttr) throws Exception{
		logger.info("mod post...............");
		
		service.modify(notice);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/notice/listAll";
	}
}