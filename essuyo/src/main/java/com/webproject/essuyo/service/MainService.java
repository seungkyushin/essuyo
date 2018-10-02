package com.webproject.essuyo.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;

@Service
public interface MainService {
	
	public List<CompanyVO> getMain() throws Exception;
	public Integer getMainCount() throws Exception;
}
