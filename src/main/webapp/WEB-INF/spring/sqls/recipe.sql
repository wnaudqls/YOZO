DROP TABLE RECIPE;
DROP TABLE RECIPE CASCADE CONSTRAINTS;
DROP SEQUENCE RECIPE_SEQ

CREATE SEQUENCE RECIPE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 9999 
NOCYCLE
NOCACHE

CREATE TABLE RECIPE(
RECIPE_NO NUMBER PRIMARY KEY,
RECIPE_MAIN_PHOTO VARCHAR2(4000) NOT NULL,
MEMBER_ID VARCHAR2(50) NOT NULL,
RECIPE_TITLE VARCHAR2(1000) NOT NULL,
RECIPE_PHOTO VARCHAR2(4000) DEFAULT(NULL),
RECIPE_DETAIL VARCHAR2(4000) NOT NULL,
RECIPE_REGDATE DATE DEFAULT(SYSDATE) NOT NULL,
RECIPE_MATERIAL_ONE VARCHAR2(40) NOT NULL,
CATE_THEME NUMBER NOT NULL,
CATE_KIND NUMBER NOT NULL,
RECIPE_MATERIAL VARCHAR2(4000) NOT NULL,
RECIPE_LIKECOUNT NUMBER DEFAULT(0) NOT NULL,
CONSTRAINT RECIPE_FK_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
ON DELETE CASCADE
--,CONSTRAINT RECIPE_FK_RECIPE_THEME FOREIGN KEY(CATE_THEME_NO) REFERENCES THEME(CATE_THEME_NO)
--ON DELETE CASCADE,
--CONSTRAINT RECIPE_FK_RECIPE_KIND FOREIGN KEY(CATE_KIND_NO) REFERENCES KIND(CATE_KIND_NO)
--ON DELETE CASCADE
);

		SELECT * FROM RECIPE
		

		SELECT R.RECIPE_NO, R.RECIPE_MAIN_PHOTO, R.MEMBER_ID, 
		R.RECIPE_TITLE ,R.RECIPE_PHOTO ,R.RECIPE_DETAIL, R.RECIPE_REGDATE, R.RECIPE_MATERIAL_ONE,
		R.CATE_THEME, R.CATE_KIND, R.RECIPE_MATERIAL, R.RECIPE_LIKECOUNT, L.MEMBER_NO, L.LIKE_IT
		FROM RECIPE R LEFT JOIN LIKE_BOARD L ON(R.RECIPE_NO = L.RECIPE_NO)
		GROUP BY R.RECIPE_NO
		
		
		SELECT  R.RECIPE_NO, R.RECIPE_MAIN_PHOTO, R.MEMBER_ID, 
		R.RECIPE_TITLE ,R.RECIPE_PHOTO ,R.RECIPE_DETAIL, R.RECIPE_REGDATE, R.RECIPE_MATERIAL_ONE,
		R.CATE_THEME, R.CATE_KIND, R.RECIPE_MATERIAL, R.RECIPE_LIKECOUNT
		FROM RECIPE R LEFT JOIN LIKE_BOARD L ON(R.RECIPE_NO = L.RECIPE_NO)
		GROUP BY R.RECIPE_NO, R.RECIPE_MAIN_PHOTO, R.MEMBER_ID, 
		R.RECIPE_TITLE ,R.RECIPE_PHOTO ,R.RECIPE_DETAIL, R.RECIPE_REGDATE, R.RECIPE_MATERIAL_ONE,
		R.CATE_THEME, R.CATE_KIND, R.RECIPE_MATERIAL, R.RECIPE_LIKECOUNT
		
	

		SELECT *
		FROM RECIPE 
		WHERE RECIPE_NO NOT IN
		(
		SELECT L.RECIPE_NO 
		FROM LIKE_BOARD L JOIN RECIPE R ON(L.RECIPE_NO = R.RECIPE_NO)
		WHERE L.MEMBER_NO = 5
		)
		ORDER BY RECIPE_REGDATE DESC
		

		
		SELECT *
		FROM RECIPE 
		WHERE RECIPE_NO IN
		(
		SELECT L.RECIPE_NO 
		FROM LIKE_BOARD L JOIN RECIPE R ON(L.RECIPE_NO = R.RECIPE_NO)
		WHERE L.MEMBER_NO = 5
		)
		ORDER BY RECIPE_REGDATE
		
		



		
		
		SELECT ui.USER_NO, ui.USER_NAME, ui.USER_ROLE, ui.USER_DISTINCT
		FROM USER_INFO ui
		WHERE USER_NO != #{user_no}
		AND USER_NO 
		NOT IN(
			SELECT fl.FRIEND_NO
			FROM FRIEND_LIST fl
			JOIN FRIEND_LIST fl2
			ON fl.FRIEND_NO = fl2.USER_NO
			AND fl.USER_NO = fl2.FRIEND_NO
			WHERE fl.USER_NO = #{user_no})


ORDER BY RECIPE_NO DESC
DELETE FROM RECIPE

SELECT RECIPE_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_SEQUENCES;

--함수 필수
CREATE OR REPLACE FUNCTION KH.GET_SEQ
RETURN NUMBER 
IS
BEGIN
	RETURN RECIPE_SEQ.NEXTVAL;
END;



update recipe set recipe_title='레시피 찹스테이크~' where recipe_no=27


