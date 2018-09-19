package com.webproject.essuyo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ProductImageAdminVO;

@Repository
public class ImageAdminDao {
	
	private NamedParameterJdbcTemplate jdbc;
	RowMapper<ProductImageAdminVO> rowMapper = new BeanPropertyRowMapper<>(ProductImageAdminVO.class);

	
	public ImageAdminDao(DataSource datasource){
		this.jdbc = new NamedParameterJdbcTemplate(datasource);
	}
	
	public List<ProductImageAdminVO> selectProudctByProductId(int productId) {
		Map<String,Integer> paramMap = new HashMap<>();
		paramMap.put("id", productId);
		return jdbc.query("SELECT * FROM product_image_admin WHERE product_id=:id", paramMap,rowMapper);
	}

}
