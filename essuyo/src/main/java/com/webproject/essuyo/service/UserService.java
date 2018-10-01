package com.webproject.essuyo.service;

import java.util.Date;
import java.util.Map;

import com.webproject.essuyo.domain.BusinessVO;
import com.webproject.essuyo.domain.UserVO;

public interface UserService {
	
	public UserVO login(UserVO	vo) throws Exception;
	
	public void regist(UserVO	vo) throws Exception;
	
	public void keepLogin(String email, String seesionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value);
	
	public boolean checkId(String email);

	public Map<String,Object> getSaleUserInfo(int CompanyId);
	
	public BusinessVO getBusinessInfo(String email);
	
	public UserVO getUser(String email);
	


}
