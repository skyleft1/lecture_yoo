use mysql;

drop database if exists test;
create database test  COLLATE 'utf8_general_ci' ;

use test;

-- 테이블 제거
DROP TABLE IF EXISTS EMP        ; -- 부서 테이블
DROP TABLE IF EXISTS DEPT       ; -- 사원 테이블
DROP TABLE IF EXISTS SALGRADE   ; -- SALGRADE 테이블
DROP TABLE IF EXISTS GROUP_STAR ; -- GROUP_STAR 테이블
DROP TABLE IF EXISTS SINGLE_STAR; -- SINGLE_STAR 테이블

-- 부서 테이블 생성하기
CREATE TABLE DEPT(
       DEPTNO   INT     PRIMARY KEY
     , DNAME    VARCHAR(14)
     , LOC      VARCHAR(13)
);

-- 사원 테이블 생성하기
CREATE TABLE EMP( 
       EMPNO    INT   PRIMARY KEY
     , ENAME    VARCHAR(10)
     , JOB      VARCHAR(9)
     , MGR      INT
     , HIREDATE DATE
     , SAL      DOUBLE(7,2)
     , COMM     DOUBLE(7,2)
     , DEPTNO   INT   REFERENCES DEPT
);

-- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
     GRADE INT,
     LOSAL INT,
     HISAL INT 
);


-- GROUP_STAR 테이블 생성하기
CREATE TABLE GROUP_STAR(
    NAME        VARCHAR(50)
);

-- SINGLE_STAR 테이블 생성하기
CREATE TABLE SINGLE_STAR(
    NICKNAME    VARCHAR(50)
);     
     

-- 사원 테이블에 샘플 데이터 추가하기
INSERT INTO DEPT VALUES(10, '경리부', '서울');
INSERT INTO DEPT VALUES(11, '회계팀', '서울');
INSERT INTO DEPT VALUES(20, '인사부', '인천');
INSERT INTO DEPT VALUES(21, 'HR팀'  , '인천');
INSERT INTO DEPT VALUES(30, '영업부', '용인'); 
INSERT INTO DEPT VALUES(31, '개발팀', '용인'); 
INSERT INTO DEPT VALUES(40, '전산부', '수원');
INSERT INTO DEPT VALUES(41, '서버부', '수원');


-- 부서 테이블에 샘플 데이터 추가하기
INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, '2007-03-01',  300, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, '2007-04-02',  250,   80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, '2005-02-10',  500,  100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, '2003-09-02',  600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, '2005-04-07',  450,  200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, '2003-10-09',  480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, '2004-01-08',  520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, '2004-03-08',  500,    0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, '1996-10-04', 1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, '2005-04-07',  500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, '2007-03-01',  280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, '2007-08-09',  300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, '2002-10-09',  560, NULL, 20);
INSERT INTO EMP VALUES(1014, '조인성', '사원', 1006, '2007-11-09',  250, NULL, 10);
INSERT INTO EMP VALUES(1015, '김현수', '사원', 1008, '2012-11-09',  250, NULL, 31);
INSERT INTO EMP VALUES(1016, '강정호', '사원', 1008, '2013-01-09',  250, NULL, 31);
INSERT INTO EMP VALUES(1017, '이대호', '사원', 1008, '2011-03-09',  250, NULL, 31);
INSERT INTO EMP VALUES(1018, '추신수', '대리', 1004, '2016-10-04', 1000, NULL, 21);



-- 급여 테이블에 샘플 데이터 추가하기
INSERT INTO SALGRADE VALUES (1, 700 ,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);


-- GROUP_STAR 테이블에 샘플 데이터 추가하기
INSERT INTO GROUP_STAR VALUES('태연');
INSERT INTO GROUP_STAR VALUES('유리');
INSERT INTO GROUP_STAR VALUES('윤아');
INSERT INTO GROUP_STAR VALUES('효연');
INSERT INTO GROUP_STAR VALUES('티파니');
INSERT INTO GROUP_STAR VALUES('제시카');
INSERT INTO GROUP_STAR VALUES('수영');
INSERT INTO GROUP_STAR VALUES('써니');
INSERT INTO GROUP_STAR VALUES('서현');
INSERT INTO GROUP_STAR VALUES('탑');
INSERT INTO GROUP_STAR VALUES('지드래곤');
INSERT INTO GROUP_STAR VALUES('대성');
INSERT INTO GROUP_STAR VALUES('승리');
INSERT INTO GROUP_STAR VALUES('태양');


-- SINGLE_STAR 테이블에 샘플 데이터 추가하기
INSERT INTO SINGLE_STAR VALUES('태연');
INSERT INTO SINGLE_STAR VALUES('지드래곤');
INSERT INTO SINGLE_STAR VALUES('대성');
INSERT INTO SINGLE_STAR VALUES('태양');
INSERT INTO SINGLE_STAR VALUES('아이유');
INSERT INTO SINGLE_STAR VALUES('백지영');
INSERT INTO SINGLE_STAR VALUES('윤종신');

COMMIT;



-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 테이블 제거
DROP TABLE IF EXISTS auth       ; -- auth 테이블
DROP TABLE IF EXISTS book       ; -- 사원 테이블
DROP TABLE IF EXISTS customer   ; -- Customer 테이블
DROP TABLE IF EXISTS orders     ; -- GROUP_STAR 테이블



-- auth 테이블 
CREATE TABLE auth (
      authid    INT  PRIMARY KEY
    , name      VARCHAR(50)
    , birth     VARCHAR(10)
);


-- book 테이블 생성
CREATE TABLE book (
      bookid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , bookname      VARCHAR(50)
    , publisher     VARCHAR(40)
    , year          VARCHAR(10)
    , price         INT
    , dtm           DATE
    , use_yn        BIT
    , authid        INT
);

