package com.webproject.essuyo.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.FacilityAdminDao;
import com.webproject.essuyo.service.FacilityAdminService;

@Service
public class FacilityAdminServiceImpl implements FacilityAdminService {
	
	private FacilityAdminDao fadao;

	@Override
	public void insertToAdmin(Map<String, Object> map) throws Exception {
		
		fadao.insertToAdmin(map);

	}

	@Override
	public void deleteFacAdmin(int companyId) throws Exception {
		
		fadao.deleteFacAdmin(companyId);		
	}

}
