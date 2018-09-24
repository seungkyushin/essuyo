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
import com.webproject.essuyo.domain.UserVO;
import com.webproject.essuyo.service.CommentService;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.UserService;

@RestController
@RequestMapping(path = "/api")
public class RestApiController {

	@Inject
	private CompanyService service;

	@Autowired
	private CommentService commentService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<List<CompanyVO>> list() {
		ResponseEntity<List<CompanyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listAll(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/* Comment List를 반환한다.
	 * type : user, company 
	 * id : : userId, companyId*/
	@GetMapping("/commentList/{type}/{id}")
	public List<Map<String, Object>> getCommentList(@PathVariable String type, @PathVariable int id) {

		List<Map<String, Object>> resultList = new ArrayList<>();

		List<CommentVO> commentList = commentService.getCommentList(type, id);

		if (commentList != null) {

			if (type.equals("user") == true) {
				//UserVO userInfo = userService.getUserInfo(id);

				//if (userInfo != null) {
					for (CommentVO data : commentList) {
						Map<String, Object> paramMap = new HashMap<>();

						paramMap.put("title", data.getTitle());
						paramMap.put("content", data.getContent());
						paramMap.put("helpful", data.getHelpful());
						paramMap.put("regDate", data.getRegDate());
						paramMap.put("score", data.getScore());
						paramMap.put("state", data.getState());

						//paramMap.put("imageUrl", userService.userImage(id));

						resultList.add(paramMap);

					}
				//}
			} else if (type.equals("company") == true) {
				
				/*UserVO companyInfo = companyService.get(id);
				
				if (companyInfo != null) {
					for (CommentVO data : commentList) {
						Map<String, Object> paramMap = new HashMap<>();

						paramMap.put("title", data.getTitle());
						paramMap.put("content", data.getContent());
						paramMap.put("helpful", data.getHelpful());
						paramMap.put("regdate", data.getRegDate());
						paramMap.put("score", data.getScore());
						paramMap.put("state", data.getState());

						paramMap.put("image", companyInfo.getFail_password());

						resultList.add(paramMap);

					}
				}*/

			}
		}

		return resultList;
	}

}
