package com.webproject.essuyo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.BusinessVO;

@Service
public class BusinessDao {

	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "mappers.Business";

	
	public BusinessVO selectByCompanyId(int companyId) throws Exception{
		return sqlSession.selectOne(NAME_SPACE + ".selectByCompanyId" , companyId);
	}
	
	public BusinessVO selectById(int id) throws Exception{
		return sqlSession.selectOne(NAME_SPACE + ".selectById" , id);
	}
	
}