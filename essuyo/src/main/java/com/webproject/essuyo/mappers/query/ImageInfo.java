package com.webproject.essuyo.mappers.query;

public class ImageInfo {


	public static final String TABLE_NAME = "image_info";
	public static final String COLUMS = "id, save_path AS savePath, type, name, cre_date AS creDate, mod_date AS modDate";
	public static final String SELECT_ALL_BY_PRODUCTID = "SELECT " + COLUMS + " FROM " + TABLE_NAME
			+ " WHERE id = (SELECT image_info_id FROM product_image_admin WHERE product_id=#{id})";
	public static final String SELECT_ALL_BY_COMMENTID = "SELECT " + COLUMS + " FROM " + TABLE_NAME
			+ " WHERE id = (SELECT image_info_id FROM comment_image_admin WHERE comment_id=#{id})";
	public static final String SELECT_ALL_BY_COMPANYID = "SELECT " + COLUMS + " FROM " + TABLE_NAME
			+ " WHERE id = (SELECT image_info_id FROM company_image_admin WHERE company_id=#{id})";
}
