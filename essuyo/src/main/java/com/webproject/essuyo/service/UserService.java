package com.webproject.essuyo.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.UserDAO;
import com.webproject.essuyo.domain.UserVO;

@Service
public class UserService {

	@Inject
	private UserDAO dao;

	//로그인 서비스
	public UserVO login(UserVO	vo) throws Exception {
		
		return dao.login(vo);
	}
	
	//회원가입 서비스
	public void regist(UserVO vo) throws Exception{
		
		dao.regist(vo);
	}

	
	public void keepLogin(String email, String seesionId, Date next) throws Exception {
		dao.keepLogin(email, seesionId, next);

	}

	
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionkey(value);
	}
}
