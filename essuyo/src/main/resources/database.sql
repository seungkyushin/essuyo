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


/*이미지*/
INSERT INTO image_info ( save_path, type ,name, cre_date ) VALUES("/resources/images/default-user.png","image/png","default-user.png", now());




/* 지역명목록 */
INSERT INTO area_list (name)  VALUES("서울");
INSERT INTO area_list (name)  VALUES("부산");
INSERT INTO area_list (name)  VALUES("광주");
INSERT INTO area_list (name)  VALUES("강원도");

INSERT INTO facility(name)  VALUES("주차공간");
INSERT INTO facility(name)  VALUES("와이파이/인터넷");
INSERT INTO facility(name)  VALUES("금연구역");
INSERT INTO facility(name)  VALUES("신용카드");





