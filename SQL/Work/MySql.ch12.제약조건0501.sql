-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- 테이블 제약 조건
-- 
-- 컬럼에 제약 조건 설정 
-- 	  * NOT NULL 조건
-- 
-- 	  * DEFAULT 조건
-- 
-- 
-- 테이블에 제약 조건 설정
-- 
--     * 기본키(PRIMARY KEY)란?
--         테이블에서 유일성(UNIQUE)을 만족하는 대표 컬럼들..
--         주식별자.
--         ex) 주민번호
--     
--     * 외래키(FOREIGN KEY)란?
--         부모 자식 관계가 성립되는 테이블에서 부모를 찾기 위해 사용되는 컬럼들.
--         자식 테이블에서 설정.
--         외래식별자. 부모를 참조하는 컬럼들.
--     
--     * 유일키(Unique KEY)란?
--         유일하게 식별할 수 있는 최소 컬럼의 집합
--         슈퍼키, 후보키 
--         ex) 주민번호, 핸드폰번호, 계좌번호, ....
--     
-- 기본키, 외래키, 유일키는 테이블에 적용되는 것이다.
-- 
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  
-- @@@@@@@@@@@@@
-- emp02 테이블 생성 
-- @@@@@@@@@@@@@

-- emp02 테이블 데이터 insert 테스트.
-- 모든 컬럼에 null 값을 채워서 insert 하시오.

-- @@@@@@@@@@@@@
-- emp03 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.

DROP TABLE IF EXISTS emp03;
CREATE TABLE emp03 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) 
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);

-- @@@@@@@@@@@@@

-- emp03 테이블 데이터 insert 테스트.
-- 모든 값을 null 채워서 insert 하시오. 불가능. not null 조건 때문에.
INSERT INTO emp03 VALUES(null, null, null, null, null, null);
-- empno에 10, ename에 abcd를 insert 하시오.
INSERT INTO emp03 (empno, ename) VALUES(10, 'abcd');


-- @@@@@@@@@@@@@
-- emp04 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
DROP TABLE IF EXISTS emp04;
CREATE TABLE emp04 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);
-- @@@@@@@@@@@@@

-- emp04 테이블 데이터 insert 테스트.
-- 모든 값을 null 채워서 insert 하시오. 불가능. not null 조건 때문에.

-- empno에 10, ename에 abcd를 insert 하시오.




-- @@@@@@@@@@@@@
-- 문제. emp05 테이블 생성과 제약 조건 변경.
-- emp01 테이블을 복제하여 emp05 테이블 만드시오.
-- emp05 테이블 컬럼에 alter를 이용하여 제약 조건을 추가하시오.
-- 		empno 에 not null 조건 설정.
-- 		ename 에 not null 조건 설정.
-- 		comm  에 default 조건 설정. default 값을 10을 사용.
DROP TABLE IF EXISTS emp05;
CREATE TABLE emp05 (
	empno		decimal(4,0) 
	, ename 	nvarchar(15) 
	, sal		decimal(7,2)
	, comm	decimal(7,2) 
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);
	
ALTER TABLE emp05 MODIFY empno decimal(4,0) NOT NULL;
ALTER TABLE emp05 MODIFY ename nvarchar(15) NOT NULL;
ALTER TABLE emp05 MODIFY comm nvarchar(15) NOT NULL;

-- @@@@@@@@@@@@@




-- @@@@@@@@@@@@@
-- emp06 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 에 primary key 조건 설정.
DROP TABLE IF EXISTS emp06;
CREATE TABLE emp06 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	, primary key (empno)
	);


-- @@@@@@@@@@@@@



-- @@@@@@@@@@@@@
-- emp07 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 와 ename  에 primary key 조건 설정.
DROP TABLE IF EXISTS emp07;
CREATE TABLE emp07 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	, primary key (empno, ename)
	);


-- @@@@@@@@@@@@@


