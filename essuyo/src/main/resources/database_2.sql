/* 테이블 생성할 때 제약조건을 기입하는 방식입니다.
 * 생성할 때 값들이 적용되므로 테이블 생성에 있어 순서가 존재합니다. */

DROP DATABASE essuyo;
CREATE DATABASE essuyo;
USE essuyo;

/* 사용가능시설목록 */
CREATE TABLE facility (
	id INTEGER PRIMARY KEY auto_increment,	/* 번호 */
	name VARCHAR(255) NOT NULL				/* 이름 */
)DEFAULT CHARSET=utf8; 

/* 지역명목록 */
CREATE TABLE area_list (
	id INTEGER PRIMARY KEY auto_increment,	/* 번호 */
	name VARCHAR(255) NOT NULL				/* 이름 */
)DEFAULT CHARSET=utf8; 

/* 상품 */
CREATE TABLE product (
	id INTEGER PRIMARY KEY auto_increment,		/* 번호 */
	name VARCHAR(255) NOT NULL,					/* 이름 */
	sale_start_date DATE NOT NULL,				/* 판매시작일 */
	sale_end_date DATE NOT NULL,				/* 판매종료일 */
	discription VARCHAR(255) NOT NULL,			/* 설명 */
	price INTEGER NOT NULL						/* 가격 */
)DEFAULT CHARSET=utf8; 

/* 상품 재고 */
CREATE TABLE product_manager (
	id INTEGER PRIMARY KEY auto_increment,	/* 번호 */
	sale_date DATE NOT NULL,				/* 판매일 */
	count INTEGER NOT NULL,					/* 개수 */
	product_id INTEGER NOT NULL,			/* 상품번호 */
	
	FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE 
)DEFAULT CHARSET=utf8; 



/* 이미지파일정보 */
CREATE TABLE image_info (
	id INTEGER PRIMARY KEY auto_increment,	/* 번호 */
	save_path VARCHAR(255) NOT NULL, 		/* 저장위치 */
	type VARCHAR(255) NOT NULL,				/* 종류 */
	name VARCHAR(255) NOT NULL,				/* 이름 */
	cre_date DATE NOT NULL,					/* 생성날짜 */
	mod_date DATE							/* 수정_날짜 */
)DEFAULT CHARSET=utf8; 


/* 업체 목록 */
CREATE TABLE company (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	type VARCHAR(255) NOT NULL, /* 회사 종류*/
	discription VARCHAR(255), /* 설명 */
	score  DECIMAL(2,1), /* 점수 */
	address VARCHAR(255) NOT NULL, /* 주소 */
	number VARCHAR(255) NOT NULL, /* 전화번호 */
	homepage VARCHAR(255), /* 홈페이지 */
	state VARCHAR(255) NOT NULL, /* 영업상태 */
	time VARCHAR(255) NOT NULL, /* 영업시간 */
    lat double NOT NULL,  /* 맵좌표(x) */
    lon double NOT NULL,  /* 맵좌표(y) */
	area_list_id INTEGER , /* 지역명목록번호 */
	
	FOREIGN KEY (area_list_id) REFERENCES area_list(id)
)DEFAULT CHARSET=utf8; 


