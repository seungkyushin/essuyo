package com.webproject.essuyo.service.impl;





import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.CompanyDao;
import com.webproject.essuyo.dao.FacilityAdminDao;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ImageAdminService;

@Service
public class CompanyServiceImpl implements CompanyService {

	private Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);
	
	@Autowired
	private CompanyDao companyDao;
	

	@Autowired
	private FacilityAdminDao facilityAdminDao;
	
	@Autowired
	private ImageAdminService imageAdminService;
	
	
	@Override
	public CompanyVO getCompany(int companyId) throws Exception {
		return companyDao.getCompany(companyId);
	}

	@Override
	public List<CompanyVO> listAll() throws Exception {
		return companyDao.listAll();
	}

	@Override
	public List<String> getCompanyFacility(int companyId) throws Exception {
		return facilityAdminDao.selectById(companyId);
	}

	@Override
	public List<String> getImagePath(int companyId) throws Exception {
		return imageAdminService.getImagePathList("company", companyId);
	}

	
}

