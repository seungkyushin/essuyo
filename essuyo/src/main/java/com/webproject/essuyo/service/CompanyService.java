package com.webproject.essuyo.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;

@Service
public interface CompanyService {

	
	public CompanyVO getCompany(int companyId) throws Exception;
	public List<CompanyVO> listAll() throws Exception;
	
	public List<String> getCompanyFacility(int companyId) throws Exception;
	List<String> getImagePath(int companyId) throws Exception;
	
}
