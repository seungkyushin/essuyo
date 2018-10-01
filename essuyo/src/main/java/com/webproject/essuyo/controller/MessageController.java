package com.webproject.essuyo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.MessageService;
import com.webproject.essuyo.service.UserService;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Inject
	private MessageService service;

	@Inject
	private UserService userService;

	@Inject
	private HttpSession session;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(MessageVO message, RedirectAttributes rttr, Model model) throws Exception {

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);
		message.setUserID(userID);

		// receiverID 받아오기
		String id = message.getReceiverID();
		logger.info("receiver : " + id);

		// UserVO 의 id 값으로 들어온 값을 email로 변환
		UserVO user = userService.selectMessageEmail(id);
		String receiverID = user.getEmail();
		logger.info("receiver : " + receiverID);
		// receiverID 초기화
		message.setReceiverID(receiverID);

		model.addAttribute("messageVO", message);

		logger.info(message.toString());
		logger.info("register get...");

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MessageVO message, RedirectAttributes rttr, Model model) throws Exception {

		logger.info("register POST...");
		logger.info(message.toString());
		
		// receiverID 받아오기
		String id = message.getReceiverID();
		logger.info("receiver : " + id);

		// UserVO 의 id 값으로 들어온 값을 email로 변환
		UserVO user = userService.selectMessageEmail(id);
		String receiverID = user.getEmail();
		logger.info("user : " + receiverID);
		
		// receiverID 초기화
		message.setReceiverID(receiverID);
		logger.info("receiver : " + receiverID);
		
		model.addAttribute("messageVO", message);
		
		service.regist(message);
		

		rttr.addFlashAttribute("msg", "success");

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
	@RequestMapping(value = "/sendMeg", method = RequestMethod.GET)
	public void sendMeg(@ModelAttribute("cri") MessageCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);

		logger.info(cri.toString());
		
		model.addAttribute("sendList", service.listCriteria(cri));
		MessagePageMaker pageMaker = new MessagePageMaker();
		cri.setPage(1);
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);

		int page = cri.getPage();

		model.addAttribute("sendList", service.sendMeg(userID, page));

	}

	// 받은 편지함
	@RequestMapping(value = "/recevieMeg", method = RequestMethod.GET)
	public void recevieMeg(@ModelAttribute("cri") MessageCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);

		logger.info(cri.toString());

		MessagePageMaker pageMaker = new MessagePageMaker();
		cri.setPage(1);
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);

		int page = cri.getPage();

		model.addAttribute("recevieList", service.recevieMeg(userID, page));
	}
}
