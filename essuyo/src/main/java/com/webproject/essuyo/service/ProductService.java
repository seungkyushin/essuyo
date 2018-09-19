package com.webproject.essuyo.service;

import com.webproject.essuyo.domain.ProductVO;

public interface ProductService {
	
	//< 상품 ID를 통해 상품 검색
	public ProductVO getProduct(int projecId);

}
