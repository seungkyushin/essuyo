package com.webproject.essuyo.service.impl;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.LocalDate;
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
				reservationInfo.setState("성공");
				reservationInfo.setUserId(2);
				reservationInfo.setRegDate( new LocalDate().toString() );
			
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
					resultMap.put("resDate", data.getRegDate());
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
		List<ReservationVO> resultList = null;
		
			SQLParamVO params = new SQLParamVO(findType,id);

		try {
				resultList = reservationDao.select(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
	}

	@Override
	public int getReservationTotalPrice(String findType, int id) {
		
		int result = 0;
		SQLParamVO params = new SQLParamVO(findType,id);
		
		try {
				result = reservationDao.selectTotalPrice(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
		}
		
		return result;
	}

	@Override
	public List<ReservationVO> getReservationListNotState(String findType, int id) {
		SQLParamVO params = new SQLParamVO(findType,id);
		List<ReservationVO> resultList = null;
		try {
				resultList = reservationDao.selectNotState(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
		
	}

}
