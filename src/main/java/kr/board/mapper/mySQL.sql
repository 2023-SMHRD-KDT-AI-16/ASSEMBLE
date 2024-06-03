drop table board;

-- Board 게시판 테이블 생성
create table board(
	idx int not null auto_increment,
	memID varchar(20) not null, -- 수정 할 때 컬럼 추가
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);


select * from user_info;
select * from board_info;

-- 회원테이블 생성

create table member(
	memIdx int auto_increment,
	memID varchar(20) not null,
	memPassword varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(50),
	memProfile varchar(50),
	primary key(memIdx)
);


INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 01', 'b_content 01', 01, 'b_file 01', NOW(), 'user_id 01');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 02', 'b_content 02', 02, 'b_file 02', NOW(), 'user_id 02');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 03', 'b_content 03', 03, 'b_file 03', NOW(), 'user_id 03');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 04', 'b_content 04', 04, 'b_file 04', NOW(), 'user_id 04');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 05', 'b_content 05', 05, 'b_file 05', NOW(), 'user_id 05');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 06', 'b_content 06', 06, 'b_file 06', NOW(), 'user_id 06');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 07', 'b_content 07', 07, 'b_file 07', NOW(), 'user_id 07');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 08', 'b_content 08', 08, 'b_file 08', NOW(), 'user_id 08');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 09', 'b_content 09', 09, 'b_file 09', NOW(), 'user_id 09');
INSERT INTO board_info (b_category, b_title, b_content, b_views, b_file, created_at, user_id) VALUES ('N', 'b_title 10', 'b_content 10', 10, 'b_file 10', NOW(), 'user_id 10');

select * from member;

insert into member(memID, memPassword, memName, memAge, memGender, memEmail)
values('admin','1234','관리자', 20, '남자', 'admin@gmail.com');
insert into member(memID, memPassword, memName, memAge, memGender, memEmail)
values('juhui','1111','이주희', 20, '여자', 'juhui@gmail.com');
insert into member(memID, memPassword, memName, memAge, memGender, memEmail)
values('chicken','7777','병아리', 20, '남자', 'chicken@gmail.com');


delete from member;







select * from power_info;



insert into board(title, content, writer)
values('오늘 명성식당 최고','진짜 본토 맛집같음','박병관');
insert into board(title, content, writer)
values('비가와야 당근이 잘 클텐데','당근당근!바니바니!','황해도');
insert into board(title, content, writer)
values('여러분! 옥수수 좋아하시나요?!','제키는 옥수수와 같은 2M입니다','최영화');
insert into board(title, content, writer)
values('JSP&Servlet 어렵지 않아요','사실 재미까지 있어요','이주희');
insert into board(title, content, writer)
values('대접으로 놀러오세요~!','그냥집밥도 좋아요!','조승재');



