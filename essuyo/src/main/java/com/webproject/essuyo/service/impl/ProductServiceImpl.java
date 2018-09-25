package com.webproject.essuyo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.ImageAdminDao;
import com.webproject.essuyo.dao.ProductDao;
import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.domain.ProductVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	@Autowired
	private ImageAdminDao imageAdminDao;

	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Override
	public Map<String, Object> getProduct(int productId) {
		Map<String, Object> resultMap = new HashMap<>();

		ProductVO product = null;
		List<ImageInfoVO> imageInfoList = null;

		try {

			// < 상품 정보
			product = productDao.selectByProductId(productId);

			//< 이미지 리스트
			imageInfoList = this.getImagePath(productId);

		} catch (Exception e) {
			logger.error("상품 조회 실패.. | {} ", e.toString());
		}

		resultMap.put("name", product.getName());
		resultMap.put("id", product.getId());
		resultMap.put("state", product.getCount() > 0 ? "예약가능" : "예약불가");
		resultMap.put("discription", product.getDiscription());
		resultMap.put("price",product.getPrice());
	
		
	
		
		List<Object> imageList = new ArrayList<>();
			
		for( ImageInfoVO data: imageInfoList) {
			Map<String, Object> imageMap = new HashMap<>();
			imageMap.put("url", data.getSavePath());
			imageMap.put("name", data.getName());
			imageList.add(imageMap);
		}
		resultMap.put("image",imageList);
		

		return resultMap;
}
	
	@Override
	public List<ImageInfoVO> getImagePath(int productId) {
		
		List<ImageInfoVO> resultList = null;
		// < 이미지 정보
		SQLParamVO params = new  SQLParamVO();
		params.setType("product");
		params.setId(productId);


		try {
			resultList = imageAdminDao.selectImageById(params);
		} catch (Exception e) {
			logger.error("이미지 조회 실패.. | {} ", e.toString());
		}
		return resultList;
	}

}
