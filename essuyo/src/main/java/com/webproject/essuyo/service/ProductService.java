package com.webproject.essuyo.service;


import java.util.List;
import java.util.Map;

import com.webproject.essuyo.domain.ImageInfoVO;

public interface ProductService {
	
	//< 예약페이지 : 상품 ID를 통해 상품 검색
	public Map<String,Object> getProduct(int productId);
	
	public List<String> getImagePath(int productId);
}
