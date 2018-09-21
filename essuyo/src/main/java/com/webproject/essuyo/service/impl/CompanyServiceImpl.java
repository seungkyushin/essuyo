package com.webproject.essuyo.service.impl;



import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.CompanyDao;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Inject
	private CompanyDao dao;
	
	@Override
	public CompanyVO getCompany(int a) throws Exception {

		return null;
	}

	@Override
	public List<CompanyVO> listAll() throws Exception {
		return dao.listAll();
	}

}
