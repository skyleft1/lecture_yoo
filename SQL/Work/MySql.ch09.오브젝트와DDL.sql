-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 타입
-- 
-- 문자열  : CHAR VS VARCHAR VS VARCHAR2
-- 숫자    : NUMERIC
-- 날짜    : DATE
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 오브젝트 타입test
-- 
-- 테이블   ( TABLE     )

-- 뷰       ( VIEW      )
-- 인덱스   ( INDEX     )
-- 시퀀스   ( SEQUENCE  )

-- 프로시저 ( PROCEDURE )
-- 함수     ( FUNCTION  )

-- 트리거   ( TRIGGER   )
-- 패키지   ( PACKAGE   )
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 오브젝트 조작 : DDL
-- CREATE 
-- ALTER 
-- DROP
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- DDL(CREATE/ALTER/DROP) 이란?
--    오브젝트를 조작하기 위한 SQL.
-- 
-- CREATE  TABLE 이름 | VIEW 이름 | INDEX idx_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- ALTER   TABLE 이름 | VIEW 이름 | INDEX idx_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- DROP    TABLE 이름 | VIEW 이름 | INDEX idx_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

--############
-- 뷰는 가상 테이블이다. 읽기 전용 select 문
-- 사용 목적
--     1. 보안
--     2. 간편한 사용
-- 뷰 생성시 WITH READ ONLY 옵션을 추가.
-- ############



-- ############
-- 사용목적
-- 인덱스는 데이터 검색시 속도 향상을 위해서 사용.
--     1. 찾는속도를 빨리하기 위해서
-- where절에서 사용되는 컬럼에는 인덱스 적용을 고려하시오.
-- where절에서 사용되는 모든 컬럼에 인덱스를 걸라는 말씀은 아닙니다.
-- 해당컬럼의 중복률이 10% 이하일때는 인덱스를 거는 것이 유리함

-- ############

-- INDEX1 삭제 
-- DROP INDEX INDEX1;



-- ############
-- 시퀀스
-- 사용목적
--  1.자동 증가값 만들 때 사용.

-- mysql에서의 시퀀스 만드는법
--  1.테이블 생성시 auto_intcrement를 사용하면 된다.

-- ############




-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 테이블 
-- 테이블 만들기     :  CREATE TABLE   테이블명                 ;
-- 테이블 변경       :  ALTER  TABLE   테이블명                  ; 
-- 테이블 삭제       :  DROP   TABLE   테이블명                 ;
-- 테이블 이름 바꾸기:  EXEC sp_rename 테이블명, 새로운테이블명    ; 
-- 테이블 복제       :  SELECT *  INTO 새테이블명 FROM 원본테이블;
-- 테이블 로우 제거  :  TRUNCATE TABLE 테이블명                 ; // DELETE 보다 속도가 빠름.
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

/* 테이블 생성 */
-- create table [테이블명](id int,name varchar(20));

/* 컬럼 추가 */
-- alter table [테이블명] add [컬럼명] [타입] [옵션]; 
-- ex) alter table [테이블명] add [컬럼명] varchar(100) not null default '0'; 

/* 컬럼 삭제 */
-- alter table [테이블명] drop [컬럼명];

/* 컬럼명 변경 및 타입 변경 */
-- alter table [테이블명] change [컬럼명] [변경할컬럼명] varchar(12);

/* 컬럼 타입 수정 */
-- alter table [테이블명] modify [컬럼명] varchar(14);

/* 테이블명 수정 */
-- alter table [테이블명] rename [변경할테이블명];

/* 테이블 삭제 */
-- drop table [테이블명];




-- 테이블 추가 
-- -- ename: 문자열 , job: 문자열,  email: 문자열  , address: 문자열
-- -- sex: F 또는 M중 하나 ,  phone: 11~13자리, 
-- -- birthday : 날짜만저장,   birthtime : 생시. 시간만저장,  
-- -- age: 정수.999까지만 저장가능하게.,   height: 실수. 정수부분은 3자리, 소수부분은 2자리까지

CREATE TABLE dept01 (
		ename			nvarchar(15) ,
		job			nvarchar(5) ,
		email			nvarchar(25) ,
		address		nvarchar(100) ,
		sex			char(1) check( sex in ('F', 'M')) ,
		phone			varchar(15) ,
		birthday		Date ,
		birthtime	Time ,
		age 			decimal(3,0) ,
		height 		decimal(5,2) 
		);

-- INSERT 이용하여 데이터 입력하시오
-- -- ename: abc, 나머지 전부 null
INSERT INTO dept01 (ename, job, email, address, sex ,phone	,birthday,birthtime, age,height ) VALUES ('abc', null, null, null, null, null, null, null, null, null);
INSERT INTO dept01 VALUES ('abc', null, null, null, null, null, null, null, null, null);

INSERT INTO dept01 (ename) VALUES ('abc');

-- 테이블 삭제
DROP TABLE IF EXISTS dept01;

-- dept01 테이블 수정 -> email 컬럼에 not null 을 추가하라
ALTER TABLE dept01 MODIFY email nvarchar(25) NOT NULL;


-- dept01 테이블 수정 -> email 컬럼에 not null과 constratint 를 추가하라
-- 안댐 ALTER TABLE dept01 MODIFY email nvarchar(25) CONSTRAINT email_ct NOT NULL;


-- dept01 테이블 수정 -> dept01 테이블에 시퀀스(auto_increment)를 추가하시오
ALTER TABLE dept01 ADD pid INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
-- 앞으로 데이터를 넣을때마다 pid 값이 1씩 증가한다는 뜻
INSERT INTO dept01 (ename, email) VALUES ('abc', 'hf');




