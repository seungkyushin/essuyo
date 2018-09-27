package com.webproject.essuyo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.CommentDao;
import com.webproject.essuyo.dao.ImageAdminDao;
import com.webproject.essuyo.domain.CommentVO;
import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ImageAdminDao imageAdminDao;
	
	private final int SEARCH_LIMIT = 5;
		
	private Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Override
	public List<Map<String,Object>> getCommentList(String type, int id, int start) {
		
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
			
		try {
				SQLParamVO params = new  SQLParamVO(type,id,(start-1),SEARCH_LIMIT);
				List<CommentVO> commentList = commentDao.selectById(params);
			
						
					//UserVO userInfo = userService.getUserInfo(id);

					//if (userInfo != null) {
					for (CommentVO data : commentList) {
						Map<String, Object> paramMap = new HashMap<>();

						paramMap.put("title", data.getTitle());
						paramMap.put("content", data.getContent());
						paramMap.put("regDate", data.getRegDate());
						paramMap.put("state", data.getState());

						if (type.equals("user") == true) {
							paramMap.put("imageUrl", this.getImagePath("company",data.getCompanyId()) );
						}else if (type.equals("company") == true) {
							paramMap.put("imageUrl", this.getImagePath("user",data.getUserId()) );
						}
						
						resultList.add(paramMap);
					}
				//}
				
		} catch (Exception e) {
			logger.error("댓글 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
	}

	@Override
	public List<ImageInfoVO> getImagePath(String type, int id) {

		List<ImageInfoVO> resultList = null;
		SQLParamVO params = new  SQLParamVO();
		params.setType(type);
		params.setId(id);

		try {
			resultList = imageAdminDao.selectImageById(params);
		} catch (Exception e) {
			logger.error("이미지 조회 실패.. | {} ", e.toString());
		}
		return resultList;
	}

}
