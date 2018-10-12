package com.webproject.essuyo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webproject.essuyo.domain.QnAReadVO;
import com.webproject.essuyo.domain.QnAVO;

@Repository
public class QnADao {

	@Inject
	private SqlSession session;

	private String namespace = "mappers.QnAMapper";

	public void create(QnAVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	public QnAVO read(Integer id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	public List<QnAVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	public void delete(Integer id) throws Exception {
		session.delete(namespace + ".delete", id);
	}	
	
	public void updateViewCount(Integer id) throws Exception{
		session.update(namespace + ".updateViewCount", id);
	}
}
