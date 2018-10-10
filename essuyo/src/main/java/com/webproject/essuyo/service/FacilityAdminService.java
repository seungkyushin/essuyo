package com.webproject.essuyo.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface FacilityAdminService {
	
	public void insertToAdmin(Map<String, Object> map) throws Exception;
	
	public void deleteFacAdmin(int companyId) throws Exception;

}
