package com.webproject.essuyo.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webproject.essuyo.service.CommentService;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ProductService;
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
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@RequestParam int start){
		ResponseEntity<Map<String, Object>> entity = null;	
		try {
			entity= new ResponseEntity<>(service.getList(start),HttpStatus.OK);
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
	
	@GetMapping("/disableDate/{productId}")
	public List<String> getProductDisableDate(@PathVariable int productId){

		return productService.getDisableDate(productId);

	}
	
	

}