-- @@@@@@@@@@@@@
-- emp08 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 와 ename  에 primary key 조건 설정.
-- empno 와 deptno 에 unique  조건 설정.
DROP TABLE IF EXISTS emp08;
CREATE TABLE emp08 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	, primary key (empno, ename)
	, unique key (empno, deptno)
	);

-- @@@@@@@@@@@@@



-- @@@@@@@@@@@@@
-- emp09 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 와 ename  에 primary key 조건 설정.
-- empno 와 deptno 에 unique  조건 설정.
-- deptno 에 foreign key 조건 설정.
DROP TABLE IF EXISTS emp09;
CREATE TABLE emp09 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	int
	, primary key(empno, ename)
	, unique key(empno, deptno)
	, foreign key(deptno) REFERENCES dept33(deptno)
	);
	show index from emp09;

-- deptno(부모) primary key 를 설정해야만 한다
-- CREATE TABLE dept33 like dept04;
-- ALTER TABLE dept33 MODIFY deptno int not null primary key;

	
-- @@@@@@@@@@@@@


-- emp10 테이블 생성하시오.
-- empno 에 not null 조건 설정
-- ename 에 not null 조건 설정
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- deptno 는 int 타입으로 설정
-- empno 와 ename  에 primary key 조건을 걸고 조건명으로  emp10_pk 이름을 설정
-- empno 와 deptno 에 unique  조건을 걸고 조건명으로  emp10_uk 이름을 설정
-- deptno 에 foreign key 조건을 걸고 조건명으로  emp10_fk 이름을 설정
DROP TABLE IF EXISTS emp10;
CREATE TABLE emp10 (
	empno		decimal(4,0) NOT NULL
	, ename 	nvarchar(15) NOT NULL
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	int
	, constraint emp10_pk primary key(empno, ename) 
	, constraint emp10_uk unique key(empno, deptno)
	, constraint emp10_fk foreign key(deptno) REFERENCES dept33(deptno)
	);
show index from emp10;




-- @@@@@@@@@@@@@@@@
-- alter를 이용한 제약 조건 추가
-- @@@@@@@@@@@@@@@@
-- emp02.empno에 primary key 추가
-- -- 1) emp02 테이블에 primary key 있으면 삭제
-- -- 2) emp02 테이블에 primary key 추가
ALTER TABLE emp02 ADD PRIMARY KEY(empno) ;


-- emp02.deptno에 foreign key 추가
show index from emp02;
ALTER TABLE emp02 MODIFY deptno int ;
ALTER TABLE emp02 add foreign key(deptno) references dept(deptno);


-- emp02.job에 unique 추가
ALTER TABLE emp02 add unique key(job) ;
show index from emp02;


-- @@@@@@@@@@@@@@@@
-- alter를 이용한 제약 조건 수정
-- @@@@@@@@@@@@@@@@

-- emp02.ename에 default 값을 abc로 바꾸시오.


-- emp02.job default 값을 '인턴'로 바꾸시오.
alter table emp02 modify job varchar(4) default '인턴';
show columns from emp02;

-- emp02.ename 을 not null 로 바꾸시오.
alter table emp02 modify ename varchar(15) not null default 'abc';
show columns from emp02;


-- emp02.job 을 null 허용으로 바꾸시오.
alter table emp02 modify job varchar(4) null default '인턴';
show columns from emp02;


-- @@@@@@@@@@@@@@@@
-- alter를 이용한 제약 조건 삭제
-- @@@@@@@@@@@@@@@@

-- emp02에서 primary key 조건 삭제하기
alter table emp10 DROP primary key;
show columns from emp10;

-- emp02에서 foreign key 조건 삭제하기
show index from emp10;
alter table emp10 DROP key emp10_fk;
alter table emp10 DROP foreign key emp10_fk;

-- emp02에서 unique 조건 삭제하기
show index from emp10;
alter table emp10 DROP key emp10_uk;
show columns from emp10;




