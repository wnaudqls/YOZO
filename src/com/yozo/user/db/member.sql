
DROP TABLE MEMBER CASCADE CONSTRAINT;
DROP SEQUENCE MEMBER_SEQ;

CREATE SEQUENCE MEMBER_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 9999 
NOCYCLE
NOCACHE

CREATE TABLE MEMBER(
   MEMBER_NO NUMBER NOT NULL,
   MEMBER_ID VARCHAR2(20) PRIMARY KEY,
   MEMBER_PW VARCHAR2(30) NOT NULL,
   MEMBER_NAME VARCHAR2(50) NOT NULL,
   MEMBER_NICK VARCHAR2(20) NOT NULL,
   MEMBER_EMAIL VARCHAR2(100) NOT NULL,
   MEMBER_EMAIL_HASH VARCHAR2(64),
   MEMBER_EMAIL_CHECKED VARCHAR2(10),
   MEMBER_ENABLED VARCHAR2(2) DEFAULT ('N') NOT NULL,
   MEMBER_PHONE VARCHAR2(100) NOT NULL,
   MEMBER_ADDR VARCHAR2(200) NOT NULL, 
   MEMBER_ROLE VARCHAR2(20) DEFAULT ('회원') NOT NULL,
   CONSTRAINT MEMBER_NO UNIQUE (MEMBER_NO),
   CONSTRAINT MEMBER_NICK_UK UNIQUE (MEMBER_NICK),
   CONSTRAINT MEMBER_EMAIL_UK UNIQUE (MEMBER_EMAIL),
   CONSTRAINT MEMBER_ENABLED_CHK CHECK (MEMBER_ENABLED IN ('Y','N')),
   CONSTRAINT MEMBER_PHONE_UK UNIQUE (MEMBER_PHONE),
   CONSTRAINT MEMBER_ROLE_CHK CHECK (MEMBER_ROLE IN ('관리자','회원'))
);

SELECT * FROM MEMBER ORDER BY MEMBER_NO ASC;

INSERT INTO MEMBER

VALUES(MEMBER_SEQ.NEXTVAL,'shm113','gusah0919','성현모','두부여섯모','shm1113',NULL,'TRUE','N','010-7-0770000','YONGIN','회원')
INSERT INTO MEMBER
VALUES(MEMBER_SEQ.NEXTVAL,'ID2','PW2','NAME2','NICK2','AAA@AAA2',NULL,'TRUE','N','010-0010-0010','성남','회원')

update MEMBER set member_role='관리자'

DELETE MEMBER
WHERE MEMBER_NO = 1

DELETE FROM MEMBER
/* 맴버_주소 컬럼 수정해야 합니다. 위 sql문 실행해 주세요 */
ALTER TABLE MEMBER MODIFY (MEMBER_ADDR VARCHAR2(200));

