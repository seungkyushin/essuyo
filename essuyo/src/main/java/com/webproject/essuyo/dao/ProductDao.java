package com.webproject.essuyo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ProductVO;

@Repository
public class ProductDao { 

	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "mappers.ProductMapper";
	
	public ProductVO selectProductByProductId(int id) throws Exception{
		return sqlSession.selectOne(NAME_SPACE + ".getById" , id);
	}
	

	

	
}