-- ######################  
-- 미션. 외래키를 설정하시오
-- 
-- auth와 book 테이블이 존재한다. 이 두 테이블간에 릴레이션을 설정하려고 한다.
-- auth.authid와 book.authid 에 auth_book_fk 라는 이름의 외래키를 설정하시오.
-- 외래키 설정이 안된다면 왜 안되는 것인가?
-- 어떻게 하면 외래키 설정 문제를 해결 할 수 있을 것인가?
-- 
-- ######################
show columns from auth;
show columns from book;
ALTER TABLE book ADD constraint auth_book_fk foreign key (authid) references auth(authid);
show index from book;

alter table book drop foreign key auth_book_fk ;



-- 차집합 구하기 book - auth
-- 조인을 사용한다.
SELECT * FROM book left join auth on book.authid = auth.authid   -- null 로 표시되는 애들은 부모에만 있는 데이터다
WHERE auth.authid is null ;  -- book 테이블에만 있는 데이터가 출력되게된다.
-- 위에 출력된 데이터들 때문에 외래키가 설정이 안되는 것임.
-- 이를 해결하기 위해서는 1) 저 null 데이터(자식)를 삭제하거나  2) 부모테이블에 없는 데이터를 넣어주어야 한다.


START TRANSACTION

-- 1) 자식 데이터 삭제
delete book from book left join auth on book.authid = auth.authid WHERE auth.authid is null;

-- 2) 부모 데이터 추가
insert into auth (authid) values(3), (4), (5), (6), (8), (9), (10);
select distinct book.authid 


ALTER TABLE book ADD constraint auth_book_fk foreign key (authid) references auth(authid);
show index from book;

alter table book drop foreign key auth_book_fk ;s


ROLLBACK;


INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid) VALUES('JAVA'              , 'Hall'      , '2013', 40000, '2014-01-01', 1, 3 ) ;
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid) VALUES('First SQL'         , 'Wiley'     , '2015', 57700, '2016-01-01', 1, 4 ) ;
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('축구의 이해'      , '대한미디어', '2003', 22000, '2003-03-03', 1,  3);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('골프 바이블'      , '대한미디어', '2004', 35000, '2004-04-04', 1,  4);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('피겨 교본'        , '굿스포츠'  , '2005',  8000, '2005-05-05', 1,  5);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('역도 단계별기술'  , '굿스포츠'  , '2006',  6000, '2006-06-06', 1,  6);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('야구를 부탁해'    , '이상미디어', '2008', 13000, '2008-08-08', 1,  8);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('올림픽 이야기'    , '삼성당'    , '2009',  7500, '2009-09-09', 1,  9);
INSERT INTO book(bookname, publisher, year, price, dtm, use_yn, authid)  VALUES('Olympic Champions', 'Pearson'   , '2010', 13000, '2010-10-10', 1, 10);



-- ######################  
-- 미션. ERD를 이용해서 DB를 구축하시오
-- 
-- 아래의 조건에 맞게 테이블을 만들고 제약 조건 PK, FK를 설정하시오. 
-- 
-- * employee 테이블;                            
-- +----------+--------------+------+-----+---------+-------+    
-- | Field    | Type         | Null | Key | Default | Extra |    
-- +----------+--------------+------+-----+---------+-------+    
-- | emp_no   | decimal(4,0) | NO   | PRI | 0       |       |    
-- | emp_name | varchar(20)  | YES  |     | NULL    |       |    
-- | salary   | decimal(6,0) | YES  |     | NULL    |       |    
-- | birthday | date         | YES  |     | NULL    |       |    
-- +----------+--------------+------+-----+---------+-------+    

CREATE TABLE employee (
	emp_no 		decimal(4,0) not null default 0 primary key
	, emp_name		varchar(20)
	, salary		decimal(6,0)
	, birthday		date  
	);
	
	
