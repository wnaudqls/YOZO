DROP TABLE cart;
DROP TABLE cart CASCADE CONSTRAINT;


create table cart(  
MEMBER_ID varchar2(50) not null,          
GOODS_NO number not null,
GOODS_TITLE varchar2(100) not null,
GOODS_MAIN_PHOTO VARCHAR2(1000) NOT NULL,
GOODS_PRICE number not null,
MONEY number not null,
amount number default 1
);

-- '시퀀스를 생성'하고 그 시퀀스의 시작값은 1로 하고 1씩 증가한다.

create sequence seq_cart  
start with 1
increment by 1;


--cart테이블에 제약조건을 추가한다.
--(cart테이블에 cart_MEMBER_ID_fk라는 이름의 제약조건을 cart테이블에 있는 MEMBER_ID에 추가하고,
--userid를 다른 테이블의 기본키를 참조하는 외래키로 설정하고, member테이블의 MEMBER_ID를 참조하도록 설정한다.)
--(즉, member테이블의 MEMBER_ID가 변경되면 cart테이블에 있는 MEMBER_ID도 같이 변경된다는 뜻이다.)
--만약에 cart테이블에 "insert into cart values (2,'kim',2,10)" 쿼리를 실행시켰을 때, 
--member테이블에 id (kim)이라는 id값이 없기 때문에 자료를 넣을 수 없어 오류가 발생한다.
--즉, member 테이블에 존재하는 id값만 cart 테이블에 넣을 수 있다는 뜻이다.
--(이렇게 하는 이유는 id값이 서로 일치하지 않아서 오류가 발생할 수 있기 때문에 제약조건을 설정하는 것이다.)


alter table cart add constraint cart_GOODS_NO_fk
foreign key(GOODS_NO) references goods(GOODS_NO);

alter table cart add constraint cart_MEMBER_ID_fk
foreign key(MEMBER_ID) references member(MEMBER_ID);


--아래 3개의 테이블을 참조해서 서로 join한다.

-- 회원의 이름과, 상품의 이름,물건 한개의 가격, 장바구니에 담은 개수, 총 물건의 가격을 검색한다.
-- member테이블과, product테이블과, cart테이블로부터 검색
-- member의 userid와 cart의 userid가 같고, product의 product_id와 cart의 product_id가 같을때
-- 즉, 회원의 아이디와 상품을 사려는 회원이 같고, 상품의 번호와 카트의 번호가 같을때 













  select MEMBER_NAME, GOODS_TITLE, GOODS_PRICE, amount, GOODS_PRICE*amount money
  from member m, goods p, cart c
  where m.MEMBER_ID=c.MEMBER_ID and p.GOODS_NO=c.GOODS_NO;
  
  insert 
select * from cart;
select * from cart where member_id = 'admin';
select * from goods;
select * from cart;

delete from cart where member_id = 'admin';
ROLLBACK
commit

insert into cart(member_id, goods_no, goods_title, goods_main_photo, goods_price, money, amount)
values('shm1113', 1, 'TEST입니다', '썸네일', 500, 500 , 1);
