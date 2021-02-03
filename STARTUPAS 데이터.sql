-- ȸ�� --
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

-- ����� --
insert into customer values('hong', 'ȫ�浿', '���� ���� �л꼭�� 17', 'hong@naver.com');
insert into customer values('kim', '�質��', '���� �߱� ���� 732', 'kim@daum.net');
insert into customer values('lee', '�̻��', '���� ���� ���糲�� 5', 'lee@gmail.com');

-- ������ --
insert into customer values('choi', '�ֱ��', '���� ���� �������� 13', 'choi@daum.net');
insert into customer values('park', '�ڱ��', '���� �߱� ������ 9', 'park@gmail.com');
insert into customer values('jeong', '�����', '���� ���� �ϼҷ� 20', 'jeong@naver.com');

-- ������ --
insert into manufacturer values('ga', 1, '�����', '���� ���� ������1�� 53', '�Ŵ�ǥ', '010-1234-5678');
insert into manufacturer values('na', 2, '�����', '���� �߱� ��ħ�� 50', '�ִ�ǥ', '010-4567-1230');
insert into manufacturer values('da', 3, '�ٻ��', '���� ���� ������ 1', '�Ҵ�ǥ', '010-7890-5432');

-- ��� --
insert into operator values('king');

-- ��� --
insert into cost values(50000);

-- ��ǰ --
insert into product values(1, '����Ƽ��', 'TV', null, null, null, 'ga');
insert into product values(2, '�Ѽ���', '��ǻ��', null, null, null, 'na');
insert into product values(3, '�Ｚ�����', '�����', null, null, null, 'da');

insert into product values(4, '�ＺƼ��', 'TV', null, null, null, 'da');
insert into product values(5, '������', '��ǻ��', null, null, null, 'ga');
insert into product values(6, 'DC�����', '�����', null, null, null, 'na');

insert into product values(7, '�Ҵ�Ƽ��', 'TV', null, null, null, 'na');
insert into product values(8, '������', '��ǻ��', null, null, null, 'da');
insert into product values(9, '���������', '�����', null, null, null, 'ga');

-- ��ǰ --
insert into component values(11, 1, '����', 45000, 1);
insert into component values(12, 2, 'CPU', 207000, 1);
insert into component values(13, 3, '�����', 90000, 1);

insert into component values(14, 4, '�Ŀ�����', 90000, 1);
insert into component values(15, 5, '�׷���ī��', 125000, 1);
insert into component values(16, 6, '���߱�', 100000, 1);

insert into component values(17, 7, '�����Ʈ', 6000, 2);
insert into component values(18, 8, '���콺�е�', 5000, 2);
insert into component values(19, 9, '��ġ��', 15000, 2);

-- AS ��û�� (ó����Ȳ 1�Ͻ� ���οϷ�, 2�Ͻ� ó�� ��, 3�Ͻ� ó���Ϸ�) --

insert into ASform values(1, '010-1111-1111', '���� ���� �л꼭�� 17', '������ �������ϴ�. �����ּ���.', 1, '2021-01-27', null, 3, 'hong', 6);
insert into ASform values(2, '010-2222-2222', '���� �߱� ���� 732', 'CPU ��ü�� ���մϴ�.', 2, '2021-01-27', null, 1, 'lee', 5);
insert into ASform values(3, '010-3333-3333', '���� ���� ���糲�� 5', '����Ⱑ ������ �����.', 1, '2021-01-27', null, 1, 'lee', 9);

insert into ASform values(4, '010-4444-4444', '���� ���� �л꼭�� 17', '�Ŀ����� ��ǰ�� �ʿ��մϴ�.', 2, '2021-01-28', null, 1, 'hong', 1);
insert into ASform values(5, '010-5555-5555', '���� �߱� ���� 732', '�׷���ī�尡 ������ a/s��û�մϴ�.', 2, '2021-01-28', null, 3, 'kim', 8);
insert into ASform values(6, '010-6666-6666','���� ���� ���糲�� 5', '���߱⿡ ������ ���� �ʽ��ϴ�.', 1, '2021-01-28', null, 1, 'lee', 7);

insert into ASform values(7, '010-7777-7777', '���� ���� �л꼭�� 17', '�����Ʈ�� ������ ���峵���ϴ�.', 2, '2021-01-29', null, 2, 'lee', 3);
insert into ASform values(8, '010-8888-8888', '���� �߱� ���� 732', '���콺�е尡 �� ��ü��Ź�帳�ϴ�.', 1, '2021-01-29', null, 1, 'lee', 2);
insert into ASform values(9, '010-9999-9999', '���� ���� ���糲�� 5', '��ġ���� �μ��� �ϳ� ��û�մϴ�.', 2, '2021-01-29', null, 1, 'kim', 2);

-- ��û���� as --
insert into ASrespond values(1, '2021-01-30', '������ �Ϸ��1��', 50000, 50000, 1,'�������� 1�� 1��', 'jeong'); 

insert into ASrespond values(5, '2021-02-03', '������ �Ϸ��1��', 50000, 50000, 3, '�������� 3�� 5��', 'choi'); 

insert into ASrespond(asNo,respDate,cuId) values(7, '2021-02-05', 'park'); 

%view%
--a/s���� �̷�--
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

--a/s���� �̷� ����Ʈ--

create view asbeforelist as(
    select a.asno, c.name, p.prodgroup, a.addr, a.meeting, r.respdate, a.sta
    from asform a, customer c, asrespond r, product p
    where a.asno=r.asno and 
            a.cuid=c.cuid and 
            a.productno=p.productno and
            a.asno=r.asno
);
