package com.webproject.essuyo.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.domain.UserVO;



@Repository
public class UserDAO {
	

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.webproject.essuyo.dao";

	//로그인 기능을 해 준다. vo 객체에서 이메일과 비번을 받아서 dto 맵에 넣어줌.
	public UserVO login(UserVO vo) throws Exception {
		Map<String, Object> dto = new HashMap<>();
		dto.put("email", vo.getEmail());
		dto.put("password", vo.getPassword());
		
		return session.selectOne(namespace+".login", dto);
	}

	//회원가입 기능. 
	public void regist(UserVO vo) throws Exception{
		// dto 맵에 이름, 이메일, 비번, 나이, 성별을 넣었다. 그냥, 파라미터로 받은 vo 객체를 바로 집어 넣어도 괜찮은지, 차후 테스트 요망
		Map<String, Object> dto = new HashMap<>();
		dto.put("name", vo.getName());
		dto.put("email", vo.getEmail());
		dto.put("password", vo.getPassword());
		dto.put("age", vo.getAge());
		dto.put("gender", vo.getGender());
		
		session.insert(namespace+".regist", dto);
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
	
	// 회원 가입 시 이메일 중복체크 기능
	public int checkId(String email) {
		
		return session.selectOne(namespace+".checkId", email);
	}
	
	public UserVO selectById(SQLParamVO params) {
		return session.selectOne(namespace + ".selectById", params);
	}
	
	public UserVO selectByEmail(String email) {
		return session.selectOne(namespace + ".selectByEmail", email);
	}
	
	public UserVO selectMessageEmail(String id) throws Exception {
		return session.selectOne(namespace + ".recevieID", id);
	}
	
	

}
