package com.webproject.essuyo.dao;

import java.util.Date;

import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.dto.LoginDTO;


public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String email, String seesionId, Date next);
	
	public UserVO checkUserWithSessionkey(String value);

}
