package com.webproject.essuyo.service;

import java.util.List;

import com.webproject.essuyo.domain.MessageListCri;
import com.webproject.essuyo.domain.MessageVO;

public interface MessageService {

	public void regist(MessageVO message) throws Exception;
	public MessageVO read(Integer megNum, String userID) throws Exception;
	public void remove(Integer megNum) throws Exception;
	
	// 전체 쪽지
	public List<MessageVO> listAll() throws Exception;
	public List<MessageVO> listCriteria(MessageListCri cri)throws Exception;
	public int listCountCriteria(MessageListCri cri)throws Exception;
	
	
	// 보낸, 받은 쪽지함 페이징처리
	public List<MessageVO> sendCri(MessageListCri listCri)throws Exception;
	public List<MessageVO> recevieCri(MessageListCri listCri)throws Exception;
	public int sendCountPaging(String userID) throws Exception;
	public int recevieCountPaging(String userID) throws Exception;
	
}
