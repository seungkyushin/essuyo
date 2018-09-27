package com.webproject.essuyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.domain.SQLParamVO;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "mappers.Reservation";
	
	public int insert(ReservationVO reservationInfo) throws Exception{
		return sqlSession.insert(NAME_SPACE + ".insert", reservationInfo);
	}
	
	public List<ReservationVO> select(SQLParamVO param) throws Exception{
		return sqlSession.selectList(NAME_SPACE + ".selectById", param);
	}
	
	
}
