package com.webproject.essuyo.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.BusinessDao;
import com.webproject.essuyo.dao.UserDAO;
import com.webproject.essuyo.domain.BusinessVO;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.ImageAdminService;
import com.webproject.essuyo.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;
	
	@Autowired
	private BusinessDao businessDao;
	
	@Autowired
	private ImageAdminService imageAdminService;
	

	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
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
	public UserVO getUser(String email) {
		return dao.selectByEmail(email);
	}

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
	public Map<String, Object> getSaleUserInfo(int CompanyId) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		BusinessVO business = null;
		try {
				business = businessDao.selectByCompanyId(CompanyId);
			
				SQLParamVO params = new SQLParamVO("business",business.getId());
						
				UserVO user = dao.selectById(params);
				
				resultMap.put("id",user.getId());
				resultMap.put("name",user.getName());
				resultMap.put("image",imageAdminService.getImagePath(user.getImageInfoId()));
				resultMap.put("comment", business.getComment());
				resultMap.put("good", business.getGood());
		
		} catch (Exception e) {
			logger.error("유저 조회 오류.. {} ", e.toString());
		}
		
		 
		return resultMap;
	}

	@Override
	public void companyRegist(CompanyVO cvo) throws Exception {
		dao.companyRegist(cvo);
		
	}

	@Override
	public void businessRegist() throws Exception {
		dao.businessRegist();
		
	}

	@Override
	public void ownerRegist(UserVO vo) throws Exception {
		dao.ownerRegist(vo);
		
	}
	
	@Override
	public BusinessVO getBusinessInfo(String email) {
		
		UserVO user = dao.selectByEmail(email);
		
		try {
				return businessDao.selectById(user.getBusinessId());
		} catch (Exception e) {
			logger.error("유저 조회 오류.. {} ", e.toString());
			return null;
		}
				
		
	}
	// 메시지에서 받는 email 찾기 위한 service
	@Override
	public UserVO selectMessageEmail(String id) throws Exception {
		return dao.selectMessageEmail(id);

	}
}
