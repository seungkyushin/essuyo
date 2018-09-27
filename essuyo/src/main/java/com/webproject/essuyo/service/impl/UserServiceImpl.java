package com.webproject.essuyo.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.BusinessDao;
import com.webproject.essuyo.dao.ImageAdminDao;
import com.webproject.essuyo.dao.UserDAO;
import com.webproject.essuyo.domain.BusinessVO;
import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;
	
	@Autowired
	private BusinessDao businessDao;
	
	@Autowired
	private ImageAdminDao imageAdminDao;
	

	//로그인 서비스
	@Override
	public UserVO login(UserVO	vo) throws Exception {
		
		return dao.login(vo);
	}
	
	//회원가입 서비스
	@Override
	public void regist(UserVO	vo) throws Exception{
		
		dao.regist(vo);
	}

	
	@Override
	public void keepLogin(String email, String seesionId, Date next) throws Exception {
		dao.keepLogin(email, seesionId, next);

	}

	
	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionkey(value);
	}

	
	//이메일 중복 체크. 같은 이메일이 이미 DB에 존재하면 false, 아니면 true를 리턴
	@Override
	public boolean checkId(String email) {
		int emailCnt = dao.checkId(email);
		
		if(emailCnt > 0) {
			return false;
		} else {
		return true;
		}
	}

	@Override
	public Map<String, Object> test(int CompanyId) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		BusinessVO business = null;
		try {
				business = businessDao.selectByCompanyId(CompanyId);
			
				SQLParamVO params = new SQLParamVO("business",business.getId());
						
				UserVO user = dao.selectById(params);
				
				resultMap.put("id",user.getId());
				resultMap.put("name",user.getName());
				ImageInfoVO test = imageAdminDao.selectImageById(user.getImageInfoId());
				
				resultMap.put("image",test.getSavePath());
				resultMap.put("comment", business.getComment());
				resultMap.put("good", business.getGood());
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		return resultMap;
	}
}
