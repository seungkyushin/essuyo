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
	
	FOREIGN KEY (business_id) REFERENCES business(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 덧글 */
CREATE TABLE comment (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	title VARCHAR(255) NOT NULL, /* 제목 */
	content  VARCHAR(255), /* 내용 */
	helpful INTEGER default 0, /* 도움점수 */
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

/* 공지사항 */
CREATE TABLE notice (
	noticeNum INTEGER PRIMARY KEY auto_increment, /* 번호 */
	title VARCHAR(255) NOT  NULL, /* 제목 */	
	content TEXT, /* 내용 */
	reg_date timestamp not null default now(), /* 등록날짜 */	
	user_id VARCHAR(255) NOT NULL, /* 작성자 사용자번호 */	
	
   FOREIGN KEY (user_id) REFERENCES user(email) ON DELETE CASCADE
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

/* QnA */
CREATE TABLE qna (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
    title VARCHAR(255) NOT NULL, /* 제목 */
    content text, /* 내용 */
    reg_date timestamp not null default now(), /* 등록날짜 */	
    user_id VARCHAR(255) NOT NULL, /* 사용자_번호*/    
    view_count INTEGER, /* 조회수 */
    
    FOREIGN KEY (user_id) REFERENCES user(email)
)DEFAULT CHARSET=utf8;



/*********************************************************************************/
/************************************ 데이터 입력 ************************************/
/*********************************************************************************/


/* 이미지 */
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/default-user.png","image/png","default-user.png", now());

/* 이미지 (레스토랑) */
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt1.jpg","image/jpg","restraunt1.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt2.jpg","image/jpg","restraunt2.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt3.jpg","image/jpg","restraunt3.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt4.jpg","image/jpg","restraunt4.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt5.jpg","image/jpg","restraunt5.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt6.jpg","image/jpg","restraunt6.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt7.jpg","image/jpg","restraunt7.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt8.jpg","image/jpg","restraunt8.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt9.jpg","image/jpg","restraunt9.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt10.jpg","image/jpg","restraunt10.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt11.jpg","image/jpg","restraunt11.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt12.jpg","image/jpg","restraunt12.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt13.jpg","image/jpg","restraunt13.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt14.jpg","image/jpg","restraunt14.jpg", now());
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/restraunt/restraunt15.jpg","image/jpg","restraunt15.jpg", now());



/* 지역명목록 */
INSERT INTO area_list (name)  VALUES("서울");
INSERT INTO area_list (name)  VALUES("부산");
INSERT INTO area_list (name)  VALUES("광주");
INSERT INTO area_list (name)  VALUES("강원도");

INSERT INTO facility(name)  VALUES("주차공간");
INSERT INTO facility(name)  VALUES("와이파이/인터넷");
INSERT INTO facility(name)  VALUES("금연구역");
INSERT INTO facility(name)  VALUES("신용카드");

/* 카테고리(레스토랑) */
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("해운대 식당", "식당", 4.2 , "부산 해운대 근처", "부산광역시 해운대구 해운대해변로 52","010-6291-2938",
"http://restrauntOne.com/","영업중","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("센텀 식당", "식당", 3.1 , "부산 해운대 근처", "부산광역시 해운대구 센텀남대로 76","02-803-1405",
"http://restrauntTwo.com/","영업중","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("광안해변 식당", "식당", 3.6 , "부산 해운대 근처", "부산광역시 수영구 광안해변로 386","010-3048-1246",
"http://restrauntThree.co.kr/","영업종료","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("우동로 식당", "식당", 1.8 , "부산 해운대 근처", "부산광역시 해운대구 우동1로85번길 25","010-3009-1833",
"http://restrauntFour.co.kr/","영업종료","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("수영 식당", "식당", 2.6 , "부산 해운대 근처", "부산광역시 수영구 수영동 432-1","010-7090-1092",
"http://restrauntFive.com/","영업중","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("구남로 식당", "식당", 4.8 , "부산 해운대 근처", "부산광역시 해운대구 구남로29번길 21","010-5097-1021",
"http://restrauntSix.com/","영업중","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("천일사 식당", "식당", 1.5 , "부산 해운대 근처", "부산광역시 해운대구 우동 1104-1","010-6079-9065",
"http://restrauntSeven.co.kr/","영업종료","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("광안 식당", "식당", 3.6 , "부산 해운대 근처", "부산광역시 수영구 광안동 140-18","010-9854-1457",
"http://restrauntEight.co.kr/","영업종료","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("동백 식당", "식당", 4.9 , "돈만 있으면 쾌적한 곳1", "부산광역시 해운대구 동백로 116","010-5831-2947",
"http://restrauntNine.com/","영업중","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("한화 식당", "식당", 4.1 , "부산 해운대 근처", "부산광역시 해운대구 마린시티3로 52 한화리조트","010-6421-1268",
"http://restrauntTen.com/","영업중","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("이마트 식당", "식당", 1.4 , "부산 해운대 근처", "부산광역시 해운대구 좌동순환로 511 E-마트해운대점","010-3446-3312",
"http://restrauntEleven.co.kr/","영업종료","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("좌동 식당", "식당", 3.1 , "부산 해운대 근처", "부산광역시 해운대구 좌동순환로99번길 7","010-2235-6684",
"http://restrauntTwelve.co.kr/","영업종료","ALL TIME",2);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("이대 식당", "식당", 1.6 , "서울 이대역 근처", "서울특별시 서대문구 연세로2길 98","010-2241-7784",
"http://restrauntThirteen.co.kr/","영업중","ALL TIME",1);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("광주 월드컵 식당", "식당", 3.7 , "광주 월드컵 경기장", "광주광역시 서구 금화로 240 월드컵경기장","010-2256-4451",
"http://www.restrauntFourteen.com/","영업중","ALL TIME",3);
INSERT INTO company(name, type, score, discription, address,number, homepage, state, time, area_list_id)
VALUES("한림 식당", "식당", 4.2 , "강원도 한림대 변화가", "강원도 춘천시 한림대학길 1","010-6774-2231",
"http://restrauntfifteen.co.kr/","영업중","ALL TIME",4);

/* 사업 (레스토랑) */
INSERT INTO business (good, comment, company_id) VALUES(48,"해운대 식당입니다. 잘부탁드립니다.",16);
INSERT INTO business (good, comment, company_id) VALUES(553,"센텀 식당입니다. 잘부탁드립니다.",17);
INSERT INTO business (good, comment, company_id) VALUES(332,"광안해변 식당입니다. 잘부탁드립니다.",18);
INSERT INTO business (good, comment, company_id) VALUES(1,"우동로 식당입니다. 잘부탁드립니다.",19);
INSERT INTO business (good, comment, company_id) VALUES(80,"수영 식당입니다. 잘부탁드립니다.",20);
INSERT INTO business (good, comment, company_id) VALUES(999,"구남로 식당입니다. 잘부탁드립니다.",21);
INSERT INTO business (good, comment, company_id) VALUES(556,"천일사 식당입니다. 잘부탁드립니다.",22);
INSERT INTO business (good, comment, company_id) VALUES(332,"광안 식당입니다. 잘부탁드립니다.",23);
INSERT INTO business (good, comment, company_id) VALUES(551,"동백 식당입니다. 잘부탁드립니다.",24);
INSERT INTO business (good, comment, company_id) VALUES(223,"한화 식당입니다. 잘부탁드립니다.",25);
INSERT INTO business (good, comment, company_id) VALUES(467,"이마트 식당입니다. 잘부탁드립니다.",26);
INSERT INTO business (good, comment, company_id) VALUES(111,"좌동 식당입니다. 잘부탁드립니다.",27);
INSERT INTO business (good, comment, company_id) VALUES(56,"이대 식당입니다. 잘부탁드립니다.",28);
INSERT INTO business (good, comment, company_id) VALUES(75,"광주 월드컵 식당입니다. 잘부탁드립니다.",29);
INSERT INTO business (good, comment, company_id) VALUES(10,"한림 식당입니다. 잘부탁드립니다.",30);

/* 사용자, 판매자 (레스토랑) */
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동16", 20, "남", "hong@naver16.com", SHA2('1234',512), 0,"2018-10-01", 16, 16);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동17", 20, "남", "hong@naver17.com", SHA2('1234',512), 0,"2018-10-01", 17, 17);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동18", 20, "남", "hong@naver18.com", SHA2('1234',512), 0,"2018-10-01", 18, 18);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동19", 20, "남", "hong@naver19.com", SHA2('1234',512), 0,"2018-10-01", 19, 19);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동20", 20, "남", "hong@naver20.com", SHA2('1234',512), 0,"2018-10-01", 20, 20);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동21", 20, "남", "hong@naver21.com", SHA2('1234',512), 0,"2018-10-01", 21, 21);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동22", 20, "남", "hong@naver22.com", SHA2('1234',512), 0,"2018-10-01", 22, 22);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동23", 20, "남", "hong@naver23.com", SHA2('1234',512), 0,"2018-10-01", 23, 23);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동24", 20, "남", "hong@naver24.com", SHA2('1234',512), 0,"2018-10-01", 24, 24);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동25", 20, "남", "hong@naver25.com", SHA2('1234',512), 0,"2018-10-01", 25, 25);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동26", 20, "남", "hong@naver26.com", SHA2('1234',512), 0,"2018-10-01", 26, 26);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동27", 20, "남", "hong@naver27.com", SHA2('1234',512), 0,"2018-10-01", 27, 27);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동28", 20, "남", "hong@naver28.com", SHA2('1234',512), 0,"2018-10-01", 28, 28);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동29", 20, "남", "hong@naver29.com", SHA2('1234',512), 0,"2018-10-01", 29, 29);
INSERT INTO user(name, age, gender, email, password, fail_password, cre_date, business_id, image_info_id) VALUES("홍길동30", 20, "남", "hong@naver30.com", SHA2('1234',512), 0,"2018-10-01", 30, 30);

