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

}
