package com.webproject.essuyo.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.webproject.essuyo.domain.MainVO;

@Service
public interface MainService {
	
	public List<MainVO> getMain(int mainId) throws Exception;
	public List<MainVO> listAll() throws Exception;
}