/* 회사 이미지 관리 3개 (레스토랑) */
INSERT INTO company_image_admin(16,16);
INSERT INTO company_image_admin(16,30);
INSERT INTO company_image_admin(16,29);
INSERT INTO company_image_admin(17,17);
INSERT INTO company_image_admin(17,29);
INSERT INTO company_image_admin(17,28);
INSERT INTO company_image_admin(18,18);
INSERT INTO company_image_admin(18,28);
INSERT INTO company_image_admin(18,27);
INSERT INTO company_image_admin(19,19);
INSERT INTO company_image_admin(19,27);
INSERT INTO company_image_admin(19,26);
INSERT INTO company_image_admin(20,20);
INSERT INTO company_image_admin(20,26);
INSERT INTO company_image_admin(20,25);
INSERT INTO company_image_admin(21,21);
INSERT INTO company_image_admin(21,25);
INSERT INTO company_image_admin(21,24);
INSERT INTO company_image_admin(22,22);
INSERT INTO company_image_admin(22,24);
INSERT INTO company_image_admin(22,23);
INSERT INTO company_image_admin(23,23);
INSERT INTO company_image_admin(23,16);
INSERT INTO company_image_admin(23,17);
INSERT INTO company_image_admin(24,24);
INSERT INTO company_image_admin(24,17);
INSERT INTO company_image_admin(24,18);
INSERT INTO company_image_admin(25,25);
INSERT INTO company_image_admin(25,18);
INSERT INTO company_image_admin(25,19);
INSERT INTO company_image_admin(26,26);
INSERT INTO company_image_admin(26,19);
INSERT INTO company_image_admin(26,20);
INSERT INTO company_image_admin(27,27);
INSERT INTO company_image_admin(27,21);
INSERT INTO company_image_admin(27,22);
INSERT INTO company_image_admin(28,28);
INSERT INTO company_image_admin(28,22);
INSERT INTO company_image_admin(28,23);
INSERT INTO company_image_admin(29,29);
INSERT INTO company_image_admin(29,23);
INSERT INTO company_image_admin(29,24);
INSERT INTO company_image_admin(30,30);
INSERT INTO company_image_admin(30,24);
INSERT INTO company_image_admin(30,25);

