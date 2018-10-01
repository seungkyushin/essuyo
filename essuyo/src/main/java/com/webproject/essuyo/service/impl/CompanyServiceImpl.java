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



import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.SQLParamVO;
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
	public CompanyVO getCompany(int companyId)  {
		try {
			return companyDao.getCompany(companyId);
		} catch (Exception e) {
			logger.error("Company Table 조회 실패.. {}",e.toString());
			return null;
		}
	}

	@Override
	public List<CompanyVO> listAll(SQLParamVO param) throws Exception {
		return companyDao.listAll(param);
	}

	
	@Override
	public Map<String, Object> getList(int start) {
		Map<String, Object> resultMap = new HashMap<>();

		List<CompanyVO> list = null;
		List<String> imageInfoList = null;
		List<Object> salesList = new ArrayList<>();
		
		
		SQLParamVO param = new SQLParamVO();		
		param.setStart(start*4);
		param.setLimit(4);
		
		try {			
			list = companyDao.listAll(param);
			

		} catch (Exception e) {
			logger.error("리스트 조회 실패.. | {} ", e.toString());
		}
		
		
		for(CompanyVO data : list) {
			Map<String, Object> salesMap = new HashMap<>();
						
			salesMap.put("id", data.getId());
			salesMap.put("name",data.getName() );
			salesMap.put("type", data.getType());
			salesMap.put("discription",data.getDiscription() );
			salesMap.put("score", data.getScore());
			salesMap.put("address", data.getAddress());
			salesMap.put("number", data.getNumber());
			salesMap.put("url", data.getUrl());
			salesMap.put("state", data.getState());
			salesMap.put("time", data.getTime());
			salesMap.put("totalVisit", data.getTotalVisit());
			salesMap.put("todayVisit", data.getTodayVisit());
			salesMap.put("areaListId", data.getAreaListId());
	
	
			try {
				imageInfoList = this.getImagePath(data.getId());
			} catch (Exception e) {				
				logger.error("이미지 조회 실패");
			}		
			
			salesMap.put("image",imageInfoList);	
			salesList.add(salesMap);
		}
		
	
		resultMap.put("sales", salesList);
	
		
		return resultMap;
		
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

