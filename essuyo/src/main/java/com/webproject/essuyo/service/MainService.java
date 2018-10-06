package com.webproject.essuyo.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.CompanyVO;

@Service
public interface MainService {
	
	public List<CompanyVO> getMain() throws Exception;
	public Map<String,Object> getMainCount() throws Exception;
}
