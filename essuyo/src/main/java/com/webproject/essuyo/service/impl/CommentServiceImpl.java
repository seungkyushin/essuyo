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
import com.webproject.essuyo.service.ImageAdminService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ImageAdminService imageAdminService;
	
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
						//paramMap.put("state", data.getState());
						paramMap.put("score", data.getScore());
						paramMap.put("helpful", data.getHelpful());
						paramMap.put("userId", data.getUserId());

						if (type.equals("user") == true) {
							paramMap.put("imageUrl", "/resources/images/users/5.jpg");
						}else if (type.equals("company") == true) {
							paramMap.put("imageUrl", "/resources/images/users/6.jpg" );
						}
						
						resultList.add(paramMap);
					}
				//}
				
		} catch (Exception e) {
			logger.error("댓글 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
	}

	// 댓글 입력
	@Override
	public void writerComment(CommentVO comment) throws Exception {
		commentDao.create(comment);
		
	}

	/*@Override
	public String getImagePath(int id) {
		return imageAdminService.getImagePath(id);
	}*/

}
