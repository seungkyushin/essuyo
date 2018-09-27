package com.webproject.essuyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.BusinessTypeVO;

@Repository
public class BusinessTypeDao {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SAPACE = "mappers.BusinessType";
	
	public List<BusinessTypeVO> selectAll() throws Exception{
		return sqlSession.selectList(NAME_SAPACE + ".selectAll");
	};
	
	public BusinessTypeVO selectById(int id) throws Exception{
		return sqlSession.selectOne(NAME_SAPACE + ".selectById" , id);
	};
	
	public int selectCount() throws Exception{
		return sqlSession.selectOne(NAME_SAPACE + ".selectCount");
	};

}
