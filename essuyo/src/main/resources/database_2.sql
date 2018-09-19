/* 테이블 생성할 때 제약조건을 기입하는 방식입니다.
 * 생성할 때 값들이 적용되므로 테이블 생성에 있어 순서가 존재합니다. */

DROP DATABASE essuyo;
CREATE DATABASE essuyo;
USE essuyo;

/* 사용가능시설목록 */
CREATE TABLE facility_list (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL/* 이름 */
)DEFAULT CHARSET=utf8; 

/* 지역명목록 */
CREATE TABLE area_list (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL/* 이름 */
)DEFAULT CHARSET=utf8; 

/* 사업종류 */
CREATE TABLE business_type (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL /* 이름 */
)DEFAULT CHARSET=utf8; 


/* 취소 약관 */
CREATE TABLE cancel (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	content VARCHAR(255) NOT NULL /* 설명 */
)DEFAULT CHARSET=utf8;

/* 상품 */
CREATE TABLE product (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	discription VARCHAR(255) NOT NULL, /* 설명 */
	price INTEGER NOT NULL /* 가격 */
)DEFAULT CHARSET=utf8; 

/* 이미지파일정보 */
CREATE TABLE image_info (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	save_path VARCHAR(255) NOT NULL, /* 저장위치 */
	type VARCHAR(255) NOT NULL, /* 종류 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	cre_date DATE NOT NULL, /* 생성날짜 */
	mod_date DATE /* 수정_날짜 */
)DEFAULT CHARSET=utf8; 


/* 업체 목록 */
CREATE TABLE company (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	discription VARCHAR(255), /* 설명 */
	address VARCHAR(255) NOT NULL, /* 주소 */
	number VARCHAR(255) NOT NULL, /* 전화번호 */
	url VARCHAR(255), /* 홈페이지 */
	state VARCHAR(255) NOT NULL, /* 영업상태 */
	time VARCHAR(255) NOT NULL, /* 영업시간 */
	total_visit INTEGER, /* 총방문자수 */
	today_visit INTEGER, /* 금일방문자수 */
	grade  INTEGER, /* 등급 */
	area_list_id INTEGER , /* 지역명목록번호 */
	business_type_id INTEGER ,  /* 사업종류번호 */
	
	FOREIGN KEY (area_list_id) REFERENCES area_list(id) ,
	FOREIGN KEY (business_type_id) REFERENCES business_type(id) 	
)DEFAULT CHARSET=utf8; 


/* 사업 */
CREATE TABLE business (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	good INTEGER, /* 좋아요 */
	comment VARCHAR(255), /* 한마디 */
	company_id INTEGER, /* 상점번호 */
	business_type_id INTEGER NOT NULL,  /* 사업종류번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id),
	FOREIGN KEY (business_type_id) REFERENCES business_type(id)
	
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
	total_reply INTEGER, /* 총덧글수 */
	business_id INTEGER, /* 사업번호 */
	image_info_id INTEGER,
	
	FOREIGN KEY (business_id) REFERENCES business(id),
	FOREIGN KEY (image_info_id) REFERENCES image_info(id)
)DEFAULT CHARSET=utf8; 

