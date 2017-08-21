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
-- @@@@@@@@@@@@@

-- emp03 테이블 데이터 insert 테스트.
-- 모든 값을 null 채워서 insert 하시오. 불가능. not null 조건 때문에.

-- empno에 10, ename에 abcd를 insert 하시오.
drop table if exists emp03;
create table emp03 (
	empno		decimal(4,0) not null
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) 
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);

insert into emp03 (empno, ename) values(10, 'abcd');


-- @@@@@@@@@@@@@
-- emp04 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- @@@@@@@@@@@@@

-- emp04 테이블 데이터 insert 테스트.
-- 모든 값을 null 채워서 insert 하시오. 불가능. not null 조건 때문에.

-- empno에 10, ename에 abcd를 insert 하시오.
drop table if exists emp04;
create table emp04 (
	empno		decimal(4,0) not null
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);
insert into emp04 (empno, ename) values(10, 'abcd');



-- @@@@@@@@@@@@@
-- 문제. emp05 테이블 생성과 제약 조건 변경.
-- emp01 테이블을 복제하여 emp05 테이블 만드시오.
-- emp05 테이블 컬럼에 alter를 이용하여 제약 조건을 추가하시오.
-- 		empno 에 not null 조건 설정.
-- 		ename 에 not null 조건 설정.
-- 		comm  에 default 조건 설정. default 값을 10을 사용.
-- @@@@@@@@@@@@@
drop table if exists emp05;
create table emp05 (
	empno		decimal(4,0) not null
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);



-- @@@@@@@@@@@@@
-- emp06 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 에 primary key 조건 설정.
-- @@@@@@@@@@@@@
drop table if exists emp06;
create table emp06 (
	empno		decimal(4,0) not null primary key 
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	);


-- @@@@@@@@@@@@@
-- emp07 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 와 ename  에 primary key 조건 설정.
-- @@@@@@@@@@@@@
drop table if exists emp07;
create table emp07 (
	empno		decimal(4,0) not null 
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	, primary key (empno, ename)
	);


-- @@@@@@@@@@@@@
-- emp08 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 와 ename  에 primary key 조건 설정.
-- empno 와 deptno 에 unique  조건 설정.
-- @@@@@@@@@@@@@
drop table if exists emp08;
create table emp08 (
	empno		decimal(4,0) not null 
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	decimal(2,0)
	, primary key (empno, ename)
	, unique key (empno, deptno)
	);


-- @@@@@@@@@@@@@
-- emp09 테이블 생성하시오.
-- empno 에 not null 조건 설정.
-- ename 에 not null 조건 설정.
-- comm  에 default 조건 설정. default 값으로 100 사용.
-- empno 와 ename  에 primary key 조건 설정.
-- empno 와 deptno 에 unique  조건 설정.
-- deptno 에 foreign key 조건 설정.
-- @@@@@@@@@@@@@
drop table if exists emp09;
create table emp09 (
	empno		decimal(4,0) not null 
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	int
	, primary key (empno, ename)
	, unique key (empno, deptno)
	, foreign key (deptno) references dept09(deptno)
	);
	show index from emp08;

drop table if exists dept09;
create table dept09 like dept;
alter table dept09 drop pid ;
alter table dept09 modify deptno int not null primary key;


-- @@@@@@@@@@@@@
-- emp10 테이블 생성하시오.
-- empno 에 not null 조건을 사용하시오.
-- ename 에 not null 조건을 사용하시오.
-- comm  에 default 조건을 걸고 default 값으로 100 사용.
-- deptno는 int 타입으로.
-- empno 와 ename  에 primary key 조건을 걸고 조건명으로 emp10_pk을 사용하시오.
-- empno 와 deptno 에 unique  key 조건을 걸고 조건명으로 emp10_uk을 사용하시오.
-- deptno 에 foreign key 조건을 걸고 조건명으로 emp10_fk을 사용하시오.
-- @@@@@@@@@@@@@

-- index 확인
drop table if exists emp10;
create table emp10 (
	empno		decimal(4,0) not null 
	, ename 	nvarchar(15) not null
	, sal		decimal(7,2)
	, comm	decimal(7,2) default 100
	, job		nvarchar(4)
	, deptno	int
	, constraint emp10_pk primary key (empno, ename)
	, constraint emp10_uk unique key (empno, deptno)
	, constraint emp10_fk foreign key (deptno) references dept09(deptno)
	);
show index from emp10;



-- @@@@@@@@@@@@@@@@
-- alter를 이용한 제약 조건 추가
-- @@@@@@@@@@@@@@@@
-- emp02.empno에 alter를 이용해서 primary key 추가
-- st1. emp02에 primary key 삭제.
-- st2. empno에 primary key 추가.
alter table emp03 drop primary key;
alter table emp03 modify empno decimal(4,0) not null primary key;

-- emp02.deptno에 alter를 이용해서  foreign key 추가
-- 외래키 설정전에 emp02.deptno와 dept.deptno컬럼 타입을 같게 만들어야 한다.
alter table emp03 modify deptno int;
alter table emp03 add foreign key (deptno) references dept09(deptno);


-- emp02.job에 alter를 이용해서 unique key 추가
alter table emp03 add unique key (job) ;


-- @@@@@@@@@@@@@@@@
-- alter를 이용한 제약 조건 수정
-- @@@@@@@@@@@@@@@@


-- emp02.ename에 default 값을 abc로 바꾸시오.
alter table emp03 modify ename VARCHAR(15) NOT NULL default 'abc' ;

-- emp02.job default 값을 '인턴'로 바꾸시오.
alter table emp03 modify job VARCHAR(15) default '인턴' ;

