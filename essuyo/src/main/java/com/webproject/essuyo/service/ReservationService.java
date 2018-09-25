package com.webproject.essuyo.service;

import java.util.List;
import java.util.Map;

import com.webproject.essuyo.domain.ReservationVO;

public interface ReservationService {

	//< 예약 등록
	public int regReservationInfo(ReservationVO reservationInfo) ;
	
	//< 예약 리스트
	public List<Map<String,Object>> getReservationList(String findType, int id, int start);
	public List<ReservationVO> getReservationListAll(String findType, int id);
	
}