/* 덧글 */
CREATE TABLE comment (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	title VARCHAR(255) NOT NULL, /* 제목 */
	content  VARCHAR(255), /* 내용 */
	state VARCHAR(255) NOT NULL, /* 상태 */
	helpful INTEGER, /* 도움점수 */
	scroe DECIMAL(2,1) NOT NULL, /* 점수 */
	mod_date DATE, /* 수정날짜 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	user_id INTEGER NOT NULL,/* 사용자번호 */
	
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 메시지 */
CREATE TABLE message (
	id INTEGER PRIMARY KEY auto_increment, /* 번호 */
	content VARCHAR(255), /* 내용 */
	send_date DATE NOT NULL, /* 보낸날짜 */
	read_check INTEGER NOT NULL, /* 읽음확인 */
	user_id INTEGER NOT NULL, /* 사용자번호 */
	
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 예약 */
CREATE TABLE reservation (
	id INTEGER PRIMARY KEY  auto_increment, /* 번호 */
	state VARCHAR(255) NOT NULL, /* 상태 */
	total_price INTEGER NOT NULL, /* 총가격 */
	res_date DATE NOT NULL, /* 예약한날짜 */
	product_count INTEGER NOT NULL, /* 상품 개수 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	agree INTEGER NULL, /* 취소 및 약관 동의 */
	company_id INTEGER , /* 회사_번호 */
	product_id INTEGER , /* 상품_번호 */
	user_id INTEGER ,  /* 사용자_번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id),
	FOREIGN KEY (product_id) REFERENCES product(id),
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 



/* 상품관리 */
CREATE TABLE product_admin (
	product_count INTEGER, /*상품개수*/
	business_id INTEGER, /* 사업종류번호 */
	product_id INTEGER,	 /* 상품번호 */
	
	FOREIGN KEY (business_id) REFERENCES business(id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

/* 사용가능시설 */
CREATE TABLE facility (
	company_id INTEGER , /* 회사번호 */
	facility_list_id INTEGER,  /* 사용가능시설목록번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
	FOREIGN KEY (facility_list_id) REFERENCES facility_list(id) ON DELETE CASCADE
);


/* 회사이미지관리 */
CREATE TABLE company_image_admin (
	company_id INTEGER, /* 회사번호 */
	image_info_id INTEGER, /* 이미지정보번호 */
	
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 덧글이미지관리 */
CREATE TABLE comment_image_admin (
	image_info_id INTEGER, /* 이미지정보번호 */
	comment_id INTEGER, /* 덧글번호 */
	
	FOREIGN KEY (comment_id) REFERENCES comment(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/* 상품이미지관리 */
CREATE TABLE product_image_admin (
	product_id INTEGER, /* 번호 */
	image_info_id INTEGER, /* 번호2 */
	
	FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
	FOREIGN KEY (image_info_id) REFERENCES image_info(id) ON DELETE CASCADE
)DEFAULT CHARSET=utf8; 

/*********************************************************************************/
/************************************ 데이터 입력 ************************************/
/*********************************************************************************/

/*취소 약관*/
INSERT INTO cancel(content) VALUES ("취소규정 및 약관동의");
INSERT INTO cancel(content) VALUES ("연박의 취소수수료는 일할 계산합니다.");
INSERT INTO cancel(content) VALUES ("예약 변경을 위한 취소시에도 취소수수료가 부과되오니 양해하여 주시기 바랍니다.");
INSERT INTO cancel(content) VALUES ("투숙일 이후에는 반환되지 않습니다.");
INSERT INTO cancel(content) VALUES ("노쇼(No-Show: 사전 연락없이 예약된 숙소를 이용하지 않음)의 경우 요금이 100% 정상 청구됩니다.");
INSERT INTO cancel(content) VALUES ("실시간예약의 특성상 하나의 객실에 중복예약이 발생될 수 있으며, 이 경우 먼저 결제된 예약 건에 우선권이 있습니다.");
INSERT INTO cancel(content) VALUES ("성수기 요금이 확정되지 않았거나 요금표가 잘못 등록된 경우 예약이 취소될 수 있습니다.");

/*이미지*/
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("resources/images/hotel.jpg","image/jpg","hotel", now());

/*사업 종류*/
INSERT INTO business_type(name) VALUES("호텔");

/* 지역명목록 */
INSERT INTO area_list (name)  VALUES("부산");


/* 업체 */
INSERT INTO company(name, discription, address,number, url, state, time, 
total_visit, today_visit,grade,area_list_id,business_type_id)
VALUES("힐튼호텔", "돈만 있으면 쾌적한 곳", "부산광역시 기장군 기장읍 기장해안로 268-32 힐튼부산","010-0000-0000",
"http://hiltonbusan.co.kr/","open now","ALL TIME",10,10,1,1,1);

/* 사업 */
INSERT INTO business(good,comment,company_id,business_type_id) VALUES(10, "돈많은 사람만", 1,1);

/*유저*/
INSERT INTO user(name, age, gender, email, password,fail_password,
cre_date,last_date,total_reply,business_id) VALUES("이써요", 20,"남","test@essuyo.com",
"123",3,now(),now(),10,1);


/*상품*/
INSERT INTO product(name,discription,price) VALUES("비싼 호텔", "세계에서 가장 비싼 호텔이다.",1000000);

/*상품 이미지 관리*/
INSERT INTO product_image_admin(product_id,image_info_id) VALUES(1, 1);

/*상품*/
INSERT INTO product_admin(product_count,business_id,product_id) VALUES(10,1,1);


