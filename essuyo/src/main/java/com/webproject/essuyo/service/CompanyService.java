package com.webproject.essuyo.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.SQLParamVO;

@Service
public interface CompanyService {

	
	public CompanyVO getCompany(int companyId) throws Exception;
	public List<CompanyVO> listAll(SQLParamVO param) throws Exception;
	public Map<String, Object> getList(int start) throws Exception;
	public List<String> getCompanyFacility(int companyId) throws Exception;
	
//	이미지 
	public List<String> getImagePath(int companyId) throws Exception;
	
}
