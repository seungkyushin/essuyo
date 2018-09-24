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
import com.webproject.essuyo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;

	@Autowired
	ImageAdminDao imageAdminDao;

	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Override
	public Map<String, Object> getProduct(int productId) {
		Map<String, Object> resultParam = new HashMap<>();

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

		resultParam.put("name", product.getName());
		resultParam.put("state", product.getCount() > 0 ? "예약가능" : "예약불가");
		resultParam.put("discription", product.getDiscription());
		resultParam.put("price",product.getPrice());
	
		
		if( imageInfoList.size() == 1) {
			Map<String, Object> imageMap = new HashMap<>();
			imageMap.put("url", imageInfoList.get(0).getSavePath());
			imageMap.put("name", imageInfoList.get(0).getName());
			resultParam.put("image",imageMap);
		}else {
			Map<String, Object> imageMap = new HashMap<>();
			List<Object> imageList = new ArrayList<>();
			
			for( ImageInfoVO data: imageInfoList) {
				imageMap.put("url", data.getSavePath());
				imageMap.put("name", data.getName());
				imageList.add(imageMap);
				resultParam.put("image",imageList);
			}
		}

		return resultParam;
	}
	
	@Override
	public List<ImageInfoVO> getImagePath(int productId) {
		
		// < 이미지 정보
		Map<String, Object> params = new HashMap<>();
		params.put("type", "product");
		params.put("id", productId);

		try {
			 return imageAdminDao.selectImageById(params);
		} catch (Exception e) {
			logger.error("이미지 조회 실패.. | {} ", e.toString());
		}
		return null;
	}

}
