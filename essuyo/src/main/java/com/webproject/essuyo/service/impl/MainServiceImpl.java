package com.webproject.essuyo.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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


	@Override
	public Map<String,Object> getMainCount() throws Exception {
		List<Map<String,Object>> resultMap = mainDao.getMainCount();
		Map<String,Object> tempMap = new HashMap<>();
		
		for(Map<String,Object> data : resultMap) {
			
			for(String key : data.keySet()) {
				if(key.equals("type") == true ) {
					data.get(key);
					
				} 
				else if(key.equals("count") == true ) {
					data.get(key);
				} 
				tempMap.put(key, data.values());
			}
			
			tempMap.put("펜션", 53453);
			resultMap.add(tempMap);
			System.out.println(tempMap);
		}
		
		return tempMap;
	}
	


}
