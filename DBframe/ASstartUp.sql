/* AS신청서 */
CREATE TABLE ASform (
	asNo INTEGER NOT NULL, /* a/s번호 */
	phone VARCHAR2(30), /* 전화번호 */
	addr VARCHAR2(255), /* 주소 */
	symptoms VARCHAR2(2000), /* 증상 */
	meeting INTEGER, /* 만남종류 */
	meetDate DATE, /* 사용자 방문희망일자 */
	fileImg VARCHAR2(255), /* 첨부파일 */
	sta INTEGER, /* 처리현황 */
	cuId VARCHAR2(100), /* 아이디 */
	productNo INTEGER /* 제품번호 */
);

COMMENT ON TABLE ASform IS 'AS신청서';

COMMENT ON COLUMN ASform.asNo IS 'a/s번호';

COMMENT ON COLUMN ASform.phone IS '전화번호';

COMMENT ON COLUMN ASform.addr IS '주소';

COMMENT ON COLUMN ASform.symptoms IS '증상';

COMMENT ON COLUMN ASform.meeting IS '만남종류';

COMMENT ON COLUMN ASform.meetDate IS '사용자 방문희망일자';

COMMENT ON COLUMN ASform.fileImg IS '첨부파일';

COMMENT ON COLUMN ASform.sta IS '처리현황';

COMMENT ON COLUMN ASform.cuId IS '아이디';

COMMENT ON COLUMN ASform.productNo IS '제품번호';

CREATE UNIQUE INDEX PK_ASform
	ON ASform (
		asNo ASC
	);

ALTER TABLE ASform
	ADD
		CONSTRAINT PK_ASform
		PRIMARY KEY (
			asNo
		);

/* 회원 */
CREATE TABLE member (
	cuId VARCHAR2(100) NOT NULL, /* 아이디 */
	pw VARCHAR2(50), /* 비밀번호 */
	uNo INTEGER /* 권한 */
);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.cuId IS '아이디';

COMMENT ON COLUMN member.pw IS '비밀번호';

COMMENT ON COLUMN member.uNo IS '권한';

CREATE UNIQUE INDEX PK_member
	ON member (
		cuId ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			cuId
		);

/* 요청받은 as */
CREATE TABLE ASrespond (
	asNo INTEGER NOT NULL, /* a/s번호 */
	respDate DATE NOT NULL, /* 공급자 방문예정일 */
	ascomment VARCHAR2(2000), /* 기사의견 */
	manCoast INTEGER, /* 인건비 */
	serviceCoast INTEGER, /* 출장비 */
	star INTEGER, /* 별점 */
	textBox VARCHAR2(2000), /* 개선사항 */
	cuId VARCHAR2(100) /* 아이디 */
);

COMMENT ON TABLE ASrespond IS '요청받은 as';

COMMENT ON COLUMN ASrespond.asNo IS 'a/s번호';

COMMENT ON COLUMN ASrespond.respDate IS '공급자 방문예정일';

COMMENT ON COLUMN ASrespond.ascomment IS '기사의견';

COMMENT ON COLUMN ASrespond.manCoast IS '인건비';

COMMENT ON COLUMN ASrespond.serviceCoast IS '출장비';

COMMENT ON COLUMN ASrespond.star IS '별점';

COMMENT ON COLUMN ASrespond.textBox IS '개선사항';

COMMENT ON COLUMN ASrespond.cuId IS '아이디';

CREATE UNIQUE INDEX PK_ASrespond
	ON ASrespond (
		asNo ASC
	);

ALTER TABLE ASrespond
	ADD
		CONSTRAINT PK_ASrespond
		PRIMARY KEY (
			asNo
		);

/* 제조사 */
CREATE TABLE manufacturer (
	cuId VARCHAR2(100) NOT NULL, /* 아이디 */
	manufacturerNo INTEGER NOT NULL, /* 제조사 번호 */
	name VARCHAR2(50), /* 이름 */
	addr VARCHAR2(255), /* 주소 */
	officer VARCHAR2(50), /* 담당자 */
	tel VARCHAR2(30) /* 전화번호 */
);

COMMENT ON TABLE manufacturer IS '제조사';

COMMENT ON COLUMN manufacturer.cuId IS '아이디';

COMMENT ON COLUMN manufacturer.manufacturerNo IS '제조사 번호';

COMMENT ON COLUMN manufacturer.name IS '이름';

COMMENT ON COLUMN manufacturer.addr IS '주소';

COMMENT ON COLUMN manufacturer.officer IS '담당자';

COMMENT ON COLUMN manufacturer.tel IS '전화번호';