-- QQQ1 dept01 테이블에 salary 컬럼을 숫자형으로 추가.
-- -- 정수 10자리와 소수점 3자리로 만드시오 + nutnull 조건을 설정하시오
ALTER TABLE dept01 ADD salary decimal(13, 3) NOT NULL;


-- QQQ2 address 컬럼 타입을 nvarchar(1000)으로 바꾸시오.
ALTER TABLE dept01 MODIFY address nvarchar(1000);


-- QQQ3 dept01 테이블에서 birthtime 컬럼을 삭제하라
ALTER TABLE dept01 DROP birthtime;



-- 테이블 이름 바꾸기

-- dept01을 dept_new로 바꾸시오
RENAME TABLE dept01 To dept_new;


-- 테이블 복제
-- dept 테이블 복제(전체)해서 dept02 만드시오
DROP TABLE IF EXISTS dept02;
CREATE TABLE dept02 as SELECT * FROM dept ;
-- dept 테이블 복제(테이블 구조만)해서 dept03 만드시오
CREATE TABLE dept03 LIKE dept ;


-- QQQ4 dept 테이블에 auto_increment 컬럼을 추가해라
-- ALTER TABLE 테이블명 ADD COLUMN 컬럼명 INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE dept DROP PRIMARY KEY;

ALTER TABLE dept ADD pid INT NOT NULL auto_increment primary key;


-- QQQ5 dept 테이블을 복제해서 dept11, dept12를 만들어라.
-- 테이블 복제 후 auto_increament 조건을 pid 칼럼에 추가하라
DROP TABLE IF EXISTS dept11;
DROP TABLE IF EXISTS dept12;

CREATE TABLE dept11 AS SELECT * FROM dept;
CREATE TABLE dept12 AS SELECT * FROM dept;

ALTER TABLE dept11 MODIFY pid INT NOT NULL auto_increment primary key;
ALTER TABLE dept12 MODIFY pid INT NOT NULL auto_increment primary key;


-- QQQ6 dept11 테이블은 delete를 이용하여 데이터를 제거하라 
-- -- delete 방식은 auto_increment 컬림 초기화 안됨
DELETE FROM dept11;
INSERT INTO dept11 (deptno, dname) VALUES(60, 'aaaa');
INSERT INTO dept11 (deptno, dname) VALUES(60, 'Aaaaa');
DROP TABLE dept11;



-- QQQ7 dept12 테이블은 truncate를 이용하여 데이터를 제거하라 
-- -- truncate 방식은 auto_increment 컬림 초기화 됨
TRUNCATE TABLE dept12;
INSERT INTO dept12 (deptno, dname) VALUES(60, 'aaaa');
INSERT INTO dept12 (deptno, dname) VALUES(60, 'Aaaaa');
DROP TABLE dept12;



-- QQQ8 dept02 테이블의 데이터를 모두 제거하라
-- 방법1)
DROP TABLE IF EXISTS dept02;
CREATE TABLE dept02 as SELECT * FROM dept03 ;
-- 방법2)
DELETE FROM dept02;


-- 테이블 로우만 제거



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 테이블 변경
-- 테이블에 컬럼 추가      : ALTER TABLE 테이블명 ADD          컬럼이름 컬럼타입 
-- 테이블에 컬럼 삭제      : ALTER TABLE 테이블명 DROP  COLUMN 컬럼이름 
-- 테이블에 컬럼 타입 변경 : ALTER TABLE 테이블명 ALTER COLUMN 컬럼이름 컬럼타입
-- 테이브에 컬럼 이름 변경 : EXEC SP_RENAME '테이블이름.컬럼이름' , '새컬럼이름', 'COLUMN'
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- 컬럼 존재 여부 체크 : COL_LENGTH('테이블명','컬럼명') 


-- 테이블에 컬럼 추가


-- 테이블에 컬럼 삭제


-- 테이블에 컬럼 타입 변경

-- 테이블 이름 바꾸기:  

-- 테이블 컬럼 이름 변경




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 딕셔너리. 
-- 테이블과 컬럼에 관련된 정보를 보여주기 시스템 테이블
-- 딕셔너리 종류: user, all, dba
--
-- v$database
-- v$thread
-- v$instance
--
-- user_tables
-- all_tables
-- dba_tables
--
-- user_constraints 
-- user_cons_columns 
-- user_tab_columns
--
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2



--########################
-- Database 목록 조회
--########################



--########################
-- 오브젝트 목록 조회
--########################



--########################
-- 테이블 목록 조회 
--########################



--########################
-- 컬럼 목록 조회
--########################




-- =============================================
-- 테이블의 FOREIGN KEY 삭제
-- =============================================







--########################
-- 임시 테이블
--  Refernce:  http://stackoverflow.com/questions/1799128/oracle-if-table-exists
--########################

-- 임시 테이블 삭제

--  Refernce:  http://blog.naver.com/PostView.nhn?blogId=jupita&logNo=20004844541
-- 1. 임시 테이블 생성

-- 2. 임시 테이블에 인덱스 만들기 

-- 3. 임시 테이블에 데이터 insert

-- 4. 임시 테이블에서 데이터 가져오기

-- 5. 임시 테이블의 데이터를 메모리에서 삭제
-- "on commit delete rows" 옵션 때문에 임시 테이블의 모든 데이터가 삭제 됨
-- 테이블은 삭제 되지 않음. 데이터만 삭제 됨
