
-- @@ 생성시 제약조건 설정

 
-- emp02 테이블 생성 
DROP TABLE IF EXISTS emp02;
CREATE TABLE emp02 (
		empno		decimal(4,0)
		, eanme 	nvarchar(15)
		, sal		decimal(7,2)
		, comm	decimal(7,2)
		, job		nvarchar(4)
		, deptno	decimal(2,0)
		);


-- emp03 테이블 생성
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.

DROP TABLE IF EXISTS emp03;
CREATE TABLE emp03 (
		empno		decimal(4,0) NOT NULL
		, eanme 	nvarchar(15) NOT NULL
		, sal		decimal(7,2)
		, comm	decimal(7,2)
		, job		nvarchar(4)
		, deptno	decimal(2,0)
		);


-- emp03 테이블 생성
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- sal   에 check 조건 설정 500~ 5000 사이만 허용되게 만든다.
-- comm  에 default 조건 설정

DROP TABLE IF EXISTS emp04;
CREATE TABLE emp04 (
		empno		decimal(4,0) NOT NULL
		, ename 	nvarchar(15) NOT NULL
		, sal		decimal(7,2) -- myslq 에서는 안됌 check (50 <= sal AND sal <= 5000)
		, comm	decimal(7,2) default 100
		, job		nvarchar(4)
		, deptno	decimal(2,0)
		);


-- 데이터 insert 테스트
-- 모든 값을 nulll 채워서 insert 해라  -->>> 불가능(not null 조건 떄문임)
INSERT INTO emp03 VALUES (null, null, null, null, null, null);


-- empno 에 10, ename에 abcd를 insert 해라,
INSERT INTO emp03(ename) VALUES (10);
INSERT INTO emp04(empno, ename) VALUES (10, 'abcd');


-- @@@@@@@@@@@@@
-- QQQ1 emp02 테이블 수정
-- @@@@@@@@@@@@@
-- empno  에 not null 조건 설정.
ALTER TABLE emp02 MODIFY empno decimal(4,0) NOT NULL ;
-- ename  에 not null 조건 설정.
ALTER TABLE emp02 MODIFY ename varchar(15) NOT NULL ;
-- sal    에 check 조건 설정
ALTER TABLE emp02 MODIFY sal decimal(7,2) Check (50 <= sal AND sal <= 5000) ;
-- comm   에 default 조건 설정
ALTER TABLE emp02 MODIFY comm decimal(7,2) default 123;
-- empno  에 primary key 조건 설정.
ALTER TABLE emp02 MODIFY comm decimal(7,2) default 123;
-- empno  와 ename  에 primary key 조건 설정.


-- @@@@@@@@@@@@@
-- 문제. emp05 테이블 생성과 제약 조건 변경.
-- emp02 테이블을 복제하여 emp05 테이블 만드시오.
DROP TABLE IF EXISTS emp05;
CREATE TABLE emp05 SELECT * FROm emp02
-- emp05 테이블 컬럼에 alter를 이용하여 제약 조건을 추가하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm 에 default 조건 설정. default 값을 10을 사용.
ALTER TABLE emp05 MODIFY empno decimal(4,0) NOT NULL;
ALTER TABLE emp05 MODIFY ename varchar(15) NOT NULL ;
ALTER TABLE emp05 MODIFY comm decimal(7,2) default 10;

-- @@@@@@@@@@@@@


-- primary key 설정

DROP TABLE IF EXISTS emp06;
CREATE TABLE emp06 (
		empno		decimal(4,0) NOT NULL PRIMARY KEY
		, ename 	nvarchar(15) NOT NULL
		, sal		decimal(7,2) 
		, comm	decimal(7,2) default 100
		, job		nvarchar(4)
		, deptno	decimal(2,0)
		);


-- primary key 설정 ( 2개 설정 3(개 이상도 가능하다))

DROP TABLE IF EXISTS emp07;
CREATE TABLE emp07 (
		empno		decimal(4,0) NOT NULL 
		, ename 	nvarchar(15) NOT NULL
		, sal		decimal(7,2) 
		, comm	decimal(7,2) default 100
		, job		nvarchar(4)
		, deptno	decimal(2,0)
		, PRIMARY KEY( empno, ename)
		);




DROP TABLE IF EXISTS emp08;
CREATE TABLE emp08 (
		empno		decimal(4,0) NOT NULL 
		, ename 	nvarchar(15) NOT NULL
		, sal		decimal(7,2) 
		, comm	decimal(7,2) default 100
		, job		nvarchar(4)
		, deptno	decimal(2,0)
		, UNIQUE KEY( empno, ename)
		);






-- @@@@@@@@@@@@@
-- emp02 테이블 수정
-- @@@@@@@@@@@@@
-- empno  에 not null 조건 설정.
-- ename  에 not null 조건 설정.
-- sal    에 check 조건 설정
-- comm   에 default 조건 설정

-- empno  와 ename  에 primary key 조건 설정.
-- empno  와 deptno 에 unique key 조건 설정



--@@@@@@@@@@@@@
-- emp02 테이블 수정
--@@@@@@@@@@@@@
-- empno  에 not null 조건 설정.
-- ename  에 not null 조건 설정.
-- sal    에 check 조건 설정
-- comm   에 default 조건 설정

-- empno  와 ename  에 primary key 조건 설정.
-- empno  와 deptno 에 unique  조건 설정
-- deptno 에 foreign key 조건 설정.








--@@@@@@@@@@@@@@@@
-- table created 된 후에 제약 조건 추가하기
--@@@@@@@@@@@@@@@@
-- empno에 primary key 추가

-- deptno에 foreign key 추가

-- job에 unique 추가



--@@@@@@@@@@@@@@@@
-- table created 된 후에 제약 조건 수정하기
-- 컬럼 타입 과 제약 조건 변경
--@@@@@@@@@@@@@@@@

-- 데이터 타입 바꾸기
-- ename을 varchar(20) 에서 char(100) 수정하기

-- 제약 조건 변경
-- emp02.ename 을 null 조건으로 바꾸기

-- 제약 조건 변경
-- emp02.ename 을 not null 조건으로 바꾸기


-- @@@@@@@@@@@@@@@@
-- table created 된 후에 제약 조건 삭제하기
-- @@@@@@@@@@@@@@@@

-- emp02에서 primary key 조건 삭제하기

-- emp02에서 foreign key 조건 삭제하기

-- emp02에서 unique 조건 삭제하기

-- emp02에서 check 조건 삭제하기


--######################  
-- 미션 10. ERD를 이용해서 DB를 구축하시오
--######################



-- @@ 생성시 제약조건 설정

-- emp02 테이블 수정
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.



-- EMP02 에 데이터 삽입.



-- @@@@@@@@@@@@@
-- emp02 테이블 수정
-- @@@@@@@@@@@@@
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- sal   에 check 조건 설정
-- comm  에 default 조건 설정


-- @@@@@@@@@@@@@
-- EMP02 에 데이터 삽입.
-- @@@@@@@@@@@@@
-- comm 에 100 입력됨.
-- sal 위배
-- sal 만족


