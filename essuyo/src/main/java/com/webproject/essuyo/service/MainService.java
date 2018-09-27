package com.webproject.essuyo.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.MainVO;

@Service
public interface MainService {
	
	public MainVO getMain(int a) throws Exception;
	public List<MainVO> listOne() throws Exception;
	Map<String, Object> getList(int ListId) throws Exception;
}