-- emp02.ename 을 not null 로 바꾸시오.
alter table emp03 modify ename VARCHAR(15) NOT NULL default 'abc' ;

-- emp02.job 을 null 허용으로 바꾸시오.
alter table emp03 modify job VARCHAR(15) null default '인턴' ;

-- @@@@@@@@@@@@@@@@
-- alter를 이용한 제약 조건 삭제
-- @@@@@@@@@@@@@@@@

-- emp10에서 primary key 조건 삭제하기
alter table emp03 drop primary key;

-- emp10에서 조건명으로 foreign key 조건 삭제하기
show index from emp03
alter table emp03 drop key job;

-- emp10에서 조건명으로 unique key 조건 삭제하기
alter table emp03 drop key deptno;


-- ######################  
-- 미션. 외래키를 설정하시오
-- 
-- auth와 book 테이블이 존재한다. 이 두 테이블간에 릴레이션을 설정하려고 한다.
-- auth.authid와 book.authid 에 auth_book_fk 라는 이름의 외래키를 설정하시오.
-- 외래키 설정이 안된다면 왜 안되는 것인가?
-- 어떻게 하면 외래키 설정 문제를 해결 할 수 있을 것인가?
-- ######################
alter table auth add constraint auth_book_fk foreign key (authid) references book(authid);
show index from auth ;


-- join을 이용해서 부모.자식관계 설정에 방해되는 데이터를 찾으시오.
-- left join을 이용하여 차집합 구하기. book - auth 
select * from book left join auth on auth.authid = book.authid ;

select * from book left join auth on auth.authid = book.authid WHERE auth.authid is null ;

-- join을 이용해서 부모.자식관계 설정에 방해되는 데이터를 delete하시오.
start transaction ; 
delete book from book left join auth on book.authid = auth.authid WHERE auth.authid is null;

-- 외래키 설정
alter table auth add constraint auth_book_fk foreign key (authid) references book(authid);
show index from auth ;

rollback;

-- 부모 테이블에 데이터 insert 하기.
start transaction ; 
insert table auth (authid) values(3), (4), (5), (6), (8), (9), (10) ;


-- 외래키 설정

rollback;

-- join을 이용해서 부모.자식관계 설정에 방해되는 데이터를 찾으시오.
-- left join을 이용하여 차집합 구하기. book - auth 
  
  
  
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
--                                                               
-- * specialty 테이블;                           
-- +-----------+--------------+------+-----+---------+-------+   
-- | Field     | Type         | Null | Key | Default | Extra |   
-- +-----------+--------------+------+-----+---------+-------+   
-- | emp_no    | decimal(4,0) | NO   | PRI | 0       |       |   
-- | specialty | varchar(20)  | NO   | PRI |         |       |   
-- +-----------+--------------+------+-----+---------+-------+   
--                                                               
-- * assign 테이블;                              
-- +--------+--------------+------+-----+---------+-------+      
-- | Field  | Type         | Null | Key | Default | Extra |      
-- +--------+--------------+------+-----+---------+-------+      
-- | emp_no | decimal(4,0) | NO   | PRI | 0       |       |      
-- | pro_no | decimal(4,0) | NO   | PRI | 0       |       |      
-- +--------+--------------+------+-----+---------+-------+    

drop table if exists employee;
create table employee (
	emp_no    	decimal(4,0)  not null default 0
	, emp_name  varchar(20)   
	, salary    decimal(6,0)  
	, birthday  date          
	, constraint employee_pk primary key (emp_no)
	);
show index from employee;


drop table if exists project;
create table project (
	pro_no      	 decimal(4,0) not null default 0
	, pro_content 	 varchar(100) 
	, start_date  	 date         
	, finish_date 	 date         
	, constraint project_pk primary key (pro_no)
	);
show index from project ;


drop table if exists specialty;
create table specialty (
	emp_no    	 decimal(4,0) not null default 0
	, specialty  varchar(20)  not null default ''
	, constraint specialty_pk primary key (emp_no, specialty)
	);
show index from specialty ;


drop table if exists assign;
create table assign (
	emp_no 	 decimal(4,0) not null default 0
	, pro_no  decimal(4,0) not null default 0
	, constraint assign_pk primary key (emp_no, pro_no)
	);
show index from assign ;



-- 직원(employee) 테이블 기본 키에 제약조건 조건명 추가하시오. employee_pk_
-- 프로젝트(project) 테이블에 기본 키를 추가하시오 제약조건 이름: project_pk 
-- 담당(assign) 테이블에 기본 키를 추가하기 제약조건 이름: assign_pk
-- 특기(specialty) 테이블에 외래 키를 추가하기 제약조건 이름: specialty_fk 

-- table relation 
-- assign 테이블과 project 테이블 사이에 외래 키를 추가하기.제약조건명: specialty_fk
-- 담당(assign) 테이블과 직원 테이블 사이에 외래키를 추가하기제약조건 이름: specialty_fk
-- +--------------+---------------+-----------------------+
-- | child table  | parent table  |                       |
-- +--------------+---------------+-----------------------+
-- | specialty    | employee      | specialty_employee_fk |
-- | assign       | employee      | assign_employee_fk    |
-- | assign       | project       | assign_project_fk     |
-- +--------------+---------------+-----------------------+

alter table specialty add constraint specialty_employee_fk foreign key (emp_no) references employee (emp_no) ;

alter table assign add constraint assign_employee_fk foreign key (emp_no) references employee (emp_no) ;

alter table assign add constraint assign_project_fk foreign key (pro_no) references project (pro_no);


show index from employee;
show index from project;
show index from specialty;
show index from assign;

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'FOREIGN KEY'
