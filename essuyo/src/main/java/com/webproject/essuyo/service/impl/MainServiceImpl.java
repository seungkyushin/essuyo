package com.webproject.essuyo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.MainDao;
import com.webproject.essuyo.domain.MainVO;
import com.webproject.essuyo.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;
	
	
	@Override
	public List<MainVO> listAll() throws Exception {
		return mainDao.listAll();
	}
	
	@Override
	public List<MainVO> getMain(int mainId) throws Exception {
		
		return mainDao.getMain(mainId);
	}
	

}
