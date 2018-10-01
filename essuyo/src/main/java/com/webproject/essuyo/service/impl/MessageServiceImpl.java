package com.webproject.essuyo.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.MessageDao;
import com.webproject.essuyo.domain.MessageCriteria;
import com.webproject.essuyo.domain.MessageListVO;
import com.webproject.essuyo.domain.MessageVO;
import com.webproject.essuyo.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDao dao;
	
	@Override
	public void regist(MessageVO message) throws Exception {
		dao.create(message);
	}

	@Override
	public MessageVO read(Integer megNum) throws Exception {
		dao.updateReadCheck(megNum);
		return dao.read(megNum);
	}

	@Override
	public void remove(Integer megNum) throws Exception {
	
		dao.delete(megNum);
	}

	@Override
	public List<MessageVO> listAll() throws Exception {
		
		return dao.listAll();
	}

	@Override
	public List<MessageVO> listCriteria(MessageCriteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(MessageCriteria cri) throws Exception {
		
		return dao.countPaging(cri);
	}
	
	
	@Override
	public List<MessageVO> sendMeg(String userID, int page) throws Exception {
		
		return dao.sendMeg(userID, page);
	}

	@Override
	public List<MessageVO> recevieMeg(String userID, int page) throws Exception {
		
		return dao.recevieMeg(userID, page);
	}
	
	

}
