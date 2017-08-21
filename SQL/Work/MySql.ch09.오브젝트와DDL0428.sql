-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 타입
-- 
-- 문자열   : CHAR VS VARCHAR VS NVARCHAR
-- 숫자     : DECIMAL
-- 날짜     : DATETIME
-- 바이너리 : BLOB
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- 오브젝트 타입
-- 
-- 테이블   ( TABLE     )
-- 뷰       ( VIEW      )
-- 인덱스   ( INDEX     )
-- 시퀀스   ( SEQUENCE  )
-- 프로시저 ( PROCEDURE )
-- 함수     ( FUNCTION  )
-- 트리거   ( TRIGGER   )
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- 오브젝트 CUD 조작 : DDL
-- CREATE 
-- ALTER 
-- DROP
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- DDL(CREATE/ALTER/DROP) 이란?
--    오브젝트를 조작하기 위한 SQL.
-- 
-- CREATE  TABLE tb_이름 | VIEW vw_이름 | INDEX ix_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- ALTER   TABLE tb_이름 | VIEW vw_이름 | INDEX ix_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- DROP    TABLE tb_이름 | VIEW vw_이름 | INDEX ix_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- ############
-- 뷰란? 가상 테이블이다. 
--       읽기 전용 select 문이다.
-- 
-- 뷰를 왜 사용하는가?
--     1. 보안
--     2. 간편한 사용
-- ############



-- ############
-- 인덱스는 데이터 검색시 속도 향상을 위해서 사용.
-- 인덱스를 왜 사용하는가?
--   찾는 속도를 빠르게 하기 위해서.
-- 
-- 인덱스 생성 규칙
-- 	where절에서 사용되는 컬럼에는 인덱스 적용을 고려한다..
-- 	where절에서 사용되는 모든 컬럼에 인덱스를 걸라는 말씀은 아닙니다.
--    해당 컬럼 데이터 중복률이 10%이하일 때는 인덱스를 것이 유리하다.
-- 
-- ############


-- ############
-- 시퀀스는 왜 사용하는가?
-- 	자동 증가값 만들 때 사용.
-- 
-- MySQL에서는 시퀀스를 어떻게 만드는가?
--    테이블 생성시 auto_increment를 사용하면 된다.
-- ############




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 테이블 CUD
-- 
-- 테이블 삭제           : DROP   TABLE  테이블명                   ;
-- 테이블 추가           : CREATE TABLE  테이블명                   ;
-- 
-- 테이블 변경           : ALTER  TABLE  테이블명                   ; 
-- 테이블 컬럼 추가      : ALTER  TABLE  테이블명 ADD          컬럼이름 컬럼타입 
-- 테이블 컬럼 삭제      : ALTER  TABLE  테이블명 DROP  COLUMN 컬럼이름 
-- 테이블 컬럼 타입 변경 : ALTER  TABLE  테이블명 ALTER COLUMN 컬럼이름 컬럼타입
-- 테이블 제약 조건 변경 : ALTER  TABLE  테이블명 ALTER COLUMN 컬럼이름 컬럼타입
-- 테이블 컬럼 이름 변경 : EXEC SP_RENAME '테이블이름.컬럼이름' , '새컬럼이름', 'COLUMN'
-- 
-- 테이블 이름 변경 : 
--    
-- 테이블 복제      :  SELECT *  INTO 새테이블명 FROM 원본테이블 ;
-- 
-- 테이블 로우 제거 :  
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept01 테이블을 삭제하시오.
DROP TABLE dept01;


-- dept01 테이블을 추가하시오.
-- 컬럼에는 
-- ename     : 문자열
-- job       : 문자열
-- email     : 문자열 
-- address   : 문자열
-- sex       : F 또는 M  두개중에 한개만 저장될 수 있게.
-- phone     : 11자리~15자리
-- birthday  : 생일. 날짜만 저장.
-- birthtime : 생시. 시간만 저장.
-- age       : 정수. 999 까지만 저장가능하게. 
-- height    : 실수. 정수부분은 3자리, 소수부분은 2자리까지.

CREATE TABLE dept01 (
	ename			nvarchar(22), 
	job			nvarchar(22), 
	email			nvarchar(22), 
	address		nvarchar(100), 
	sex			char(1), 
	phone			varchar(15), 
	birthday		date, 
	birthtime	time, 
	age			decimal(3, 0), 
	height		decimal(5, 2)
	
	);



