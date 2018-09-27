package com.webproject.essuyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FacilityAdminDao {


	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "mappers.FacilityAdmin";

	
	public List<String> selectById(int companyId) throws Exception{
		return sqlSession.selectList(NAME_SPACE + ".selectById" , companyId);
	}
	
}
