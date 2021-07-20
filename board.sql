-- 테이블 생성
CREATE TABLE board (
    no        NUMBER,
    PRIMARY KEY ( no ),
    title     VARCHAR2(500) NOT NULL,
    content   VARCHAR2(4000),
    hit       NUMBER,
    reg_date  DATE NOT NULL,
    user_no   NUMBER NOT NULL,
    CONSTRAINT user_fk FOREIGN KEY ( user_no )
        REFERENCES users ( no )
);


-- board 시퀀스 생성
CREATE SEQUENCE seq_board_no INCREMENT BY 1 START WITH 1 NOCACHE;

-- 조회수 시퀀스 생성
CREATE SEQUENCE seq_hit INCREMENT BY 1 START WITH 1 NOCACHE;

-- insert
INSERT INTO board VALUES (
    seq_board_no.NEXTVAL,
    '안녕하세요',
    '테스트용 게시글입니다',
    0,
    sysdate,
    1
);

-- join
SELECT
    b.no,
    u.id,
    u.password,
    u.name,
    u.gender,
    b.no,
    b.title,
    b.content,
    b.hit,
    b.reg_date
FROM
    users  u,
    board  b
WHERE
    u.no = b.user_no;
    
-- join
SELECT
    b.no,
    b.title,
    b.hit,
    u.name,
    b.reg_date
FROM
    users  u,
    board  b
WHERE
    u.no = b.user_no;
    
-- 조회수
UPDATE board
SET
    hit = hit + 1
WHERE
    no = 1;
    
-- read 정보 불러오기
SELECT
    b.no,
    u.name,
    b.hit,
    b.reg_date,
    b.title,
    b.content
FROM
    users  u
    LEFT OUTER JOIN board  b ON u.no = b.user_no
WHERE
    b.no = 5;
    
-- update
UPDATE board
SET
    title = '안녕',
    content = '테스트 2 입니다'
WHERE
    no = 5;
    
-- delete
DELETE FROM board
WHERE
    no = 1;
    
-- 검색
SELECT
    u.id,
    u.name,
    b.title,
    b.content,
    b.reg_date
FROM
    users  u
    LEFT OUTER JOIN board  b ON u.no = b.user_no
WHERE
    u.id LIKE '%안%'
    OR u.name LIKE '%안%'
    OR b.title LIKE '%안%'
    OR b.content LIKE '%안%'
    OR b.reg_date LIKE '%안%'
ORDER BY
    b.reg_date DESC;