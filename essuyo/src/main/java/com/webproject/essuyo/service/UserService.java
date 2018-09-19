package com.webproject.essuyo.service;

import java.util.Date;

import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String uid, String seesionId, Date next) throws Exception;

	public UserVO checkLoginBefore(String value);

}
