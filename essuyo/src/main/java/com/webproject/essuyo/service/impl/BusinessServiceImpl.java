package com.webproject.essuyo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.BusinessDao;
import com.webproject.essuyo.domain.BusinessVO;
import com.webproject.essuyo.service.BusinessService;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao bdao;

	//비지니스 아이디로 찾는 기능
	@Override
	public BusinessVO selectById(int id) throws Exception {
		
		return bdao.selectById(id);
	}

}
