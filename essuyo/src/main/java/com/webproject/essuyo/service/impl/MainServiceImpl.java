package com.webproject.essuyo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.MainDao;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.MainVO;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	private Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);
	
	@Autowired
	private MainDao mainDao;
	
	@Override
	public MainVO getMain(int a) throws Exception {

		return null;
	}
	
	@Override
	public List<MainVO> listOne() throws Exception {
		return mainDao.listOne();
	}
	
	public Map<String, Object> getList(int ListId) {
		Map<String, Object> result = new HashMap<>();

		List<MainVO> list = null;

		try {

			//  리스트 정보
			list = MainDao.listOne();

			
		} catch (Exception e) {
			logger.error("리스트 조회 실패");
		}
		
		return result;
	}
}
