package com.webproject.essuyo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.CommentVO;

@Repository
public class CommentDao {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SAPACE = "mappers.Comment";
	
	public List<CommentVO> selectById(Map<String,Object> params) throws Exception{
		
		return sqlSession.selectList(NAME_SAPACE + ".selectById" , params);
	};
}
