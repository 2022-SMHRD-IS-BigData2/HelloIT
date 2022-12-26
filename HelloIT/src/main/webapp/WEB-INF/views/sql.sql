select * from user_info;
select * from post_info;

drop sequence like_info_SEQ;
drop trigger like_info_AI_TRG;
	
truncate table comment_info;

CREATE SEQUENCE like_info_SEQ
START WITH 0
INCREMENT BY 1;

delete from comment_info
where u_email = 'test@hs.com';

alter table like_info modify post_seq null;
alter table like_info modify cmt_seq null;

SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'like_info';

-- 임시 게시물 추가
insert into USER_INFO
values( 'test@hs.com',
		'123',
		'test_name_hs',
		'test_nick_hs',
		sysdate,
		'test_job_hs',
		'm',
		'test_level_hs',
		0,
		'u',
		sysdate
		);
		
insert into COMMENT_INFO
values(	comment_info_seq.nextval,
		2,
		'test용 댓글',
		sysdate,
		'test@hs.com',
		0,
		0
);

drop trigger like_info_AI_TRG;

CREATE OR REPLACE TRIGGER like_info_AI_TRG
BEFORE INSERT ON like_info 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT like_info_SEQ.NEXTVAL
    INTO :NEW.like_seq
    FROM DUAL;
END;

select*from comment_info;
select*from POST_INFO;

select * from comment_info
		where post_seq=2;

CREATE TABLE like_info
(
    like_seq NUMBER(18, 0) NOT NULL, 
    u_email VARCHAR2(50) NOT NULL, 
    post_seq NUMBER(18, 0),
    cmt_seq	NUMBER(18, 0),
    PRIMARY KEY (like_seq)
);

CREATE SEQUENCE like_info_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE like_info IS '좋아요';

COMMENT ON COLUMN like_info.like_seq IS '좋아요 순번';

COMMENT ON COLUMN like_info.u_email IS '회원 이메일';

COMMENT ON COLUMN like_info.post_seq IS '게시글 순번';

COMMENT ON COLUMN like_info.cmt_seq IS '댓글 순번';

ALTER TABLE like_info
    ADD CONSTRAINT FK_like_info_u_email_user_ FOREIGN KEY (u_email)
    REFERENCES user_info (u_email) ON DELETE cascade ;

ALTER TABLE like_info
    ADD CONSTRAINT FK_like_info_post_seq_post FOREIGN KEY (post_seq)
        REFERENCES post_info (post_seq) ON DELETE cascade ;
        
ALTER TABLE like_info
    ADD CONSTRAINT FK_like_info_cmt_seq_comment FOREIGN KEY (cmt_seq)
        REFERENCES comment_info (cmt_seq) ON DELETE cascade ;
        
select * from like_info;

select * from comment_info
		where post_seq=2;
		
select *
from comment_info
where post_seq=2;

select* from s_crawling;
select*from j_crawling;
