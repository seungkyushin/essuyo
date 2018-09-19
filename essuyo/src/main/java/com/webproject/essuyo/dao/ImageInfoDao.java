package com.webproject.essuyo.dao;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ImageInfoVO;

@Repository
public class ImageInfoDao {

	private NamedParameterJdbcTemplate jdbc;
	RowMapper<ImageInfoVO> rowMapper = new BeanPropertyRowMapper<>(ImageInfoVO.class);

	
	public ImageInfoDao(DataSource datasource){
		this.jdbc = new NamedParameterJdbcTemplate(datasource);
	}
	
	public ImageInfoVO selectById(int ImageInfoId) {
		Map<String,Integer> paramMap = new HashMap<>();
		paramMap.put("id", ImageInfoId);
		return jdbc.queryForObject("SELECT * FROM image_info WHERE id=:id", paramMap, rowMapper);
	}
}
