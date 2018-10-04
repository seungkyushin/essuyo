package com.webproject.essuyo.service;

import java.util.Date;
import java.util.Map;


import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.BusinessVO;

import com.webproject.essuyo.domain.UserVO;

public interface UserService {
	
	public UserVO login(UserVO	vo) throws Exception;
	
	public void regist(UserVO	vo) throws Exception;
	
	public void companyRegist(CompanyVO cvo) throws Exception;
	
	public void businessRegist() throws Exception;
	
	public void ownerRegist(UserVO vo) throws Exception;
	
	public void keepLogin(String email, String seesionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value);
	
	public boolean checkId(String email);
	
	//컴퍼니 테이블에 정보 입력하는 서비스
	public void companyUpdate(CompanyVO cvo) throws Exception;
	
	//컴퍼니 테이블에 정보를 입력한 직후에 실해시켜서 비즈니스 테이블에 컴퍼니 아이디를 넣어주는 서비스
	public void cIdIntoBusiness(UserVO vo) throws Exception;

	public Map<String,Object> getSaleUserInfo(int CompanyId);
	
		public BusinessVO getBusinessInfo(String email);
	public BusinessVO getBusinessInfo(int BusinessId);

	
	public UserVO getUserVO(String email);
	public Map<String,Object> getUserInfo(String email);
	
	//< 판매자의 좋아요수를 올려준다.
	public int setGoodCount(String email);
	
	public int setUserInfo(UserVO user);	

	// 메시지에서 받는 email 찾기 위한 service
	public UserVO selectMessageEmail(String id) throws Exception;
	
	//이메일로 유저를 찾기
	public UserVO selectByEmail(String email);
	
	
	

}
