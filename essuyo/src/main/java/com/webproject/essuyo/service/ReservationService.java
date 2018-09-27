package com.webproject.essuyo.service;

import java.util.List;
import java.util.Map;

import com.webproject.essuyo.domain.ReservationVO;

public interface ReservationService {

	//< 예약 등록
	public int regReservationInfo(ReservationVO reservationInfo) ;
	
	//< 예약 리스트
	public List<Map<String,Object>> getReservationList(String findType, int id, int start);
	public List<ReservationVO> getReservationListNotState(String findType, int id);
	public List<ReservationVO> getReservationListAll(String findType, int id);
	
	
	//< 총 지출 or 총 수입 (취소된 예약은 제외)
	public int getReservationTotalPrice(String findType, int id);
}
