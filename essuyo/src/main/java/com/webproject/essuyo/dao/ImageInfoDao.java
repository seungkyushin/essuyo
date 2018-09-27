package com.webproject.essuyo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ImageInfoDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.webproject.essuyo.dao.ImageInfoDao";
	
	public List<Object> selectByImageId(int id) throws Exception{
		return session.selectList(namespace+".listAll", id);
	}

}
