package com.webproject.essuyo.service;


import java.util.List;
import java.util.Map;


public interface ProductService {
	
	//< 예약페이지 : 상품 ID를 통해 상품 검색
	public Map<String,Object> getProduct(int productId);
	
	public List<Map<String,Object>> getProductList(int companyId);
	
	public List<String> getImagePath(int productId);
	
	public List<String> getDisableDate(int productId);
	
}
