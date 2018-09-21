package com.webproject.essuyo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ImageInfoVO;


@Repository
public class ImageAdminDao {
	

	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "essuyo.mappers.ImageAdmin";
	
	public List<ImageInfoVO> selectImageById(Map<String,Object> param) throws Exception{
		return sqlSession.selectList(NAME_SPACE + ".selectById" , param);
	}
	
	
	

}
