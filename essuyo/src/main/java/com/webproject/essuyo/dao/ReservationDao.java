package com.webproject.essuyo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ReservationVO;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "mappers.Reservation";
	
	public int insert(ReservationVO reservationInfo) throws Exception{
		return sqlSession.insert(NAME_SPACE + ".insertData", reservationInfo);
	}
	
}
