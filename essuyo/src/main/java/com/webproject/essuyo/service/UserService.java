package com.webproject.essuyo.service;

import java.util.Date;
import java.util.Map;

import com.webproject.essuyo.domain.CompanyVO;
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
	
	public UserVO getUser(String email);

}
