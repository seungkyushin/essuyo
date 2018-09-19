package com.webproject.essuyo.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.UserVO;



@Repository
public class UserDAO {
	

	@Inject
	private SqlSession session;
	//네임스페이스에 매퍼 주소 변경해 줘야 함
	private static String namespace = "com.spring.mapper.UserMapper";

	
	public UserVO login(UserVO vo) throws Exception {
		
		String dto[] = {vo.getEmail(), vo.getPw()};
		return session.selectOne(namespace+".login", dto);
	}

	
	public void keepLogin(String email, String seesionId, Date next) {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("email", email);
		paraMap.put("sessionId", seesionId);
		paraMap.put("next", next);
		
		session.update(namespace+".keepLogin", paraMap);
		
	}

	
	public UserVO checkUserWithSessionkey(String value) {
		
		return session.selectOne(namespace+".checkUserWithSessionkey", value);
	}

}