-- 고객 테이블 생성
CREATE TABLE  customer (
      custid        INT PRIMARY KEY  
    , name          VARCHAR(40)
    , address       VARCHAR(50)
    , phone         VARCHAR(20)
);

-- 주문 테이블 생성
CREATE TABLE orders (
      orderid       INT PRIMARY KEY 
    , custid        INT REFERENCES Customer(custid)
    , bookid        INT REFERENCES Book(bookid)
    , saleprice     INT 
    , orderdate     DATE
);


-- Auth, Book, Customer, Orders 데이터 생성
INSERT INTO auth( authid, name, birth)   VALUES(  1, 'bob' , '1970.05.01' ) ;
INSERT INTO auth( authid, name, birth)   VALUES(  2, 'kim' , '1980.05.01' ) ;
INSERT INTO auth( authid, name, birth)   VALUES(  7, 'park', '2000.05.01' ) ;
INSERT INTO auth( authid, name, birth)   VALUES( 11, 'park', '2000.05.01' ) ;


INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid) VALUES('Operating System'  , 'Wiley'     , '2003', 30700, '2004-01-01', 0, 1 ) ;
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid) VALUES('MySQL'             , 'OReilly'   , '2009', 58700, '2010-01-01', 1, 2 ) ;
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid) VALUES('JAVA'              , 'Hall'      , '2013', 40000, '2014-01-01', 1, 3 ) ;
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid) VALUES('First SQL'         , 'Wiley'     , '2015', 57700, '2016-01-01', 1, 4 ) ;

INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('축구의 역사'      , '굿스포츠'  , '2001',  7000, '2001-01-01', 1,  1);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('축구아는 여자'    , '나무수'    , '2002', 13000, '2002-02-02', 1,  2);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('축구의 이해'      , '대한미디어', '2003', 22000, '2003-03-03', 1,  3);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('골프 바이블'      , '대한미디어', '2004', 35000, '2004-04-04', 1,  4);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('피겨 교본'        , '굿스포츠'  , '2005',  8000, '2005-05-05', 1,  5);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('역도 단계별기술'  , '굿스포츠'  , '2006',  6000, '2006-06-06', 1,  6);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('야구의 추억'      , '이상미디어', '2007', 20000, '2007-07-07', 1,  7);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('야구를 부탁해'    , '이상미디어', '2008', 13000, '2008-08-08', 1,  8);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('올림픽 이야기'    , '삼성당'    , '2009',  7500, '2009-09-09', 1,  9);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('Olympic Champions', 'Pearson'   , '2010', 13000, '2010-10-10', 1, 10);


INSERT INTO customer VALUES (1, '박지성', '영국 맨체스타'  , '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울'  , '000-6000-0001');  
INSERT INTO customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO customer VALUES (5, '박세리', '대한민국 대전'  ,  NULL);


-- 주문(Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO orders VALUES ( 1, 1,  5,  6000, '2014-07-01' ); 
INSERT INTO orders VALUES ( 2, 1,  7, 21000, '2014-07-03' );
INSERT INTO orders VALUES ( 3, 2,  9,  8000, '2014-07-03' ); 
INSERT INTO orders VALUES ( 4, 3, 10,  6000, '2014-07-04' ); 
INSERT INTO orders VALUES ( 5, 4, 11, 20000, '2014-07-05' );
INSERT INTO orders VALUES ( 6, 1,  6, 12000, '2014-07-07' );
INSERT INTO orders VALUES ( 7, 4, 12, 13000, '2014-07-07' );
INSERT INTO orders VALUES ( 8, 3, 14, 12000, '2014-07-08' ); 
INSERT INTO orders VALUES ( 9, 2, 14,  7000, '2014-07-09' ); 
INSERT INTO orders VALUES (10, 3, 12, 13000, '2014-07-10' );


COMMIT;


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 재귀적, 계층형 쿼리 예제 데이터
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 테이블 제거
DROP TABLE IF EXISTS `부서`       ; 
DROP TABLE IF EXISTS `실적`       ; 


CREATE TABLE `부서` ( 
      `부서코드`     VARCHAR(4)  PRIMARY KEY
    , `부서명`       VARCHAR(30) NOT NULL
    , `상위부서코드` VARCHAR(4)  NULL
);

CREATE TABLE `실적`  ( 
      `년월`     VARCHAR(7) NOT NULL
    , `부서코드` VARCHAR(4) NOT NULL
    , `금액`     INT        NOT NULL       
    
    , CONSTRAINT PK_실적 PRIMARY KEY ( `년월`, `부서코드`)
);


INSERT INTO `부서`
SELECT '1000', '대표이사'   , NULL    UNION ALL
SELECT '1100', '영업1본부'  , '1000'  UNION ALL
SELECT '1200', '영업2본부'  , '1000'  UNION ALL
SELECT '1110', '국내영업1부', '1100'  UNION ALL
SELECT '1120', '국내영업2부', '1100'  UNION ALL
SELECT '1210', '해외영업1부', '1200'  UNION ALL
SELECT '1220', '해외영업2부', '1200'  UNION ALL
SELECT '1111', '수도권지부' , '1110'  UNION ALL
SELECT '1112', '강원지부'   , '1110'  UNION ALL
SELECT '1121', '호남지부'   , '1120'  UNION ALL
SELECT '1122', '경남지부'   , '1120'  
;



INSERT INTO `실적`
SELECT '2013.07', '1210', 1000  UNION ALL
SELECT '2013.07', '1220', 1000  UNION ALL
SELECT '2013.07', '1111', 1000  UNION ALL
SELECT '2013.07', '1112', 1000  UNION ALL
SELECT '2013.07', '1121', 1000  UNION ALL
SELECT '2013.07', '1122', 1000  
;

COMMIT;

