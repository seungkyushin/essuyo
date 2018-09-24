package com.webproject.essuyo.service.impl;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.ReservationDao;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDao reservationDao;
	
	private int SEARCH_LIMIT = 3;
	
	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Override
	public int regReservationInfo(ReservationVO reservationInfo)  {
		int result = 0;
		try {

				DateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				reservationInfo.setState("성공");
				reservationInfo.setRegDate( dataFormat.format(new Date()) );
			
				System.out.println(reservationInfo);
				
				result = reservationDao.insert(reservationInfo);
		} catch (Exception e) {
			logger.error("예약 등록 실패.. | {} ", e.toString());
			result = 0;
		}
		
		return result;
	}

	@Override
	public List<ReservationVO> getReservationListAll(String findType, int start) {
		
		Map<String,Object> param = new HashMap<>();
		param.put("type", findType);
		param.put("id", 1);
		param.put("start", (start-1)*SEARCH_LIMIT);
		param.put("limit", SEARCH_LIMIT);
	
		try {
			  return reservationDao.select(param);
		} catch (Exception e) {
			logger.error("예약 등록 실패.. | {} ", e.toString());
		}
		
		return null;
	}

}
