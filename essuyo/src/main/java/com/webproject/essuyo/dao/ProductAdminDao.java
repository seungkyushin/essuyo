package com.webproject.essuyo.dao;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ProductAdminVO;



@Repository
public class ProductAdminDao { 

	private NamedParameterJdbcTemplate jdbc;
	RowMapper<ProductAdminVO> rowMapper = new BeanPropertyRowMapper<>(ProductAdminVO.class);

	
	public ProductAdminDao(DataSource datasource){
		this.jdbc = new NamedParameterJdbcTemplate(datasource);
	}
	
	//< 상품 ID를 통해 상품 상품 관리정보를 받아 온다.
	public ProductAdminVO selectByProudctId(int productId) {	
		Map<String,Integer> paramMap = new HashMap<>();
		paramMap.put("id", productId);
		return jdbc.queryForObject("SELECT * FROM product_admin WHERE product_id=:id", paramMap, rowMapper);
	}
	
}

