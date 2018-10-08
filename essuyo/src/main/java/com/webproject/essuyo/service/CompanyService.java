package com.webproject.essuyo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.SQLParamVO;

@Service
public interface CompanyService {

	public CompanyVO getCompanyVO(int companyId);

	public Map<String, Object> getSimpleCompanyInfo(int companyId);

	public Map<String, Object> getDetailCompanyInfo(int companyId);
	
	public List<Map<String, Object>> getRankCompanyInfoList();
	
	//판매리스트
	public List<CompanyVO> listAll(SQLParamVO param) throws Exception;

	public Map<String, Object> getList(int start, String value, String type,int area_list_id) throws Exception;
	
	

	
	
	public List<String> getCompanyFacility(int companyId) throws Exception;

//	이미지 
	public List<String> getImagePath(int companyId) throws Exception;

}