/* 사업 */
CREATE TABLE business (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	good INTEGER, /* 좋아요 */
	comment VARCHAR(255), /* 한마디 */
	company_id INTEGER, /* 상점번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id)
)DEFAULT CHARSET=utf8; 


/* 사용자 */
CREATE TABLE user (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	age INTEGER NOT NULL, /*나이*/
	gender VARCHAR(255) NOT NULL, /*성별*/
	email VARCHAR(255) UNIQUE NOT NULL, /* 이메일 */
	password VARCHAR(255) NOT NULL, /* 비밀번호 */
	fail_password INTEGER NOT NULL, /* 비밀번호실패 */
	cre_date DATE NOT NULL, /* 생성날짜 */
	last_date DATE, /* 마지막로그인날짜 */
	business_id INTEGER, /* 사업번호 */
	image_info_id INTEGER,
	sessionkey varchar(50) not null default 'none', /*세션키*/
	sessionlimit timestamp, /*세션유효기간*/
	
	FOREIGN KEY (business_id) REFERENCES business(id),
	FOREIGN KEY (image_info_id) REFERENCES image_info(id)
)DEFAULT CHARSET=utf8; 

/* 덧글 */
CREATE TABLE comment (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	title VARCHAR(255) NOT NULL, /* 제목 */
	content  VARCHAR(255), /* 내용 */
	helpful INTEGER, /* 도움점수 */
	score INTEGER NOT NULL, /* 점수 */
	mod_date DATE, /* 수정날짜 */
	reg_date timestamp not null default now(), /* 등록날짜 */
	user_id INTEGER NOT NULL,/* 사용자번호 */
	company_id INTEGER NOT NULL,/* 회사번호 */
	
	CONSTRAINT chk_score CHECK (score > 0 AND score <=5),
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 메시지 */
CREATE TABLE message (
	megNum INTEGER PRIMARY KEY auto_increment, /* 번호 */
	title VARCHAR(255) NOT  NULL, /* 제목 */	
	content TEXT, /* 내용 */
	send_date timestamp not null default now(), /* 보낸날짜 */	
	read_check INTEGER , /* 읽음확인 */
	user_id VARCHAR(255) NOT NULL, /* 발송자 사용자번호 */
    receiver_id VARCHAR(255) NOT NULL, /* 수신자 사용자번호 */	
	
    FOREIGN KEY (user_id) REFERENCES user(email) ON DELETE CASCADE,
	FOREIGN KEY (receiver_id) REFERENCES user(email) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/*공지사항*/
CREATE TABLE notice (
	noticeNum INTEGER PRIMARY KEY auto_increment, /* 번호 */
	title VARCHAR(255) NOT  NULL, /* 제목 */	
	content TEXT, /* 내용 */
	reg_date timestamp not null default now(), /* 등록날짜 */	
	user_id VARCHAR(255) NOT NULL, /* 작성자 사용자번호 */	
	
    FOREIGN KEY (user_id) REFERENCES user(email) ON DELETE CASCADE,
)DEFAULT CHARSET=utf8; 

/* 상품관리 */
CREATE TABLE product_admin (
	id INTEGER PRIMARY KEY auto_increment, /*상품 관리 번호*/
	company_id INTEGER, /* 사업종류번호 */
	product_id INTEGER,
	
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

/* 사용가능시설 */
CREATE TABLE facility_admin (
	company_id INTEGER , /* 회사번호 */
	facility_id INTEGER,  /* 사용가능시설목록번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
	FOREIGN KEY (facility_id) REFERENCES facility(id) ON DELETE CASCADE
);


/* 회사이미지관리 */
CREATE TABLE company_image_admin (
	id INTEGER PRIMARY KEY auto_increment, /*회사이미지관리 번호*/
	company_id INTEGER, /* 회사번호 */
	image_info_id INTEGER, /* 이미지정보번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8;

/* 상품이미지관리 */
CREATE TABLE product_image_admin (
	id INTEGER PRIMARY KEY auto_increment, /*상품 관리 번호*/
	product_id INTEGER, /* 상품 번호 */
	image_info_id INTEGER, /* 이미지 관리 번호 */
	
	FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 덧글이미지관리 */
CREATE TABLE comment_image_admin (
	id INTEGER PRIMARY KEY auto_increment, /*덧글이미지관리 번호*/
	image_info_id INTEGER, /* 이미지정보번호 */
	comment_id INTEGER, /* 덧글번호 */
	
	FOREIGN KEY (comment_id) REFERENCES comment(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 


/* 예약 */
CREATE TABLE reservation (
	id INTEGER PRIMARY KEY  auto_increment, /* 번호 */
	state VARCHAR(255) NOT NULL, /* 상태 */
	product_type VARCHAR(255) NOT NULL,
	total_price INTEGER NOT NULL, /* 총가격 */
	res_date DATE NOT NULL, /* 예약한날짜 */
	product_count INTEGER NOT NULL, /* 상품 개수 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	company_id INTEGER , /* 회사_번호 */
	product_id INTEGER , /* 상품_번호 */
	user_id INTEGER ,  /* 사용자_번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id),
	FOREIGN KEY (product_id) REFERENCES product(id),
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 


/*********************************************************************************/
/************************************ 데이터 입력 ************************************/
/*********************************************************************************/


/*이미지*/
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/hotel.jpg","image/jpg","hotel.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/car.jpg","image/jpg","car.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/food.jpg","image/jpg","food.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/museum.jpg","image/jpg","museum.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/users/1.jpg","image/jpg","1.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/users/2.jpg","image/jpg","user2.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/users/3.jpg","image/jpg","user3.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/menu-hotel.jpg","image/jpg","menu-hotel.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/reserve-slide3.jpg","image/jpg","reserve-slide3.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/reserve-slide2.jpg","image/jpg","reserve-slide2.jpg", now());

/*company list*/
insert into image_info(save_path,type,name,cre_date) values("/resources/images/hotel1.png","image/png","hotel1",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/hotel2.png","image/png","hotel2",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/hotel3.png","image/png","hotel3",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/hotel4.png","image/png","hotel4",now());

insert into image_info(save_path,type,name,cre_date) values("/resources/images/food1.png","image/png","food1",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/food2.png","image/png","food2",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/food3.png","image/png","food3",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/food4.png","image/png","food4",now());

insert into image_info(save_path,type,name,cre_date) values("/resources/images/pa1.png","image/png","pa1",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/pa2.png","image/png","pa2",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/pa3.png","image/png","pa3",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/pa4.png","image/png","pa4",now());

insert into image_info(save_path,type,name,cre_date) values("/resources/images/car1.png","image/png","car1",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/car2.png","image/png","car2",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/car3.png","image/png","car3",now());
insert into image_info(save_path,type,name,cre_date) values("/resources/images/car4.png","image/png","car4",now());

/* 지역명목록 */
INSERT INTO area_list (name)  VALUES("서울");
INSERT INTO area_list (name)  VALUES("부산");
INSERT INTO area_list (name)  VALUES("광주");
INSERT INTO area_list (name)  VALUES("강원도");



INSERT INTO facility(name)  VALUES("주차공간");
INSERT INTO facility(name)  VALUES("와이파이/인터넷");
INSERT INTO facility(name)  VALUES("금연구역");
INSERT INTO facility(name)  VALUES("신용카드");


/* 업체 */
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("힐튼호텔1", "호텔", 9.0 , "돈만 있으면 쾌적한 곳1", "서울특별시 기장군 기장읍 기장해안로 268-32 힐튼서울","010-1111-1111",
"http://hiltonbusan1.co.kr/","영업중","ALL TIME",37.556388,126.945200,1);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("힐튼호텔2", "호텔", 7.0 , "돈만 있으면 쾌적한 곳2", "부산광역시 기장군 기장읍 기장해안로 268-32 힐튼부산","010-2222-2222",
"http://hiltonbusan2.co.kr/","영업중","ALL TIME",37.556455,126.944741,2);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("힐튼호텔3", "호텔", 6.0 , "돈만 있으면 쾌적한 곳3", "광주광역시 기장군 기장읍 기장해안로 268-32 힐튼광주","010-3333-3333",
"http://hiltonbusan.co.kr/","영업종료","ALL TIME",37.556855,126.944585,3);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("힐튼호텔4", "호텔", 2.0 , "돈만 있으면 쾌적한 곳4", "강원도 기장군 기장읍 기장해안로 268-32 힐튼강원도","010-4444-4444",
"http://hiltonbusan.co.kr/","영업종료","ALL TIME",37.556929,126.945242,4);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("식당1", "식당", 9.0 , "빵 맛있는 식당", "서울 서대문구 연세로12길 33","02-1111-1111",
"http://outback1.co.kr/shinchon/","영업중","am 10:00 ~ pm 10:00",37.556388,126.945200,1);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("식당2", "식당", 7.0 , "빵 맛있는 식당", "부산 서대문구 연세로12길 33","02-2222-2222",
"http://outback2.co.kr/shinchon/","영업중","am 10:00 ~ pm 10:00",37.556455,126.944741,2);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("식당3", "식당", 6.0 , "빵 맛있는 식당", "광주 서대문구 연세로12길 33","02-3333-3333",
"http://outback3.co.kr/shinchon/","영업종료","am 10:00 ~ pm 10:00",37.556855,126.944585,3);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("식당4", "식당", 2.0 , "빵 맛있는 식당", "강원도 서대문구 연세로12길 33","02-4444-4444",
"http://outback4.co.kr/shinchon/","영업종료","am 10:00 ~ pm 10:00",37.556929,126.945242,4);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("박물관1", "박물관", 9.0 , "알밥파는 집11", "서울 서대문구 이화여대7길 14","02-111-111",
"http://alchon1.com/","영업중","am 10:00 ~ pm 10:00",37.556388,126.945200,1);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("박물관2", "박물관", 7.0 , "알밥파는 집2", "부산 서대문구 이화여대7길 14","02-222-222",
"http://alchon2.com/","영업중","am 10:00 ~ pm 10:00",37.556455,126.944741,2);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("박물관3", "박물관", 6.0 , "알밥파는 집3", "광주 서대문구 이화여대7길 14","02-333-333",
"http://alchon3.com/","영업종료","am 10:00 ~ pm 10:00",37.556855,126.944585,3);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("박물관4", "박물관", 2.0 , "알밥파는 집4", "강원도 서대문구 이화여대7길 14","02-444-444",
"http://alchon4.com/","영업종료","am 10:00 ~ pm 10:00",37.556929,126.945242,4);


INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("쏘카1", "렌트카", 9.0 , "카 쉐어1", "서울 서대문구 남가좌동 7길 14","02-11-11",
"http://socar1.com/","영업중","am 10:00 ~ pm 10:00",37.556388,126.945200,1);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("쏘카2", "렌트카", 7.0 , "카 쉐어2", "부산 서대문구 남가좌동 7길 14","02-22-22",
"http://socar2.com/","영업중","am 10:00 ~ pm 10:00",37.556455,126.944741,2);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("쏘카3", "렌트카", 6.0 , "카 쉐어3", "광주 서대문구 남가좌동 7길 14","02-33-33",
"http://socar3.com/","영업종료","am 10:00 ~ pm 10:00",37.556855,126.944585,3);

INSERT INTO company(name, type, score, discription, address,number, homepage, state, time,lat,lon, area_list_id)
VALUES("쏘카4", "렌트카", 2.0 , "카 쉐어4", "강원도 서대문구 남가좌동 7길 14","02-44-44",
"http://socar4.com/","영업종료","am 10:00 ~ pm 10:00",37.556929,126.945242,4);




INSERT INTO facility_admin(company_id, facility_id) VALUES(1,1);
INSERT INTO facility_admin(company_id, facility_id) VALUES(1,3);
INSERT INTO facility_admin(company_id, facility_id) VALUES(1,4);


INSERT INTO facility_admin(company_id, facility_id) VALUES(2,1);
INSERT INTO facility_admin(company_id, facility_id) VALUES(2,2);
INSERT INTO facility_admin(company_id, facility_id) VALUES(2,4);

INSERT INTO facility_admin(company_id, facility_id) VALUES(3,1);
INSERT INTO facility_admin(company_id, facility_id) VALUES(3,3);
INSERT INTO facility_admin(company_id, facility_id) VALUES(3,4);

INSERT INTO facility_admin(company_id, facility_id) VALUES(4,1);
INSERT INTO facility_admin(company_id, facility_id) VALUES(4,2);

/* 사업 */
INSERT INTO business(good,comment,company_id) VALUES(10, "힐튼호텔", 1);
INSERT INTO business(good,comment,company_id) VALUES(10, "아웃백-신촌점", 2);
INSERT INTO business(good,comment,company_id) VALUES(10, "알촌", 3);

/*유저*/
INSERT INTO user(name, age, gender, email, password,fail_password,
cre_date,business_id,image_info_id) VALUES("이써요", 10,"남","test@essuyo.com",
"1234",3,now(),1,5);

INSERT INTO user(name, age, gender, email, password,fail_password,
cre_date,image_info_id) VALUES("이써요2", 20,"남","test@esy.com",
"1234",3,now(),6);

INSERT INTO user(name, age, gender, email, password,fail_password,
cre_date,image_info_id) VALUES("이써요3", 30,"남","test3@essuyo.com",
"1234",3,now(),7);



/*상품*/
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price)
VALUES("비싼 호텔", "2018-10-01","2018-10-15", "한국에서 가장 비싼 호텔입니다.",1000000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) 
VALUES("람보르기니 SUV", "2018-10-01","2018-10-30", "람보르기니기니",300000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) 
VALUES("돈까스 맛집", "2018-10-01","2018-11-01", "돈까스 장인이 매일 직접 만들어 판매합니다.",7000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price)
VALUES("박물관이 살아있다.", "2018-10-01","2018-10-15",  "영화 아님",4000);


/*상품 관리*/
INSERT INTO product_admin(company_id,product_id) VALUES(1,1);
INSERT INTO product_admin(company_id,product_id) VALUES(1,2);
INSERT INTO product_admin(company_id,product_id) VALUES(2,3);
INSERT INTO product_admin(company_id,product_id) VALUES(2,4);

/*상품 제고*/
INSERT INTO product_manager(sale_date,count,product_id) VALUES
("2018-10-01",1,1),("2018-10-02",1,1),("2018-10-03",0,1),("2018-10-04",1,1),("2018-10-05",1,1),
("2018-10-06",1,1),("2018-10-07",1,1),("2018-10-08",1,1),("2018-10-09",1,1),("2018-10-10",0,1),
("2018-10-11",1,1),("2018-10-12",1,1),("2018-10-13",1,1),("2018-10-14",1,1),("2018-10-15",1,1);


/*회사 이미지*/
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(1, 11);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(2, 12);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(3, 13);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(4, 14);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(5, 15);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(6, 16);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(7, 17);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(8, 18);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(9, 19);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(10, 20);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(11, 21);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(12, 22);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(13, 23);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(14, 24);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(15, 25);
INSERT INTO company_image_admin(company_id,image_info_id) VALUES(16, 26);

/*상품 이미지 관리*/
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(1, 1);
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(1, 8);
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(1, 9);
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(2, 2);
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(3, 3);
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(4, 4);


/*덧글*/
INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 1", "이써요이써요이써요이써요", 0, 1.0,"2018-09-21",2,1);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 2", "이써요이써요이써요이써요", 0, 2.0,"2018-09-21",3,1);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 3", "이써요이써요이써요이써요", 0, 5.0,"2018-09-22",2,1);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 4", "이써요이써요이써요이써요", 0, 4.0,"2018-09-22",3,2);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 5", "이써요이써요이써요이써요", 0, 5.0,"2018-09-22",2,2);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 6", "이써요이써요이써요이써요", 0, 6.0,"2018-09-23",3,2);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 7", "이써요이써요이써요이써요", 0, 7.0,"2018-09-24",2,1);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 8", "이써요이써요이써요이써요", 0, 8.0,"2018-09-25",3,1);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 9", "이써요이써요이써요이써요", 0, 9.0,"2018-09-25",2,2);

INSERT INTO comment(title, content,  helpful, score, reg_date, user_id, company_id) 
VALUES("comment title 10", "이써요이써요이써요이써요", 0, 9.5,"2018-09-25",3,2);


/*예약*/

INSERT INTO reservation(state, product_type, total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "호텔", 300000, "2018-03-01", 2, "2018-03-03", 1, 1, 2);

INSERT INTO reservation(state, product_type, total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "호텔", 300000, "2018-03-01", 2, "2018-03-03", 1, 1, 2);

INSERT INTO reservation(state, product_type, total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "식당", 300000, "2018-03-01", 2, "2018-03-03", 4, 2, 2);

INSERT INTO reservation(state, product_type, total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "식당", 300000, "2018-03-01", 2, "2018-03-03", 3, 3, 2);

INSERT INTO reservation(state, product_type, total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "렌트카", 300000, "2018-03-01", 2, "2018-03-03", 3, 3, 2);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "호텔", 200000, "2018-09-21", 2, "2018-09-19", 1, 1, 2);

INSERT INTO reservation(state, product_type, total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "호텔", 300000, "2018-09-22", 3, "2018-09-19", 4, 2, 2);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("취소", "호텔", 500000, "2018-09-24", 5, "2018-09-19", 4, 2, 2);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "호텔", 600000, "2018-09-25", 6, "2018-09-19", 4, 2, 2);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("성공", "식당", 700000, "2018-09-26", 7, "2018-09-19", 4, 2, 2);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "박물관", 800000, "2018-09-27", 8, "2018-09-19", 3, 3, 2);


INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("완료", "식당", 1000000, "2018-09-28", 9, "2018-09-19", 3, 3, 3);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("성공", "식당", 100000, "2018-09-20", 1, "2018-09-19", 1, 1, 3);

INSERT INTO reservation(state, product_type,  total_price, res_date, product_count, reg_date, company_id, product_id, user_id) 
VALUES("성공", "식당", 400000, "2018-09-23", 4, "2018-09-19", 4, 2, 3);

