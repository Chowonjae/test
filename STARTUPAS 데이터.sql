-- 회원 --
insert into member values('hong', '12345', 1);
insert into member values('kim', '12345', 1);
insert into member values('lee', '12345', 1);

insert into member values('choi', '12345', 2);
insert into member values('park', '12345', 2);
insert into member values('jeong', '12345', 2);

insert into member values('ga', '12345', 3);
insert into member values('na', '12345', 3);
insert into member values('da', '12345', 3);

insert into member values('king', '12345', 4);

-- 사용자 --
insert into customer values('hong', '홍길동', '대전 서구 둔산서로 17', 'hong@naver.com');
insert into customer values('kim', '김나래', '대전 중구 계룡로 732', 'kim@daum.net');
insert into customer values('lee', '이사랑', '대전 동구 가양남로 5', 'lee@gmail.com');

-- 공급자 --
insert into customer values('choi', '최기사', '대전 서구 가수원로 13', 'choi@daum.net');
insert into customer values('park', '박기사', '대전 중구 서문로 9', 'park@gmail.com');
insert into customer values('jeong', '정기사', '대전 동구 하소로 20', 'jeong@naver.com');

-- 제조사 --
insert into manufacturer values('ga', 1, '가상사', '대전 서구 바탕들1길 53', '신대표', '010-1234-5678');
insert into manufacturer values('na', 2, '나상사', '대전 중구 수침로 50', '주대표', '010-4567-1230');
insert into manufacturer values('da', 3, '다상사', '대전 동구 태전로 1', '소대표', '010-7890-5432');

-- 운영사 --
insert into operator values('king');

-- 비용 --
insert into cost values(50000);

-- 제품 --
insert into product values(1, '엘지티비', 'TV', null, null, null, 'ga');
insert into product values(2, '한성컴', '컴퓨터', null, null, null, 'na');
insert into product values(3, '삼성냉장고', '냉장고', null, null, null, 'da');

insert into product values(4, '삼성티비', 'TV', null, null, null, 'da');
insert into product values(5, '엘지컴', '컴퓨터', null, null, null, 'ga');
insert into product values(6, 'DC냉장고', '냉장고', null, null, null, 'na');

insert into product values(7, '소니티비', 'TV', null, null, null, 'na');
insert into product values(8, '인텔컴', '컴퓨터', null, null, null, 'da');
insert into product values(9, '엘지냉장고', '냉장고', null, null, null, 'ga');

-- 부품 --
insert into component values(11, 1, '액정', 45000, 1);
insert into component values(12, 2, 'CPU', 207000, 1);
insert into component values(13, 3, '압축기', 90000, 1);

insert into component values(14, 4, '파워보드', 90000, 1);
insert into component values(15, 5, '그래픽카드', 125000, 1);
insert into component values(16, 6, '증발기', 100000, 1);

insert into component values(17, 7, '백라이트', 6000, 2);
insert into component values(18, 8, '마우스패드', 5000, 2);
insert into component values(19, 9, '김치통', 15000, 2);

-- AS 신청서 (처리현황 1일시 승인완료, 2일시 처리 중, 3일시 처리완료) --

insert into ASform values(1, '010-1111-1111', '대전 서구 둔산서로 17', '액정이 나갔습니다. 고쳐주세요.', 1, '2021-01-27', null, 3, 'hong', 6);
insert into ASform values(2, '010-2222-2222', '대전 중구 계룡로 732', 'CPU 교체를 원합니다.', 2, '2021-01-27', null, 1, 'lee', 5);
insert into ASform values(3, '010-3333-3333', '대전 동구 가양남로 5', '압축기가 고장이 났어요.', 1, '2021-01-27', null, 1, 'lee', 9);

insert into ASform values(4, '010-4444-4444', '대전 서구 둔산서로 17', '파워보드 부품을 필요합니다.', 2, '2021-01-28', null, 1, 'hong', 1);
insert into ASform values(5, '010-5555-5555', '대전 중구 계룡로 732', '그래픽카드가 오래되 a/s요청합니다.', 2, '2021-01-28', null, 3, 'kim', 8);
insert into ASform values(6, '010-6666-6666','대전 동구 가양남로 5', '증발기에 증발이 되지 않습니다.', 1, '2021-01-28', null, 1, 'lee', 7);

insert into ASform values(7, '010-7777-7777', '대전 서구 둔산서로 17', '백라이트가 여러개 고장났습니다.', 2, '2021-01-29', null, 2, 'lee', 3);
insert into ASform values(8, '010-8888-8888', '대전 중구 계룡로 732', '마우스패드가 헐어서 교체부탁드립니다.', 1, '2021-01-29', null, 1, 'lee', 2);
insert into ASform values(9, '010-9999-9999', '대전 동구 가양남로 5', '김치통이 부서져 하나 요청합니다.', 2, '2021-01-29', null, 1, 'kim', 2);

-- 요청받은 as --
insert into ASrespond values(1, '2021-01-30', '수리가 완료됨1번', 50000, 50000, 1,'개선사항 1점 1번', 'jeong'); 

insert into ASrespond values(5, '2021-02-03', '수리가 완료됨1번', 50000, 50000, 3, '개선사항 3점 5번', 'choi'); 

insert into ASrespond(asNo,respDate,cuId) values(7, '2021-02-05', 'park'); 

%view%
--a/s수리 이력--
create view asbefore as(
    select c.name custoName, c.addr, p.prodgroup,
            m.name mcrName, p.name proName, a.meeting,
            a.symptoms, a.meetdate, r.respdate,
            r.cuid, r.ascomment, r.mancoast, 
            r.servicecoast, a.sta
    from asform a, customer c, product p,
            manufacturer m, asrespond r
    where 
        c.cuid=a.cuid and 
        a.productno=p.productno and
        p.cuid=m.cuid and
        a.asno=r.asno
);

--a/s수리 이력 리스트--

create view asbeforelist as(
    select a.asno, c.name, p.prodgroup, a.addr, a.meeting, r.respdate, a.sta
    from asform a, customer c, asrespond r, product p
    where a.asno=r.asno and 
            a.cuid=c.cuid and 
            a.productno=p.productno and
            a.asno=r.asno
);