--                                                               
-- * project 테이블;                             
-- +-------------+--------------+------+-----+---------+-------+ 
-- | Field       | Type         | Null | Key | Default | Extra | 
-- +-------------+--------------+------+-----+---------+-------+ 
-- | pro_no      | decimal(4,0) | NO   | PRI | 0       |       | 
-- | pro_content | varchar(100) | YES  |     | NULL    |       | 
-- | start_date  | date         | YES  |     | NULL    |       | 
-- | finish_date | date         | YES  |     | NULL    |       | 
-- +-------------+--------------+------+-----+---------+-------+ 

CREATE TABLE project (
	pro_no			decimal(4,0) not null primary key default 0
	,pro_content	varchar(100) 
	,start_date		date  
	,finish_date	date   
	);
 
--                                                               
-- * specialty 테이블;                           
-- +-----------+--------------+------+-----+---------+-------+   
-- | Field     | Type         | Null | Key | Default | Extra |   
-- +-----------+--------------+------+-----+---------+-------+   
-- | emp_no    | decimal(4,0) | NO   | PRI | 0       |       |   
-- | specialty | varchar(20)  | NO   | PRI |         |       |   
-- +-----------+--------------+------+-----+---------+-------+   

CREATE TABLE specialty (
	emp_no			decimal(4,0)	not null default 0
	,specialty		varchar(20)		not null default ''
	, primary key(emp_no, specialty)
	);

--                                                               
-- * assign 테이블;                              
-- +--------+--------------+------+-----+---------+-------+      
-- | Field  | Type         | Null | Key | Default | Extra |      
-- +--------+--------------+------+-----+---------+-------+      
-- | emp_no | decimal(4,0) | NO   | PRI | 0       |       |      
-- | pro_no | decimal(4,0) | NO   | PRI | 0       |       |      
-- +--------+--------------+------+-----+---------+-------+    

CREATE TABLE assign (
	emp_no decimal(4,0) not null default 0
	, pro_no decimal(4,0) not null default 0
	, primary key(emp_no, pro_no)
	);

-- 
-- 직원(employee) 테이블에 기본 키를 추가하시오제약조건 이름: employee_pk_empno
ALTER TABLE employee DROP PRIMARY KEY;
ALTER TABLE employee ADD constraint employee_pk_empno primary key (emp_no );


-- 프로젝트(project) 테이블에 기본 키를 추가하시오제약조건 이름: project_pk_prono
ALTER TABLE project DROP PRIMARY KEY;
ALTER TABLE project ADD constraint project_pk_prono primary key (pro_no);


-- 특기(specialty) 테이블에 기본 키를 추가하기제약조건 이름: specialty_pk  
ALTER TABLE specialty DROP PRIMARY KEY;
ALTER TABLE specialty ADD constraint specialty_pk primary key(emp_no, specialty);

-- 
-- 
-- 
-- table relation 
-- +----------------+-----------------+
-- | child table    | parent table    |
-- +----------------+-----------------+
-- | specialty      | employee        |
-- | assign         | employee        |
-- | assign         | project         |
-- +----------------+-----------------+
-- 
-- 담당(assign) 테이블에 기본 키를 추가하기제약조건 이름: assign_pk
show index from assign;
ALTER TABLE assign DROP PRIMARY KEY;
ALTER TABLE assign ADD constraint assign_pk primary key(emp_no, pro_no);

-- 특기(specialty) 테이블에 외래 키를 추가하기제약조건 이름: specialty_fk
show index from assign;
ALTER TABLE specialty ADD constraint specialty_fk foreign key(emp_no) references employee(emp_no);

-- 담당(assign) 테이블과 프로젝트 테이블 사이에 외래 키를 추가하기제약조건 이름: specialty_fk
show index from assign;
alter table assign DROP foreign key specialty_fk;
ALTER TABLE assign ADD constraint specialty_fk foreign key(pro_no) references project(pro_no);

-- 담당(assign) 테이블과 직원 테이블 사이에 외래키를 추가하기제약조건 이름: specialty_fk
show index from assign;
alter table assign DROP foreign key specialty_fk;
ALTER TABLE assign ADD constraint specialty_fk foreign key(emp_no) references employee(emp_no);
-- 
-- ######################



