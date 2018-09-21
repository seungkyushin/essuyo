package com.webproject.essuyo.controller;

import java.util.List;

import javax.inject.Inject;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.webproject.essuyo.domain.CompanyVO;
import com.webproject.essuyo.service.CompanyService;

@RestController
@RequestMapping(path = "/api")
public class RestApiController {
	
	@Inject
	private CompanyService service;

	
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
	
}
