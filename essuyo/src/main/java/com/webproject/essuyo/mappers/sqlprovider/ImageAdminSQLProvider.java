package com.webproject.essuyo.mappers.sqlprovider;

import static com.webproject.essuyo.mappers.querystring.ImageInfo.*;

import java.util.Map;


public class ImageAdminSQLProvider {

	public String makeSelectQuery(Map<String,Object> params) {
		
		String resultSrc = "";
		String typeName= (String)params.get("type");		
		switch(typeName) {
			case "product":
				resultSrc = SELECT_ALL_BY_PRODUCTID;
				break;
				
			case "company":
				resultSrc = SELECT_ALL_BY_COMPANYID;
				break;
				
			case "comment":
				resultSrc = SELECT_ALL_BY_COMMENTID;
				break;
		}

		return resultSrc;
	}
}
