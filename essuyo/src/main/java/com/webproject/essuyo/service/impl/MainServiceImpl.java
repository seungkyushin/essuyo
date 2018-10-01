package com.webproject.essuyo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.MainDao;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;
	
	
	@Override
	public List<CompanyVO> getMain() throws Exception {
		
		return mainDao.getMain();
	}
	


}
