package com.webproject.essuyo.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.MainVO;

@Repository
public class MainDao {
	
	@Inject
	private SqlSession session;
	private static String namespace = "com.webproject.essuyo.dao.MainDao";

	public List<MainVO> getMain(int mainId) throws Exception{
		return session.selectList(namespace + ".selectOne", mainId);
		
	}
	public List<MainVO> listAll() throws Exception{
		return session.selectList(namespace+".listAll");
		
	}
	
}
