select * from user_info;
select * from post_info;
	
	
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

