package com.webproject.essuyo.service.impl;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.CompanyDao;
import com.webproject.essuyo.dao.FacilityAdminDao;
import com.webproject.essuyo.dao.ImageAdminDao;
import com.webproject.essuyo.dao.ImageInfoDao;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ImageAdminService;

@Service
public class CompanyServiceImpl implements CompanyService {

	private Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);
	
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private ImageInfoDao imageInfoDao;

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
	public Map<String, Object> getList(int ListId) {
		Map<String, Object> result = new HashMap<>();

		List<CompanyVO> list = null;
		List<Object> imageInfoList = null;

		try {

			//  리스트 정보
			list = companyDao.listAll();

			//  이미지 정보
			Map<String, Object> lists = new HashMap<>();		
			lists.put("id", ListId);
			imageInfoList = imageInfoDao.selectByImageId(ListId);
			
		} catch (Exception e) {
			logger.error("리스트 조회 실패");
		}
		
		result.put(null, imageInfoList);
		
		return result;
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

