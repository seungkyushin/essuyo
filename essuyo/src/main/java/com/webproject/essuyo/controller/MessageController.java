package com.webproject.essuyo.controller;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webproject.essuyo.domain.MessageCriteria;
import com.webproject.essuyo.domain.MessagePageMaker;
import com.webproject.essuyo.domain.MessageVO;
import com.webproject.essuyo.service.MessageService;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Inject
	private MessageService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(MessageVO message, Model model) throws Exception {

		/*
		 * message.setTitle("하하하"); message.setContent("안녕"); message.setReadCheck(1);
		 * message.setSendDate(new Date()); message.setReceiverID(1);
		 * message.setUserID(2);
		 */

		logger.info("register get...");
		// service.regist(message);

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MessageVO message, RedirectAttributes rttr,
			@RequestParam("userID") String userID, @RequestParam("receiverID") String receiverID) throws Exception {
		logger.info("register POST...");
		logger.info(message.toString());
		
		message.setUserID(userID);
		message.setReceiverID(receiverID);
		service.regist(message);
		
		// model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");

		// return "/message/messageSuccess";
		return "redirect:/message/listPage";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {

		logger.info("show all message list");
		model.addAttribute("list", service.listAll());
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("megNum") int megNum, Model model) throws Exception {

		model.addAttribute(service.read(megNum));
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("megNum") int megNum, RedirectAttributes rttr) throws Exception {

		service.remove(megNum);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/message/listAll";
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("megNum") int megNum, MessageCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(megNum);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/message/listPage";
	}

	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(MessageCriteria cri, Model model) throws Exception {

		logger.info("show list page with Criteria");
		model.addAttribute("list", service.listCriteria(cri));
	}

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") MessageCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		model.addAttribute("list", service.listCriteria(cri));
		MessagePageMaker pageMaker = new MessagePageMaker();
		cri.setPage(1);
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("megNum") int megNum, @ModelAttribute("cri") MessageCriteria cri, Model model)
			throws Exception {

		model.addAttribute(service.read(megNum));

	}
	
	// 보낸 쪽지함
	@RequestMapping(value = "/sendMeg", method = RequestMethod.POST)
	public String sendMeg(@ModelAttribute("cri") MessageCriteria cri, Model model,
			@RequestParam("userID") String userID) throws Exception {
		
	//	service.sendMeg(userID);
		return "redirect:/message/listPage";
	}
	
	// 받은 편지함
	@RequestMapping(value = "/recevieMeg", method = RequestMethod.POST)
	public void recevieMeg(@ModelAttribute("cri") MessageCriteria cri, Model model) throws Exception {
		
		logger.info(cri.toString());

		model.addAttribute("list", service.listCriteria(cri));
		MessagePageMaker pageMaker = new MessagePageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}
}
