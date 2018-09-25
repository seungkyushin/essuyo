package com.webproject.essuyo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.webproject.essuyo.domain.CommentVO;
import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.domain.ReservationVO;
import com.webproject.essuyo.service.CommentService;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ReservationService;

@RestController
@RequestMapping(path = "/api")
public class RestApiController {

	@Inject
	private CompanyService service;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<List<CompanyVO>> list(){
		ResponseEntity<List<CompanyVO>> entity = null;	
		try {
			entity= new ResponseEntity<>(service.listAll(),HttpStatus.OK);
		} catch (Exception e) {
     		e.printStackTrace();
     		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	/* Comment List를 반환한다.
	 * type : user, company 
	 * start : 페이지 단위(1페이지당  SEARCH_LIMIT)*/
	@GetMapping("/commentList/{type}/{start}/{id}")
	public List<Map<String, Object>> getCommentList(@PathVariable String type, @PathVariable int start,
			@PathVariable int id) {

		//< 요청자 화인
		
		return commentService.getCommentList(type, id,  start);
	}


	/* type : company, user
	 * start : 페이지 단위(1페이지당  SEARCH_LIMIT)
	 * */
	@GetMapping("/reservationList/{type}/{start}/{id}")
	public List<Map<String, Object>> getUserReservationList(@PathVariable String type, @PathVariable int start,
			@PathVariable int id){

		
		//< 요청자 화인
		
		return reservationService.getReservationList(type, id, start);
	}

}
