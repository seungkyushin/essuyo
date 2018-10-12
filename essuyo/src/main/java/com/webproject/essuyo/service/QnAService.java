package com.webproject.essuyo.service;

import java.util.List;

import com.webproject.essuyo.domain.QnAVO;

public interface QnAService {

	public void regist(QnAVO vo) throws Exception;

	public QnAVO read(Integer id, String userId) throws Exception;

	public List<QnAVO> listAll() throws Exception;

	public void remove(Integer id) throws Exception;
	
	public void updateViewCount(Integer id) throws Exception; 
	
}
