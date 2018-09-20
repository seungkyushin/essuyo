package com.webproject.essuyo.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.SelectProvider;

import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.mappers.sqlprovider.ImageAdminSQLProvider;

public interface ImageAdminMapper {

		//< 회사별 상품리스트
		@SelectProvider(type=ImageAdminSQLProvider.class,method="makeSelectQuery")
		public ImageInfoVO getById(Map<String,Object> params);
		
}
