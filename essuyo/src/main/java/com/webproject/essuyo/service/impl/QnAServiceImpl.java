package com.webproject.essuyo.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.QnADao;
import com.webproject.essuyo.domain.QnAVO;
import com.webproject.essuyo.service.QnAService;

@Service
public class QnAServiceImpl implements QnAService {

	@Inject
	private QnADao dao;

	@Override
	public void regist(QnAVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public QnAVO read(Integer id, String userId) throws Exception {
		return dao.read(id);
	}

	@Override
	public List<QnAVO> listAll() throws Exception {

		return dao.listAll();
	}
	
	@Override
	public void remove(Integer id) throws Exception{
		dao.delete(id);
	}

	@Override
	public void updateViewCount(Integer id) throws Exception {
		dao.updateViewCount(id);
		
	}

	
	
}