/* 상품 (레스토랑) */
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);
INSERT INTO product(name, sale_start_date, sale_end_date, discription, price) VALUES("식당예약자리", "2018-10-17", "2018-10-31", "몇명인지 말씀해주세요", 100000);

/* 상품관리 (레스토랑) */
INSERT INTO product_admin(company_id,product_id) VALUES(16,31);
INSERT INTO product_admin(company_id,product_id) VALUES(17,32);
INSERT INTO product_admin(company_id,product_id) VALUES(18,33);
INSERT INTO product_admin(company_id,product_id) VALUES(19,34);
INSERT INTO product_admin(company_id,product_id) VALUES(20,35);
INSERT INTO product_admin(company_id,product_id) VALUES(21,36);
INSERT INTO product_admin(company_id,product_id) VALUES(22,37);
INSERT INTO product_admin(company_id,product_id) VALUES(23,38);
INSERT INTO product_admin(company_id,product_id) VALUES(24,39);
INSERT INTO product_admin(company_id,product_id) VALUES(25,40);
INSERT INTO product_admin(company_id,product_id) VALUES(26,41);
INSERT INTO product_admin(company_id,product_id) VALUES(27,42);
INSERT INTO product_admin(company_id,product_id) VALUES(28,43);
INSERT INTO product_admin(company_id,product_id) VALUES(29,44);
INSERT INTO product_admin(company_id,product_id) VALUES(30,45);


/* 상품 관리(레스토랑) */
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-17",1,31);
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-18",1,31);
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-19",0,31);
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-20",2,31);
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-21",10,31);
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-22",0,31);
INSERT INTO product_manager(sale_date, count , product_id) VALUES("2018-10-23",10,31);

/* 상품 이미지 관리 */
INSERT INTO product_image_admin(product_id ,image_info_id) VALUES(31,30);
INSERT INTO product_image_admin(product_id ,image_info_id) VALUES(31,25);
INSERT INTO product_image_admin(product_id ,image_info_id) VALUES(31,24);
