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

	//로그인 기능을 해 준다. vo 객체에서 이메일과 비번을 받아서 dto에 배열로 넣어줌.
	public UserVO login(UserVO vo) throws Exception {
		
		String dto[] = {vo.getEmail(), vo.getPw()};
		return session.selectOne(namespace+".login", dto);
	}

	
	//로그인 유지 기능. 여유가 생기면 마저 손보고, 작동 안 하는데 시간이 없을 경우엔 삭제
	public void keepLogin(String email, String seesionId, Date next) {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("email", email);
		paraMap.put("sessionId", seesionId);
		paraMap.put("next", next);
		
		session.update(namespace+".keepLogin", paraMap);
		
	}

	// 세션키 체크 기능, 위의 로그인 유지 기능과 마찬가지
	public UserVO checkUserWithSessionkey(String value) {
		
		return session.selectOne(namespace+".checkUserWithSessionkey", value);
	}

}
