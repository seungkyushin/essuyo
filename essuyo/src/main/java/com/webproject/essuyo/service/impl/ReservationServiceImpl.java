package com.webproject.essuyo.service.impl;

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
	
	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Override
	public int regReservationInfo(ReservationVO reservationInfo)  {
		int result = 0;
		try {
				reservationInfo.setState("성공");
				result = reservationDao.insert(reservationInfo);
		} catch (Exception e) {
			logger.error("예약 등록 실패.. | {} ", e.toString());
			result = 0;
		}
		
		return result;
	}

}