CREATE UNIQUE INDEX PK_manufacturer
	ON manufacturer (
		cuId ASC
	);

ALTER TABLE manufacturer
	ADD
		CONSTRAINT PK_manufacturer
		PRIMARY KEY (
			cuId
		);

/* 제품 */
CREATE TABLE product (
	productNo INTEGER NOT NULL, /* 제품번호 */
	name VARCHAR2(50), /* 제품명 */
	prodGroup VARCHAR2(255), /* 분류 */
	useManual VARCHAR2(255), /* 사용메뉴얼 */
	asManual VARCHAR2(255), /* as메뉴얼 */
	productImage VARCHAR2(255), /* 제품이미지 */
	cuId VARCHAR2(100) /* 아이디 */
);

COMMENT ON TABLE product IS '제품';

COMMENT ON COLUMN product.productNo IS '제품번호';

COMMENT ON COLUMN product.name IS '제품명';

COMMENT ON COLUMN product.prodGroup IS '분류';

COMMENT ON COLUMN product.useManual IS '사용메뉴얼';

COMMENT ON COLUMN product.asManual IS 'as메뉴얼';

COMMENT ON COLUMN product.productImage IS '제품이미지';

COMMENT ON COLUMN product.cuId IS '아이디';

CREATE UNIQUE INDEX PK_product
	ON product (
		productNo ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			productNo
		);

/* 부품 */
CREATE TABLE component (
	componentNo INTEGER NOT NULL, /* 부품번호 */
	productNo INTEGER, /* 제품번호 */
	name VARCHAR2(50), /* 이름 */
	price INTEGER, /* 가격 */
	part INTEGER /* 구분 */
);

COMMENT ON TABLE component IS '부품';

COMMENT ON COLUMN component.componentNo IS '부품번호';

COMMENT ON COLUMN component.productNo IS '제품번호';

COMMENT ON COLUMN component.name IS '이름';

COMMENT ON COLUMN component.price IS '가격';

COMMENT ON COLUMN component.part IS '구분';

CREATE UNIQUE INDEX PK_component
	ON component (
		componentNo ASC
	);

ALTER TABLE component
	ADD
		CONSTRAINT PK_component
		PRIMARY KEY (
			componentNo
		);

/* 제품등록승인 */
CREATE TABLE productApproval (
	approvalNum INTEGER NOT NULL, /* 승인번호 */
	approvalStatus INTEGER, /* 승인여부 */
	rejectionReason VARCHAR2(2000), /* 승인불가사유 */
	productNo INTEGER /* 제품번호 */
);

COMMENT ON TABLE productApproval IS '제품등록승인';

COMMENT ON COLUMN productApproval.approvalNum IS '승인번호';

COMMENT ON COLUMN productApproval.approvalStatus IS '승인여부';

COMMENT ON COLUMN productApproval.rejectionReason IS '승인불가사유';

COMMENT ON COLUMN productApproval.productNo IS '제품번호';

CREATE UNIQUE INDEX PK_productApproval
	ON productApproval (
		approvalNum ASC
	);

ALTER TABLE productApproval
	ADD
		CONSTRAINT PK_productApproval
		PRIMARY KEY (
			approvalNum
		);

/* 비용 */
CREATE TABLE coast (
	serviceCoast INTEGER NOT NULL /* 출장비 */
);

COMMENT ON TABLE coast IS '비용';

COMMENT ON COLUMN coast.serviceCoast IS '출장비';

CREATE UNIQUE INDEX PK_coast
	ON coast (
		serviceCoast ASC
	);

ALTER TABLE coast
	ADD
		CONSTRAINT PK_coast
		PRIMARY KEY (
			serviceCoast
		);

/* 소모품 내역 */
CREATE TABLE ASconponentLog (
	componentNo INTEGER, /* 부품번호 */
	asNo INTEGER /* a/s번호 */
);

COMMENT ON TABLE ASconponentLog IS '사용된 소모품 리스트';

COMMENT ON COLUMN ASconponentLog.componentNo IS '부품번호';

COMMENT ON COLUMN ASconponentLog.asNo IS 'a/s번호';

/* 사용자,공급자 */
CREATE TABLE customer (
	cuId VARCHAR2(100) NOT NULL, /* 아이디 */
	name VARCHAR2(50), /* 이름 */
	addr VARCHAR2(255), /* 주소 */
	email VARCHAR2(40) /* 이메일 */
);

COMMENT ON TABLE customer IS '사용자,공급자';

COMMENT ON COLUMN customer.cuId IS '아이디';

COMMENT ON COLUMN customer.name IS '이름';

