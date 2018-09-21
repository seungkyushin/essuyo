package com.webproject.essuyo.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.CompanyVO;

@Repository
public class CompanyDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.webproject.essuyo.dao.CompanyDao";

	
	public CompanyVO getCompany(int a) throws Exception{
		return null;
		
	}
	public List<CompanyVO> listAll() throws Exception{
		return session.selectList(namespace+".listAll");
	}
	
}