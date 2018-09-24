package com.webproject.essuyo.service;

import java.util.List;

import com.webproject.essuyo.domain.CommentVO;
import com.webproject.essuyo.domain.ImageInfoVO;

public interface CommentService {

	//< 덧글 리스트를 반환한다.
	public List<CommentVO> getCommentList(String type, int id);
	
	public List<ImageInfoVO> getImagePath(String type, int id);
}
