package com.webproject.essuyo.service;

import java.util.Date;

import com.webproject.essuyo.domain.UserVO;

public interface UserService {
	
	public UserVO login(UserVO	vo) throws Exception;
	
	public void regist(UserVO	vo) throws Exception;
	
	public void keepLogin(String email, String seesionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value);

}
