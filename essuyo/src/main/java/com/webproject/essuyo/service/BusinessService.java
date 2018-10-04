package com.webproject.essuyo.service;


import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.BusinessVO;

@Service
public interface BusinessService {

	public BusinessVO selectById(int id) throws Exception;
	
}
