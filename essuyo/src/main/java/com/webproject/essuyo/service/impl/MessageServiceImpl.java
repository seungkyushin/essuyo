package com.webproject.essuyo.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.MessageDao;
import com.webproject.essuyo.domain.MessageListCri;
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
	public MessageVO read(Integer megNum, String userID) throws Exception {
		
		dao.updateReadCheck(megNum, userID);
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
	public List<MessageVO> listCriteria(MessageListCri cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(MessageListCri cri) throws Exception {
		
		return dao.countPaging(cri);
	}
	
	
	
	// 보낸 쪽지함 페이징 처리	
	@Override
	public List<MessageVO> sendCri(MessageListCri listCri) throws Exception {
		
		return dao.sendCri(listCri);
	}

	// 받은 쪽지함 페이징 처리
	@Override
	public List<MessageVO> recevieCri(MessageListCri cri) throws Exception {
		
		return dao.recevieCri(cri);
	}
	
	// 받은 쪽지함 게시물 수 검색
	@Override
	public int sendCountPaging(String userID) throws Exception {
		
		return dao.sendCountPaging(userID);
	}
	
	// 받은 쪽지함 게시물 수 검색
	@Override
	public int recevieCountPaging(String userID) throws Exception {
		
		return dao.recevieCountPaging(userID);
	}
	

}
