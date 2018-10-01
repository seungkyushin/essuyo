package com.webproject.essuyo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webproject.essuyo.dao.ProductDao;
import com.webproject.essuyo.dao.ReservationDao;
import com.webproject.essuyo.dao.UserDAO;
import com.webproject.essuyo.domain.ProductVO;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private UserDAO userDao;

	private final int SEARCH_LIMIT = 5;
	private final int CATEGORY_COUNT = 4;

	private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Override
	@Transactional
	public int regReservationInfo(String email, ReservationVO reservationInfo) {
		try {
			// < 상품의 개수를 계산
			ProductVO product = productDao.selectByProductId(reservationInfo.getProductId());
			// int resultCount = product.getCount() - reservationInfo.getProductCount();
			// if (resultCount >= 0) {

			// .setCount(resultCount);
			productDao.update(product);

			int userId = userDao.selectByEmail(email).getId();
			reservationInfo.setState("성공");
			reservationInfo.setUserId(userId);
			System.out.println(reservationInfo);

			return reservationDao.insert(reservationInfo);
			// } else {
			// return 0;
			// }

		} catch (Exception e) {
			logger.error("예약 등록 실패.. | {} ", e.toString());
			return 0;
		}

	}

	@Override
	public List<Map<String, Object>> getReservationList(String findType, int id, int start) {

		if (findType == null || findType.equals("") || id == 0 || start == 0) {
			return null;
		}

		SQLParamVO params = new SQLParamVO(findType, id, (start - 1), SEARCH_LIMIT);

		try {

			List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
			List<ReservationVO> reservationList = reservationDao.select(params);

			if (reservationList != null) {
				for (ReservationVO data : reservationList) {
					Map<String, Object> resultMap = new HashMap<>();

					if (findType.equals("user") == true)
						resultMap.put("typeName", "회사:" + data.getCompanyId());
					else if (findType.equals("company") == true) {
						resultMap.put("typeName", "유저:" + data.getUserId());
					}

					resultMap.put("productName", productDao.selectByProductId(data.getProductId()).getName());
					resultMap.put("resDate", data.getRegDate());
					resultMap.put("state", data.getState());
					resultMap.put("totalPrice", data.getTotalPrice());

					resultList.add(resultMap);
				}

				return resultList;
			}
			return null;
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
			return null;
		}

	}

	@Override
	public List<ReservationVO> getReservationListAll(String findType, int id) {

		if (findType == null || findType.equals("") || id == 0) {
			return null;
		}

		SQLParamVO params = new SQLParamVO(findType, id);

		try {
			return reservationDao.select(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
			return null;
		}

	}

	@Override
	public int getReservationTotalPrice(String findType, int id) {

		if (findType == null || findType.equals("") || id == 0) {
			return 0;
		}

		SQLParamVO params = new SQLParamVO(findType, id);

		try {
			return reservationDao.selectTotalPrice(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
			return 0;
		}

	}

	@Override
	public List<ReservationVO> getReservationListNotState(String findType, int id) {

		if (findType == null || findType.equals("") || id == 0) {
			return null;
		}

		SQLParamVO params = new SQLParamVO(findType, id);

		try {
			return reservationDao.selectNotState(params);
		} catch (Exception e) {
			logger.error("예약 조회 실패.. | {} ", e.toString());
			return null;
		}

	}

	@Override
	public List<Integer> getMonthlyPrice(String type, int id) {

		List<Integer> monthlyPrice = new ArrayList<Integer>(); // < 월별 지불/수입 리스트

		for (int i = 0; i < 12; i++) {
			monthlyPrice.add(0);
		}

		List<Map<String, Integer>> resultMap;
		try {
			resultMap = reservationDao.selectMonthlyPrice(new SQLParamVO(type, id));

			for (Map<String, Integer> data : resultMap) {
				int month = 0;
				int monthlyTotalPrice = 0;
				for (String key : data.keySet()) {
					if (key.equals("month") == true) {
						month = data.get(key).intValue();
					} else if (key.equals("monthlyTotalPrice") == true) {
						String test = String.valueOf(data.get(key));
						monthlyTotalPrice = Integer.parseInt(test);
					}
				}
				monthlyPrice.set(month, monthlyTotalPrice);

			}

			return monthlyPrice;
		} catch (Exception e) {
			logger.error("상품 월별 합계 조회 실패.. | {} ", e.toString());
			return null;
		}

	}

	@Override
	public List<Integer> getMonthlyReservationCount(String type, int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int getCategoryIndex(String category) {
		switch (category) {
		case "호텔":
			 return 0;
		case "렌트카":
			 return 1;
		case "박물관":
			 return 2;
		case "식당":
			 return 3;
		}
		
		return -1;
	}

	@Override
	public List<Integer> getCategoryReservationCount(String type, int id) {
		List<Integer> category = new ArrayList<Integer>(); // < 월별 지불/수입 리스트

		for (int i = 0; i < CATEGORY_COUNT; i++) {
			category.add(0);
		}

		List<Map<String, Object>> resultMap;

		try {
			resultMap = reservationDao.selectCategoryCount(new SQLParamVO(type, id));

			for (Map<String, Object> data : resultMap) {
				int categoryIndex = 0;
				int categroyCount = 0;
			
				for (String key : data.keySet()) {
					if (key.equals("productType") == true) {
						String categoryName = String.valueOf(data.get(key));
						categoryIndex = this.getCategoryIndex(categoryName);

					} else if (key.equals("count") == true) {
						String count = String.valueOf(data.get(key));
						categroyCount = Integer.parseInt(count);
					}
				}
				category.set(categoryIndex, categroyCount);

			}

			return category;
		} catch (Exception e) {
			logger.error("상품 월별 합계 조회 실패.. | {} ", e.toString());
			return null;
		}

	}

}
