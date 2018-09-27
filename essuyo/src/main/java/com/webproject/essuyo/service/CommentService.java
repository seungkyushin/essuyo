package com.webproject.essuyo.service;

import java.util.List;
import java.util.Map;

import com.webproject.essuyo.domain.ImageInfoVO;

public interface CommentService {

	//< 덧글 리스트를 반환한다.
	public List<Map<String,Object>> getCommentList(String type, int id, int start);
	
	//public String getImagePath(String findType, int id);
}
