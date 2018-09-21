package com.webproject.essuyo.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;

@Service
public interface CompanyService {

	
	public CompanyVO getCompany(int a) throws Exception;
	public List<CompanyVO> listAll() throws Exception;
}
