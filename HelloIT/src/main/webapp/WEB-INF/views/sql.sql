-- email(PK), pw, tel, address를 저장하는 Table 생성
create table msg_member 
(
	email varchar2(100),
	pw varchar2(50) not null,
	tel varchar2(20) not null,
	address varchar2(500),
	constraint msg_email_pk primary key(email)
);

select * from MSG_MEMBER;

-- 게시글 정보들을 저장할 msg_board 테이블 만들기
-- 게시글 번호(PK, Sequence(시퀀스), 제목, 작성자(email), 시간, 내용, 이미지
create table msg_board
(
	num number,
	title varchar2(100) not null,
	writer varchar2(100),
	indate date,
	content varchar2(1000),
	img varchar2(100),
	constraint board_num_pk primary key(num),
	constraint board_writer_fk foreign key(writer) references msg_member(email) on delete cascade
);

-- msg_board 의 num을 채울 sequence  생성
create sequence board_num_seq
	start  with 1
	increment by 1
	maxvalue 999999
	nocycle
	nocache;
	
	
-- 임시 게시물 추가
insert into msg_board
values( board_num_seq.nextval, 
		'Command Pattern', 
		'123', 
		sysdate, 
		'Hello, 게시판 만들기 1', 
		null );
insert into msg_board
values( board_num_seq.nextval, 
		'Command Pattern', 
		'123', 
		sysdate, 
		'Hello, 게시판 만들기 2', 
		null );
insert into msg_board
values( board_num_seq.nextval, 
		'Command Pattern', 
		'123', 
		sysdate, 
		'Hello, 게시판 만들기 3', 
		null );

