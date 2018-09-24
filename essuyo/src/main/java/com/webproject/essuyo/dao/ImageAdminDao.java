package com.webproject.essuyo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.ImageInfoVO;


@Repository
public class ImageAdminDao {
	

	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "mappers.ImageAdmin";
	
	/* id에 관련된 이미지를 모두 찾아 온다.
	 * 사용 : Map에  key 값은 "type" 과 "id" 를 사용한다.
	 * type key : 필요 이미지를 찾기위해 넣는다. (ex : 유저의 이미지를 원하면 type key에 'user' )
	 * id key : type에 따른 id값을 넣는다. (ex : 유저의 이미지가 필요 함으로 유저의 id )
	 * */
	public List<ImageInfoVO> selectImageById(Map<String,Object> param) throws Exception{
		return sqlSession.selectList(NAME_SPACE + ".selectById" , param);
	}
	
	
	

}
