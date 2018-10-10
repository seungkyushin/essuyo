package com.webproject.essuyo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webproject.essuyo.domain.MessageListCri;
import com.webproject.essuyo.service.CommentService;
import com.webproject.essuyo.service.CompanyService;
import com.webproject.essuyo.service.ImageAdminService;
import com.webproject.essuyo.service.MessageService;
import com.webproject.essuyo.service.ProductService;
import com.webproject.essuyo.service.ReservationService;
import com.webproject.essuyo.service.UserService;

@RestController
@RequestMapping(path = "/api")
public class RestApiController {

	@Inject
	private CompanyService companyService;	

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
		
	@Autowired
	private ImageAdminService imageAdminService;
	
	@Autowired
	private MessageService messageService;
	
	@Inject
	private HttpSession session;
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@RequestParam int start, @RequestParam String value, @RequestParam String type,@RequestParam String name){
		ResponseEntity<Map<String, Object>> entity = null;	
		
		try {
			entity= new ResponseEntity<>(companyService.getList(start,value,type,name),HttpStatus.OK);
			
		
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
	
	@GetMapping("/loginImage")
	public String getUserImagePath(HttpSession httpSeesion){

		String email = (String)httpSeesion.getAttribute("login");
		
		int imageInfoId = userService.getUserVO(email).getImageInfoId();
		
		return imageAdminService.getImagePath(imageInfoId);

	}
	
	@GetMapping("/good/{userId}")
	public Integer setGoodCount(@PathVariable int userId, HttpSession httpSeesion){

		String email = (String)httpSeesion.getAttribute("login");
		
		if( email != null ) {
			return userService.setGoodCount(userService.getUserVO(userId).getBusinessId());
		}
		return 0;
	}
	
	// 회원가입 시 이메일 중복 체크
		
		@RequestMapping(value = "/checkId", method = RequestMethod.POST)
		public Map<String, Object> checkId(String email) {
			Map<String, Object> map = new HashMap<>();

			if (userService.checkId(email)) {
				map.put("code", 99);
				map.put("msg", "사용가능한 이메일 입니다.");
				
			} else {
				map.put("code", -1);
				map.put("msg", "이미 등록된 이메일입니다.");
				
			}
			return map;
		}
		
		
		@GetMapping("/productList/{companyId}")
		public List<Map<String,Object>> getProductList(@PathVariable("companyId") int companyId){
		 
			return productService.getProductList(companyId);
	
		}
		
		@GetMapping("/product/{productId}")
		public Map<String,Object> getProduct(@PathVariable("productId") int productId){
			return productService.getProduct(productId);
		}
		
		@GetMapping("/getMessageList")
		public Map<String,Object> getSendMegList() throws Exception{
			
			String userID = (String) session.getAttribute("login");
			MessageListCri listCri = new MessageListCri();
			listCri.setUserID(userID);
			
			return messageService.getMegList(listCri);
			 
		}

}
