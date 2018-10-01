package com.webproject.essuyo.service;

import java.util.List;

import com.webproject.essuyo.domain.MessageCriteria;
import com.webproject.essuyo.domain.MessageVO;

public interface MessageService {

	public void regist(MessageVO message) throws Exception;
	public MessageVO read(Integer megNum) throws Exception;
	public void remove(Integer megNum) throws Exception;
	public List<MessageVO> listAll() throws Exception;
	public List<MessageVO> listCriteria(MessageCriteria cri)throws Exception;
	public int listCountCriteria(MessageCriteria cri)throws Exception;
	public List<MessageVO> sendMeg(String userID , int page) throws Exception;
	public List<MessageVO> recevieMeg(String userID, int page)throws Exception;
	
}
