DROP SEQUENCE GROUP_INFO_SEQ;
DROP TABLE GROUP_INFO;
CREATE SEQUENCE GROUP_INFO_SEQ;
CREATE TABLE GROUP_INFO( -- USER가 예약어이듯이 GROUP도 예약어 존재함
	GROUP_NO NUMBER PRIMARY KEY,
	-- USER_ID VARCHAR2(500) NOT NULL,
	USER_NO NUMBER NOT NULL,
	USER_NAME VARCHAR2(1000) NOT NULL,
	GROUP_TITLE VARCHAR2(1000) NOT NULL,
	GROUP_CONTENT VARCHAR2(4000),
	GROUP_AMOUNT NUMBER NOT NULL, -- 그룹에 들어올 수 있는 수
	GROUP_REGDATE DATE NOT NULL,
	GROUP_HASHTAG VARCHAR2(4000),
	-- GROUP_SU NUMBER NOT NULL, -- SUPER USER? ADMIN? ANYWAY NUMBER -> MUCH BETTER TO CHANGE OTHER FOREIGN KEY
	GROUP_PASSWORD VARCHAR2(1000), -- NOT NULL이어야만 하는 이유가 없지 않을까요?
	-- CONSTRAINT GROUP_INFO_UI_FK FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID),
	CONSTRAINT GROUP_INFO_UN_FK FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO),
	CONSTRAINT GROUP_INFO_SU_FK FOREIGN KEY(GROUP_SU) REFERENCES USER_INFO(USER_NO)
);

select * from group_info;

DROP SEQUENCE CHAT_SEQ;
DROP TABLE CHAT;
CREATE SEQUENCE CHAT_SEQ;
CREATE TABLE CHAT( -- STREAMING과 맞추는 것이 나을 것 같음 CHAT/STRAM OR CHATTING/STREAMING
	CHAT_NO NUMBER,
	GROUP_NO NUMBER NOT NULL,
	-- USER_ID VARCHAR2(500) NOT NULL,
	USER_NO NUMBER NOT NULL,
	-- CHAT_TITLE VARCHAR2(4000) NOT NULL, -- CHAT_TITLE? 뭘 기록하는 내용인지 기억이 안납니다 설명 바람...
	-- CHAT_TITLE이 채팅방 이름 넣어주는곳 같은데 필요하긴 할 거 같네요
	CHAT_CONTENT VARCHAR2(4000) NOT NULL,
	CONSTRAINT CHAT_GN_FK FOREIGN KEY(GROUP_NO) REFERENCES GROUP_INFO(GROUP_NO),
	-- CONSTRAINT CHAT_UI_FK FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
	CONSTRAINT CHAT_UN_FK FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
);

select * from CHAT;

-- 현재 chat 테이블: chat_no, user_id, chat_title, chat_public, chat_password, chat_client


DROP SEQUENCE STREAM_SEQ;
DROP TABLE STREAM;
CREATE SEQUENCE STREAM_SEQ;
CREATE TALBE STREAM(
	STREAM_NO NUMBER PRIMARY KEY,
	GROUP_NO NUMBER NOT NULL,
	-- USER_ID VARCHAR2(500) NOT NULL,
	USER_NO NUMBER NOT NULL,
	STREAM_REGDATE DATE NOT NULL,
	STREAM_EXPIRED DATE NOT NULL, -- 만료기한
	STREAM_STATUS VARCHAR2(500) NOT NULL,
	CONSTRAINT STREAM_GN_FK FOREIGN KEY(GROUP_NO) REFERENCES GROUP_INFO(GROUP_NO),
	-- CONSTRAINT STREAM_UI_FK FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID),
	CONSTRAINT STREAM_UN_FK FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO),
	CONSTRAINT STREAM_STATUC_CK CHECK(STREAM_STATUS IN ('V','T')) -- 비디오, 타임랩스
);