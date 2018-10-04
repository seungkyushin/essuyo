package com.webproject.essuyo.service;

import java.util.List;
import java.util.Map;

import com.webproject.essuyo.domain.CommentVO;

public interface CommentService {

	//< 덧글 리스트를 반환한다.
	public List<Map<String,Object>> getCommentList(String type, int id, int start);
	
	//public String getImagePath(String findType, int id);
	
	// 댓글 입력
	public void writerComment(CommentVO comment) throws Exception;
}
