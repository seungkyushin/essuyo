package com.webproject.essuyo.service.impl;

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
import com.webproject.essuyo.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	
	@Autowired
	ImageAdminDao imageAdminDao;
	
	private Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Override
	public List<CommentVO> getCommentList(String type, int id) {
		List<CommentVO> resultList = null;
		Map<String,Object> params = new HashMap<>();
		params.put("type", type);
		params.put("id", id);
		try {
			resultList = commentDao.selectById(params);
		} catch (Exception e) {
			logger.error("댓글 조회 실패.. | {} ", e.toString());
		}
		
		return resultList;
	}

	@Override
	public List<ImageInfoVO> getImagePath(String type, int id) {

		List<ImageInfoVO> resultList = null;
		Map<String,Object> params = new HashMap<>();
		params.put("type", type);
		params.put("id", id);

		try {
			resultList = imageAdminDao.selectImageById(params);
		} catch (Exception e) {
			logger.error("이미지 조회 실패.. | {} ", e.toString());
		}
		return resultList;
	}

}
