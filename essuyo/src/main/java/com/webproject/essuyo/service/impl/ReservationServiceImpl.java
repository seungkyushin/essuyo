package com.webproject.essuyo.service.impl;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.ProductDao;
import com.webproject.essuyo.dao.ReservationDao;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private ProductDao productDao;
	
	private final int SEARCH_LIMIT = 5;
	
	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Override
	public int regReservationInfo(ReservationVO reservationInfo)  {
		int result = 0;
		try {

				DateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				reservationInfo.setState("성공");
				reservationInfo.setUserId(2);
				reservationInfo.setRegDate( dataFormat.format(new Date()) );
			
				System.out.println(reservationInfo);
				
				result = reservationDao.insert(reservationInfo);
		} catch (Exception e) {
			logger.error("예약 등록 실패.. | {} ", e.toString());
		}
		
		return result;
	}

	@Override
	public List<Map<String,Object>> getReservationList(String findType, int id, int start) {
		
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		
		SQLParamVO params = new SQLParamVO(findType,id,(start-1),SEARCH_LIMIT);

		try {
				List<ReservationVO> reservationList = reservationDao.select(params);
				
				for(ReservationVO data : reservationList) {
					Map<String,Object> resultMap =  new HashMap<>();
					
					if(findType.equals("user") == true)
						resultMap.put("typeName", "회사:" + data.getCompanyId());
					else if(findType.equals("company") == true){
						resultMap.put("typeName", "유저:" +  data.getUserId());
					}
					
					resultMap.put("productName", productDao.selectByProductId(data.getProductId()).getName());
					resultMap.put("resDate", data.getResDate());
					resultMap.put("state", data.getState());
					resultMap.put("totalPrice", data.getTotalPrice());
					
					resultList.add(resultMap);
	
				}
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
	}

	@Override
	public List<ReservationVO> getReservationListAll(String findType, int id) {
		List<ReservationVO> resultList = new ArrayList<ReservationVO>();
		
			SQLParamVO params = new SQLParamVO(findType,id);

		try {
				resultList = reservationDao.select(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
	}

}
