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
import com.webproject.essuyo.service.ImageAdminService;
import com.webproject.essuyo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	@Autowired
	private ImageAdminService imageAdminService;

	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Override
	public Map<String, Object> getProduct(int productId) {
		Map<String, Object> resultMap = new HashMap<>();

		try {
			ProductVO product = null;
			// < 상품 정보
			product = productDao.selectByProductId(productId);

			if (product != null) {

				resultMap.put("name", product.getName());
				resultMap.put("id", product.getId());
				resultMap.put("state", product.getCount() > 0 ? "예약가능" : "예약불가");
				resultMap.put("discription", product.getDiscription());
				resultMap.put("price", product.getPrice());
				resultMap.put("url", this.getImagePath(productId));
				
				return resultMap;
			}

		} catch (Exception e) {
			logger.error("상품 조회 실패.. | {} ", e.toString());
			return null;
		}
		return null;
	}

	@Override
	public List<String> getImagePath(int productId) {
		return imageAdminService.getImagePathList("product", productId);
	}

}
