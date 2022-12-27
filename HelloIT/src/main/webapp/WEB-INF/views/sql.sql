select * from user_info;
select * from post_info order by post_dt;
select * from like_info;
select * from USER_SKILL_INFO;
select * from user_role_info;
select * from user_db_info;
select * from user_language_info;

delete from POST_INFO where post_seq=18;

update USER_INFO set u_name = '박해성';

update user_info set u_name = '123' where u_email='test@test.com';
update user_info set u_name = 'test1_name' where u_email='test1_email';
update user_info set u_name = '유남욱' where u_email='xeph123@naver.com';
update user_info set u_name = '이예지' where u_email='dldpwl877757@naver.com';
update user_info set u_name = '김세희' where u_email='sh@naver.com';
update user_info set u_name = '유남욱g' where u_email='xeph12345@gmail.com';
update user_info set u_name = '파이리' where u_email='fire@test.com';
update user_info set u_name = '꼬부기' where u_email='water@test.com';
update user_info set u_name = '피카츄' where u_email='thunder@test.com';
update user_info set u_name = '김여울' where u_email='hanbyeol0415@gmail.com';

update post_info
set cmts = (select count(*)
				from comment_info
				where post_seq=2)
where post_seq=2;

2 4 6 8 9 12 13 14 15 16



insert into USER_INFO
SELECT *
FROM user_info
AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '10' MINUTE);

drop sequence like_info_SEQ;
drop trigger like_info_AI_TRG;
drop trigger bookmark_info_AI_TRG;

	
truncate table comment_info;
truncate table bookmark_info;

CREATE SEQUENCE like_info_SEQ
START WITH 0
INCREMENT BY 1;

delete from comment_info
where u_email = 'test@hs.com';

alter table like_info modify post_seq null;
alter table like_info modify cmt_seq null;

SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'like_info';

alter table post_info add cmts NUMBER(18, 0) default 0;

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
select *
		from comment_info c, user_info u
		where c.post_seq=13
		and c.u_email = u.u_email
		order by cmt_dt
		
		
----------------------------------------------------------------------
-- 임의 역할, 관심분야 등 지정
select * from USER_SKILL_INFO;
select * from user_role_info;
select * from user_db_info;
select * from user_language_info;

-- 'test@hs.com'
-- 'fire@test.com'
-- 'water@test.com'
-- 'thunder@test.com'

INSERT INTO user_skill_info
VALUES
    ('thunder@test.com', 
     'N', 
     'N', 
     'N', 
     'N',
     'N',
     'N',
     'N',
     'N'
     )

INSERT INTO user_role_info
VALUES
    ('thunder@test.com', 
     'N', 
     'N', 
     'N', 
     'N'
     )

INSERT INTO user_db_info
VALUES
    ('thunder@test.com', 
     'N', 
     'N', 
     'N', 
     'N', 
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N'
     )

INSERT INTO user_language_info
VALUES
	('thunder@test.com', 
	 'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N',
     'N'
     )     
     