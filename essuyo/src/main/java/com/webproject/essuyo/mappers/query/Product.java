package com.webproject.essuyo.mappers.query;

public class Product {

	public static final String TABLE_NAME = "product";
	public static final String COLUMS = "id, name, count, discription, price";
	public static final String SELECT_BY_ID = "SELECT " + COLUMS + " FROM " + TABLE_NAME
														+ " WHERE id=#{id}";

}
