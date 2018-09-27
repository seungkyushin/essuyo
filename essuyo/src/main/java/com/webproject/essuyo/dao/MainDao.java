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
	private static SqlSession session;
	
	private static String namespace = "com.webproject.essuyo.dao.MainDao";

	
	public MainVO getMain(int a) throws Exception{
		return null;
		
	}
	public static List<MainVO> listOne() throws Exception{
		return session.selectList(namespace+".listOne");
		
	}
	
}
