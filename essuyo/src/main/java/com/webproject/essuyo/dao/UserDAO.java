package com.webproject.essuyo.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.CompanyVO;
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
		// dto 맵에 이름, 이메일, 비번, 나이, 성별을 넣었다.
		Map<String, Object> dto = new HashMap<>();
		dto.put("name", vo.getName());
		dto.put("email", vo.getEmail());
		dto.put("password", vo.getPassword());
		dto.put("age", vo.getAge());
		dto.put("gender", vo.getGender());
		
		session.insert(namespace+".regist", dto);
	}
	
	//사업체 회원가입 기능.
	public void companyRegist(CompanyVO cvo) throws Exception{
		Map<String, Object> map = new HashMap<>();
		//map.put("companyName", cvo.getCompanyName());
		map.put("type", cvo.getType());
		map.put("discription", cvo.getName());
		map.put("address", cvo.getAddress());
		map.put("number", cvo.getNumber());
		map.put("url", cvo.getUrl());
		map.put("state", cvo.getState());
		map.put("time", cvo.getTime());
		
		session.insert(namespace+".companyRegist", map);
		
	}
	//비즈니스 테이블에 컴퍼니 아이디를 등록하는 기능
	//컴퍼니 아이디는 LAST_INSERT_ID()로 들어가서 파라미터는 불필요
	public void businessRegist() throws Exception{
		session.insert(namespace+".businessRegist");
	}
	
	//사업자(오너)의 회원가입 부분.
	//map에 넣는 건 같지만, 마찬가지로 business_id를 LAST_INSERT_ID()로 입력한다.
	public void ownerRegist(UserVO vo) throws Exception{
		Map<String, Object> dto = new HashMap<>();
		dto.put("name", vo.getName());
		dto.put("email", vo.getEmail());
		dto.put("password", vo.getPassword());
		dto.put("age", vo.getAge());
		dto.put("gender", vo.getGender());
		
		session.insert(namespace+".ownerRegist", dto);
		
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
	
	// 메시지에서 받는 email 찾기 위한 service
	public UserVO selectMessageEmail(String id) throws Exception {
		return session.selectOne(namespace + ".recevieID", id);
	}
	
	public int update(UserVO user) throws Exception {
		return session.update(namespace + ".update", user);
	}
	
	
	

}
