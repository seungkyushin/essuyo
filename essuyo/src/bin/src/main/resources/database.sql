/* eXERD 툴로 생성한 질의문 입니다.
 * 테이블을 생성한후 테이블에 있는 제약을 추가하는 방식입니다. */

DROP DATABASE essuyo;
CREATE DATABASE essuyo;
USE essuyo;

/* 사용가능시설목록 */
CREATE TABLE facility_list (
	id INTEGER NOT NULL, /* 번호 */
	name VARCHAR(255) /* 이름 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE facility_list
	ADD
		CONSTRAINT PK_facility_list
		PRIMARY KEY (
			id
		);

/* 사업종류 */
CREATE TABLE business_type (
	id INTEGER NOT NULL, /* 번호 */
	name VARCHAR(255) NOT NULL /* 이름 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE business_type
	ADD
		CONSTRAINT PK_business_type
		PRIMARY KEY (
			id
		);

/* 상품관리 */
CREATE TABLE product_admin (
	business_id INTEGER, /* 사업종류번호 */
	product_id INTEGER /* 상품번호 */
)DEFAULT CHARSET=utf8; 


/* 회사 */
CREATE TABLE company (
	id INTEGER NOT NULL, /* 번호 */
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
	area_list_id INTEGER, /* 지역명목록번호 */
	business_type_id INTEGER /* 사업종류번호 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE company
	ADD
		CONSTRAINT PK_company
		PRIMARY KEY (
			id
		);

/* 지역명목록 */
CREATE TABLE area_list (
	id INTEGER NOT NULL, /* 번호 */
	name VARCHAR(255) NOT NULL /* 이름 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE area_list
	ADD
		CONSTRAINT PK_area_list
		PRIMARY KEY (
			id
		);

/* 사용가능시설 */
CREATE TABLE facility (
	company_id INTEGER, /* 회사번호 */
	facility_list_id INTEGER /* 사용가능시설목록번호 */
)DEFAULT CHARSET=utf8; 

/* 사용자 */
CREATE TABLE user (
	id INTEGER NOT NULL, /* 번호 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	email VARCHAR(255) NOT NULL, /* 이메일 */
	password VARCHAR(255) NOT NULL, /* 비밀번호 */
	fail_password INTEGER NOT NULL, /* 비밀번호실패 */
	first_date DATE NOT NULL, /* 생성날짜 */
	last_date DATE, /* 마지막로그인날짜 */
	total_reply INTEGER, /* 총덧글수 */
	business_id INTEGER, /* 사업번호 */
	image_info_id INTEGER /* 이미지정보번호 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE user
	ADD
		CONSTRAINT PK_user
		PRIMARY KEY (
			id
		);

ALTER TABLE user
	ADD
		CONSTRAINT UK_user
		UNIQUE (
			email
		);

/* 덧글 */
CREATE TABLE comment (
	id INTEGER NOT NULL, /* 번호 */
	title VARCHAR(255) NOT NULL, /* 제목 */
	content  VARCHAR(255), /* 내용 */
	state VARCHAR(255) NOT NULL, /* 상태 */
	helpful INTEGER, /* 도움점수 */
	scroe DECIMAL(2,1) NOT NULL, /* 점수 */
	mod_date DATE, /* 수정날짜 */
	reg_date DATE NOT NULL, /* 등록날짜 */
	user_id INTEGER NOT NULL /* 사용자번호 */
);

ALTER TABLE comment
	ADD
		CONSTRAINT PK_comment
		PRIMARY KEY (
			id
		);

/* 예약 */
CREATE TABLE reservation (
	id INTEGER NOT NULL, /* 번호 */
	state VARCHAR(255) NOT NULL, /* 상태 */
	total_price INTEGER NOT NULL, /* 총가격 */
	res_date DATE NOT NULL, /* 예약한날짜 */
	/* 추가 : 완료날짜 or 일수?! */
	reg_date DATE NOT NULL, /* 등록날짜 */
	compay_id INTEGER, /* 회사_번호 */
	product_id INTEGER, /* 상품_번호 */
	user_id INTEGER /* 사용자_번호 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			id
		);

/* 메시지 */
CREATE TABLE message (
	id INTEGER NOT NULL, /* 번호 */
	content VARCHAR(255), /* 내용 */
	send_date DATE NOT NULL, /* 보낸날짜 */
	read_check INTEGER NOT NULL, /* 읽음확인 */
	user_id INTEGER NOT NULL /* 사용자번호 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			id
		);

/* 상품 */
CREATE TABLE product (
	id INTEGER NOT NULL, /* 번호 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	discription VARCHAR(255) NOT NULL, /* 설명 */
	price INTEGER NOT NULL /* 가격 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			id
		);

/* 이미지파일정보 */
CREATE TABLE image_info (
	id INTEGER NOT NULL, /* 번호 */
	save_path VARCHAR(255) NOT NULL, /* 저장위치 */
	type VARCHAR(255) NOT NULL, /* 종류 */
	name VARCHAR(255) NOT NULL, /* 이름 */
	cre_date DATE NOT NULL, /* 생성날짜 */
	mod_date DATE /* 수정_날짜 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE image_info
	ADD
		CONSTRAINT PK_image_info
		PRIMARY KEY (
			id
		);

/* 사업 */
CREATE TABLE business (
	id INTEGER NOT NULL, /* 번호 */
	good INTEGER, /* 좋아요 */
	comment VARCHAR(255), /* 한마디 */
	company_id INTEGER, /* 상점번호 */
	business_type_id INTEGER /* 사업종류번호 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE business
	ADD
		CONSTRAINT PK_business
		PRIMARY KEY (
			id
		);

/* 회사이미지관리 */
CREATE TABLE company_image_admin (
	company_id INTEGER, /* 회사번호 */
	image_info_id INTEGER /* 이미지정보번호 */
)DEFAULT CHARSET=utf8; 

/* 덧글이미지관리 */
CREATE TABLE comment_image_admin (
	image_info_id INTEGER, /* 이미지정보번호 */
	comment_id INTEGER /* 회사번호 */
)DEFAULT CHARSET=utf8; 

/* 상품이미지관리 */
CREATE TABLE proudct_image_admin (
	product_id INTEGER, /* 번호 */
	image_info_id INTEGER /* 번호2 */
)DEFAULT CHARSET=utf8; 

ALTER TABLE product_admin
	ADD
		CONSTRAINT FK_business_type_TO_product_admin
		FOREIGN KEY (
			business_id
		)
		REFERENCES business_type (
			id
		) ON DELETE CASCADE;

ALTER TABLE product_admin
	ADD
		CONSTRAINT FK_product_TO_product_admin
		FOREIGN KEY (
			product_id
		)
		REFERENCES product (
			id
		) ON DELETE CASCADE;

ALTER TABLE company
	ADD
		CONSTRAINT FK_area_list_TO_company
		FOREIGN KEY (
			area_list_id
		)
		REFERENCES area_list (
			id
		);

ALTER TABLE company
	ADD
		CONSTRAINT FK_business_type_TO_company
		FOREIGN KEY (
			business_type_id
		)
		REFERENCES business_type (
			id
		);

ALTER TABLE facility
	ADD
		CONSTRAINT FK_company_TO_facility
		FOREIGN KEY (
			company_id
		)
		REFERENCES company (
			id
		) ON DELETE CASCADE;

ALTER TABLE facility
	ADD
		CONSTRAINT FK_facility_list_TO_facility
		FOREIGN KEY (
			facility_list_id
		)
		REFERENCES facility_list (
			id
		) ON DELETE CASCADE;

ALTER TABLE user
	ADD
		CONSTRAINT FK_business_TO_user
		FOREIGN KEY (
			business_id
		)
		REFERENCES business (
			id
		);

ALTER TABLE user
	ADD
		CONSTRAINT FK_image_info_TO_user
		FOREIGN KEY (
			image_info_id
		)
		REFERENCES image_info (
			id
		);

ALTER TABLE comment
	ADD
		CONSTRAINT FK_user_TO_comment
		FOREIGN KEY (
			user_id
		)
		REFERENCES user (
			id
		) ON DELETE CASCADE;

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_company_TO_reservation
		FOREIGN KEY (
			compay_id
		)
		REFERENCES company (
			id
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_product_TO_reservation
		FOREIGN KEY (
			product_id
		)
		REFERENCES product (
			id
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_user_TO_reservation
		FOREIGN KEY (
			user_id
		)
		REFERENCES user (
			id
		) ON DELETE CASCADE;

ALTER TABLE message
	ADD
		CONSTRAINT FK_user_TO_message
		FOREIGN KEY (
			user_id
		)
		REFERENCES user (
			id
		) ON DELETE CASCADE;

ALTER TABLE business
	ADD
		CONSTRAINT FK_company_TO_business
		FOREIGN KEY (
			company_id
		)
		REFERENCES company (
			id
		);

ALTER TABLE business
	ADD
		CONSTRAINT FK_business_type_TO_business
		FOREIGN KEY (
			business_type_id
		)
		REFERENCES business_type (
			id
		);

ALTER TABLE company_image_admin
	ADD
		CONSTRAINT FK_company_TO_company_image_admin
		FOREIGN KEY (
			company_id
		)
		REFERENCES company (
			id
		) ON DELETE CASCADE;

ALTER TABLE company_image_admin
	ADD
		CONSTRAINT FK_image_info_TO_company_image_admin
		FOREIGN KEY (
			image_info_id
		)
		REFERENCES image_info (
			id
		) ON DELETE CASCADE;

ALTER TABLE comment_image_admin
	ADD
		CONSTRAINT FK_image_info_TO_comment_image_admin
		FOREIGN KEY (
			image_info_id
		)
		REFERENCES image_info (
			id
		) ON DELETE CASCADE;

ALTER TABLE comment_image_admin
	ADD
		CONSTRAINT FK_comment_TO_comment_image_admin
		FOREIGN KEY (
			comment_id
		)
		REFERENCES comment (
			id
		) ON DELETE CASCADE;

ALTER TABLE proudct_image_admin
	ADD
		CONSTRAINT FK_product_TO_proudct_image_admin
		FOREIGN KEY (
			product_id
		)
		REFERENCES product (
			id
		) ON DELETE CASCADE;

ALTER TABLE proudct_image_admin
	ADD
		CONSTRAINT FK_image_info_TO_proudct_image_admin
		FOREIGN KEY (
			image_info_id
		)
		REFERENCES image_info (
			id
		) ON DELETE CASCADE;