package com.webproject.essuyo.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;

@Service
public interface CompanyService {

	
	public CompanyVO getCompany(int a) throws Exception;
	public List<CompanyVO> listAll() throws Exception;
	Map<String, Object> getList(int ListId) throws Exception;
}