COMMENT ON COLUMN customer.addr IS '주소';

COMMENT ON COLUMN customer.email IS '이메일';

CREATE UNIQUE INDEX PK_customer
	ON customer (
		cuId ASC
	);

ALTER TABLE customer
	ADD
		CONSTRAINT PK_customer
		PRIMARY KEY (
			cuId
		);

/* 운영사 */
CREATE TABLE operator (
	cuId VARCHAR2(100) NOT NULL /* 아이디 */
);

COMMENT ON TABLE operator IS '운영사';

COMMENT ON COLUMN operator.cuId IS '아이디';

CREATE UNIQUE INDEX PK_operator
	ON operator (
		cuId ASC
	);

ALTER TABLE operator
	ADD
		CONSTRAINT PK_operator
		PRIMARY KEY (
			cuId
		);

/* 제조사 등록승인 */
CREATE TABLE manufacturerApproval (
	approvalNum INTEGER NOT NULL, /* 승인번호 */
	approvalStatus INTEGER, /* 승인여부(승인전,승인,승인불가) */
	rejectionReason VARCHAR2(2000), /* 승인불가사유 */
	cuId VARCHAR2(100) /* 아이디 */
);

COMMENT ON TABLE manufacturerApproval IS '제조사 등록승인';

COMMENT ON COLUMN manufacturerApproval.approvalNum IS '승인번호';

COMMENT ON COLUMN manufacturerApproval.approvalStatus IS '승인여부(승인전,승인,승인불가)';

COMMENT ON COLUMN manufacturerApproval.rejectionReason IS '승인불가사유';

COMMENT ON COLUMN manufacturerApproval.cuId IS '아이디';

CREATE UNIQUE INDEX PK_manufacturerApproval
	ON manufacturerApproval (
		approvalNum ASC
	);

ALTER TABLE manufacturerApproval
	ADD
		CONSTRAINT PK_manufacturerApproval
		PRIMARY KEY (
			approvalNum
		);

ALTER TABLE ASform
	ADD
		CONSTRAINT FK_member_TO_ASform
		FOREIGN KEY (
			cuId
		)
		REFERENCES member (
			cuId
		);

ALTER TABLE ASform
	ADD
		CONSTRAINT FK_product_TO_ASform
		FOREIGN KEY (
			productNo
		)
		REFERENCES product (
			productNo
		);

ALTER TABLE ASrespond
	ADD
		CONSTRAINT FK_ASform_TO_ASrespond
		FOREIGN KEY (
			asNo
		)
		REFERENCES ASform (
			asNo
		);

ALTER TABLE ASrespond
	ADD
		CONSTRAINT FK_member_TO_ASrespond
		FOREIGN KEY (
			cuId
		)
		REFERENCES member (
			cuId
		);

ALTER TABLE manufacturer
	ADD
		CONSTRAINT FK_member_TO_manufacturer
		FOREIGN KEY (
			cuId
		)
		REFERENCES member (
			cuId
		);

ALTER TABLE product
	ADD
		CONSTRAINT FK_manufacturer_TO_product
		FOREIGN KEY (
			cuId
		)
		REFERENCES manufacturer (
			cuId
		);

ALTER TABLE component
	ADD
		CONSTRAINT FK_product_TO_component
		FOREIGN KEY (
			productNo
		)
		REFERENCES product (
			productNo
		);

ALTER TABLE productApproval
	ADD
		CONSTRAINT FK_product_TO_productApproval
		FOREIGN KEY (
			productNo
		)
		REFERENCES product (
			productNo
		);

ALTER TABLE ASconponentLog
	ADD
		CONSTRAINT FKcomponentTOASconponentLog
		FOREIGN KEY (
			componentNo
		)
		REFERENCES component (
			componentNo
		);

ALTER TABLE ASconponentLog
	ADD
		CONSTRAINT FK_ASrespond_TO_ASconponentLog
		FOREIGN KEY (
			asNo
		)
		REFERENCES ASrespond (
			asNo
		);

ALTER TABLE customer
	ADD
		CONSTRAINT FK_member_TO_customer
		FOREIGN KEY (
			cuId
		)
		REFERENCES member (
			cuId
		);

ALTER TABLE operator
	ADD
		CONSTRAINT FK_member_TO_operator
		FOREIGN KEY (
			cuId
		)
		REFERENCES member (
			cuId
		);

ALTER TABLE manufacturerApproval
	ADD
		CONSTRAINT FK_mnfctr_TO_mnfctrprvl
		FOREIGN KEY (
			cuId
		)
		REFERENCES manufacturer (
			cuId
		);