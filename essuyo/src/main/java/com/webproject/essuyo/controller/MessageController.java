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
import com.webproject.essuyo.domain.MessageListCri;
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
	
	@RequestMapping(value = "/replyPage", method = RequestMethod.POST)
	public String replyPage(MessageVO message, RedirectAttributes rttr, Model model,
			@RequestParam("userID") String userID, @RequestParam("receiverID") String receiverID)
			throws Exception {
		logger.info("----- 답장 replyPage() -----");
		
		// 답장하기 위해 전달 받은 ID값을 반대로 저장
		message.setUserID(receiverID);
		message.setReceiverID(userID);
		
		logger.info("message : " + message);
		
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

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("megNum") int megNum, MessageCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(megNum);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/message/listPage";
	}

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") MessageListCri cri, Model model) throws Exception {
		logger.info("----- 전체 쪽지함 listPage() -----");
		logger.info(cri.toString());

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);
				
		MessagePageMaker pageMaker = new MessagePageMaker();
		cri.setUserID(userID);
		int sPage = (cri.getPage()-1)*10;
		cri.setPage(sPage);
		
		pageMaker.setListCri(cri);
		logger.info(pageMaker.toString());
		logger.info(cri.toString());
		
		pageMaker.setListTotalCount(service.listCountCriteria(cri));
		logger.info(pageMaker.toString());
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("list", service.listCriteria(cri));
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("megNum") int megNum, @ModelAttribute("cri") MessageCriteria cri,
			Model model) throws Exception {
		
		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);
		
		
		model.addAttribute(service.read(megNum, userID));

	}

	// 보낸 쪽지함
	@RequestMapping(value = "/sendMeg", method = RequestMethod.GET)
	public void sendMeg(@ModelAttribute("listCri") MessageListCri listCri, Model model) throws Exception {
		logger.info("----- 보낸 쪽지함 sendMeg() -----");

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);

		// 페이징 처리를 위한 설정
		MessagePageMaker pageMaker = new MessagePageMaker();
		listCri.setUserID(userID);
		int sPage = (listCri.getPage()-1)*10;
		listCri.setPage(sPage);
		pageMaker.setListCri(listCri);

		logger.info(listCri.toString());

		pageMaker.setListTotalCount(service.sendCountPaging(userID));

		model.addAttribute("pageMaker", pageMaker);

		model.addAttribute("sendList", service.sendCri(listCri));

	}

	// 받은 편지함
	@RequestMapping(value = "/recevieMeg", method = RequestMethod.GET)
	public void recevieMeg(@ModelAttribute("listCri") MessageListCri listCri, Model model) throws Exception {
		logger.info("----- 받은 쪽지함 recevieMeg() -----");

		// 현재 로그인 된 ID 가져오기
		String userID = (String) session.getAttribute("login");
		logger.info("user : " + userID);

		// 페이징 처리를 위한 설정
		MessagePageMaker pageMaker = new MessagePageMaker();
		listCri.setUserID(userID);
		int sPage = (listCri.getPage()-1)*10;
		listCri.setPage(sPage);
		pageMaker.setListCri(listCri);

		logger.info(listCri.toString());

		pageMaker.setListTotalCount(service.recevieCountPaging(userID));

		model.addAttribute("pageMaker", pageMaker);

		model.addAttribute("recevieList", service.recevieCri(listCri));
	}
}