-- dept01 테이블을 수정하시오.
-- email 컬럼에 not null 을 설정하시오.
ALTER TABLE dept01 MODIFY email varchar(22) NOT NULL ;


-- dept01 테이블에 시컨스(auto_increment)를 추가하시오.
ALTER TABLE dept01 ADD pid INT NOT NULL auto_increment PRIMARY KEY ;


-- insert를 이용하여 데이터를 입력하시오. 
-- ename: abc, 나머지 컬럼 값은 null로
INSERT INTO dept01 (ename) VALUES ('abc');


-- 문제. dept01 테이블에 salary 컬럼을 추가하되

-- 타입은 숫자형으로 하고 정수 10자리와 소수점 3자리,
-- 그리고 not null 조건을 설정하시오.
ALTER TABLE dept01 ADD salary decimal(13, 3) NOT NULL;

-- 문제. dept01 테이블의 addres 컬럼 타입을 nvarchar(1000)으로 바꾸시오.
ALTER TABLE dept01 MODIFY address nvarchar(1000) ;


-- 문제. dept01 테이블에서 birthtime 컬럼을 삭제하시오.
ALTER TABLE dept01 DROP birthtime;

-- 테이블 이름 바꾸기
-- dept01 을 dept_new로 바꾸시오.
ALTER TABLE dept01 rename dept_new1;

-- 테이블 구조와 데이터를 복제
-- dept 테이블을 복제해서 dept02 테이블을 만드시오.

-- 테이블이 없는 경우에 테이블과 데이터를 복제 하는 방법
-- CREATE TABLE 새로만들테이블명 AS SELECT * FROM 복사할테이블명;
DROP TABLE IF EXISTS dept02;
CREATE TABLE dept02 SELECT * FROM dept;

-- 테이블 구조만 복제
-- dept 테이블 구조를 복제해서 dept03 테이블을 만드시오.
DROP TABLE IF EXISTS dept03;
CREATE TABLE dept03 LIKE dept;


-- 테이블 @@데이터@@만 복제
-- dept 테이블 데이터를 복제해서 dept03 테이블에 넣어라
INSERT INTO dept03 SELECT * FROM dept;

-- 문제. dept 테이블에 auto_increment를 갖는 pid 컬럼 를 추가하시오.
-- primary key 삭제
ALTER TABLE dept DROP pid;
ALTER TABLE dept DROP PRIMARY KEY;

ALTER TABLE dept DROP AUTO_INCREMENT=1;
-- pid 컬럼 추가.
ALTER TABLE dept ADD pid int NOT NULL AUTO_INCREMENT PRIMARY KEY;


-- 문제. dept 테이블을 복제해서 dept11 테이블을 만드시오.
-- 테이블 복제후 auto_increment 조건을 pid 컬럼에 추가하시오.
DROP TABLE IF EXISTS dept11;
CREATE TABLE dept11 SELECT * FROM dept;
ALTER TABLE dept11 MODIFY pid INT NOT NULL auto_increment primary key;

-- 문제. dept 테이블을 복제해서 dept12 테이블을 만드시오.
-- 테이블 복제후 auto_increment 조건을 pid 컬럼에 추가하시오.
DROP TABLE IF EXISTS dept12;
CREATE TABLE dept12 SELECT * FROM dept;
ALTER TABLE dept12 MODIFY pid INT NOT NULL auto_increment primary key;

-- 문제. dept11 테이블은 delete을 사용하여 데이터를 제거하시오.
-- delete   방식:  auto_increment 컬럼 초기화 안됨
delete from 테이블이름

-- 문제. dept12 테이블은 truncate을 사용하여 데이터를 제거하시오.
-- truncate 방식:  auto_increment 컬럼 초기화 됨
truncate table 테이블이름


-- 테이블에 컬럼 추가
ALTER TABLE dept11 ADD [테이블명] [형식] [제약조건] ;

-- 테이블에 컬럼 삭제
ALTER TABLE dept11 DROP [테이블명]  ;


-- 테이블에 컬럼 타입 변경
ALTER TABLE dept11 MODIFY [테이블명] [형식] [제약조건] ;

-- 테이블 이름 바꾸기:  
RENAME TABLE [테이블명]  TO [테이블명];


-- 테이블 컬럼 이름 변경
ALTER TABLE dept11 RENAME [테이블명] ;




