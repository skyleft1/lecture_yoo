
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- CREATE의 기본 사용 구문
-- 테이블 복제 
-- CREATE TABLE new_table LIKE old_table;
-- dept 테이블을 dept01 테이블로 복제하시오.
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- dept01 테이블이 존재하면 삭제.
drop table if exists dept01;
drop table if exists emp01;
-- dept 테이블 복제해서 dept01 테이블을 만드시오. 구조만 복제
create table dept01 like dept;
create table emp01 like emp;

create table dept01 as select * from dept;
create table emp01 as select * from emp;
-- dept01 테이블 데이터 조회
show tables;
-- dept01 테이블의 구조 조회
show columns from dept01;


-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2,....컬럼명n) 
--               VALUES(값1, 값2, ..., 값n)
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


-- dept 테이블에 홍보팀을 추가하시오

select @deptno := max(deptno) +1 from dept01;
insert into dept01 (deptno, dname) values(@deptno, '홍보팀') 

-- emp 테이블에 홍보팀 소속의 사원 송중기를 추가하시오.

select @empno := max(empno) +1 from emp01;
insert into emp01 (empno, ename, deptno) values(@empno, '송중기', (select deptno from dept01 where dname = '홍보팀') )




-- emp 테이블에 영업부 소속의 과장 송혜교를 추가하시오. 
-- 단, 입사일은 2015-01-01 이고 커미션은 100 이다.
select @empno := max(empno) +1 from emp01;
insert into emp01 (empno, ename, deptno, job, hiredate) values(@empno, '송혜교', (select deptno from dept01 where dname = '영업부'), '과장', '2015-01-01' )



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- UPDATE 의 기본 사용 방법
-- 
-- UPDATE 테이블명 
--    SET 컬럼명1 = 값1, 컬럼명2=값2, ... 컬럼명n=값n
--  WHERE 조건식
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept 테이블에서 홍보팀의 loc를 일산으로 옮기시오
update dept01 set loc = '일산' where dname = '홍보팀' ;

-- emp 테이블에서 사원 송중기의 직책을 대리로, 
-- 연봉을 1000으로, 부서를 영업부로 바꾸시오
update emp01 set job = '대리', sal = 1000, deptno = (select deptno from dept01 where dname = '영업부') where ename = '송중기';


-- emp 테이블에서  송혜교의 연봉을 700으로, 커미션 null로 바꾸시오.
update emp01 set sal = 700, comm = null where ename = '송혜교';


-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- DELETE 의 기본 사용 방법
-- 
-- DELETE FROM 테이블명
--  WHERE 조건식
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept에서 홍보팀을 삭제하시오.
delete from dept01 where dname = '홍보팀';

-- emp에서 송중기와 송혜교를 삭제하시오.
delete from emp01 where ename = '송중기' and  ename = '송혜교'  ;





-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- insert와 update 를 한 번에.
-- DB에 해당되는 레코드가 있다면 update하고, 없는 경우 INSERT하는 Query
-- 
-- ORACLE의 MERGE INTO와 같은 기능
-- 
-- INSERT INTO 테이블명(컬럼1, 컬럼2)
-- VALUES('값1', '값2')
-- ON DUPLICATE KEY UPDATE 컬럼2='값3', 컬럼3='값4';
-- 
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

 



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 미션.
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- 미션 1. 테이블을 생성하고 생성된 테이블에 insert로 데이터를 추가하라.                      
-- +--------+-------------+------+-----+---------+-------+                       
-- | Field  | Type        | Null | Key | Default | Extra |                       
-- +--------+-------------+------+-----+---------+-------+                       
-- | eno    | int(11)     | NO   |     | NULL    |       |                       
-- | ename  | varchar(20) | YES  |     | NULL    |       |                       
-- | job    | varchar(20) | YES  |     | NULL    |       |                       
-- | salary | int(11)     | YES  |     | NULL    |       |                       
-- +--------+-------------+------+-----+---------+-------+ 
--                                        
-- +------+--------+--------+--------+                                           
-- | eno  | ename  | job    | salary |                                           
-- +------+--------+--------+--------+                                           
-- | 1000 | APPLE  | POLICE |    100 |                                           
-- | 1010 | BANANA | NURSE  |    150 |                                           
-- | 1020 | ORANGE | DOCTOR |    250 |                                           
-- | 1030 | VERY   | NULL   |    250 |                                           
-- | 1040 | CAT    |        |    200 |                                           
-- +------+--------+--------+--------+ 

create table empnew (
		 eno		int			not null
		, ename	varchar(20)
		, job		varchar(20)
		, salary	int
		);
		
insert into empnew values
	( 1000, 'APPLE'  , 'POLICE' ,    100)
	,(1010, 'BANANA' , 'NURSE'  ,    150)
	,(1020, 'ORANGE' , 'DOCTOR' ,    250)                                          
	,(1030, 'VERY'   , NULL   ,    250)                                          
	,(1040, 'CAT'    , null  ,    200)
;


-- 미션 2. 사용하여 직급(job)에 따라 급여(sal)을 아래와 같이 수정하시오.
-- 단, case~when~then을 사용하시오.
-- '부장'인 사원은 5% 인상 
-- '과장'인 사원은 10% 인상
-- '대리'인 사원은 15% 인상 
-- '사원'인 사원은 20% 인상
select sal from emp01;
start transaction;
update emp01 set sal = case when job = '부장' then sal*1.05
									when job = '과장' then sal*1.1
									when job = '대리' then sal*1.15 
									when job = '사원' then sal*1.2
									else sal
								end;
rollback;
select sal from emp01;

-- 미션 3. 급여(sal)가 500이상인 직원만 급여를 10% 인상하도록 수정하시오.
start transaction;
update emp01 set sal = sal*1.1 where sal >= 500;
rollback;

-- 미션 4. 2005년에 입사한 모든 직원의 입사일을 오늘 날짜로 수정하시오.



-- 2005년에 입사한 사람 찾기



-- 미션 5. 31번 부서의 부서의 위치(loc)를 40번 부서의 위치(loc)로 바꾸시오.
-- 단, 값 대신에 sql 쿼리를 사용하시오.
start transaction ; 
update dept set loc = (select loc from dept where deptno = 40) where deptno = 31;


rollback;
-- 미션 6. emp 테이블에서 급여가 500미만인 사원들의 급여를 50%씩 인상(업데이트)하시오.
start transaction ; 
update emp set sal = sal*1.5 where sal < 500;

select sal from emp;
rollback;


-- 미션 7. emp 테이블에 아이린 과 강민경, 이해리 를 추가하시오.
start transaction ; 
update emp set sal = sal*1.5 where sal < 500;

select sal from emp;
rollback;


-- 미션 8. emp 테이블에서 직급(job)이 정해지지 않은 직원을 삭제하시오.
start transaction ; 
select * from emp;
delete from emp where job is null;

select * from emp;
rollback;



-- 미션 9. emp 테이블에서 경리부에 소속된 사원들만 삭제하시오.
start transaction ; 
select * from emp;
delete from emp where deptno = (select deptno from dept where dname = '경리부')

select * from emp;
rollback;








-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 트랜잭션(transaction)
-- 
-- 데이터 처리의 논리적 작업 단위 
--		여러 개의 SQL 명령문(CUD)들의 묶음으로 처리.
-- 
-- 데이터의 일관성 보장. all or nothing.
--		여러 개의 SQL문이 집합이 정상적으로 처리되면 정상 종료
--		여러 개의 SQL문이 중에서 하나의 SQL문이라도 잘못되면 전체 취소
-- start transaction :
-- COMMIT    : 변경 사항 영구 저장. ctrl+s
-- ROLLBACK  : 변경 사항 취소. ctrl+z
-- SAVEPOINT : rollback의 위치 지정. breakpoint와 유사
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2


-- @@@@@
-- 트랜잭션 시작
-- 
-- 작업 1. 이병헌 삭제하시오.
--      savepoint tran1 설정
--      delete


-- 작업 2. 대리를 과장으로 바꾸시오.
--      savepoint tran2 설정
--      update
-- 
-- 작업 3.  추신수를 이사로 바꾸시오.
--      savepoint tran3 설정
--      update
-- 
-- 작업 4. 부분 되돌리기. 추신수의 변경사항을 취소하시오
-- 
-- 작업 5. 트랜잭션 완료. commit 
-- 
-- 작업 6. 전체 되돌리기. rollback
-- @@@@@

-- 트랜잭션 시작

-- 작업 1. 이병헌 삭제하시오.

-- 작업 2. 대리를 과장으로 바꾸시오.

-- 작업 3. 추신수를 이사로 바꾸시오.

-- 부분 되돌리기. 추신수의 변경사항을 취소하시오

-- 트랜잭션 완료. transaction 종료

-- 전체 되돌리기. transaction 종료



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 삽입하기.
-- a. INSERT INTO ~ VALUES        를 이용한 INSERT 방법 : 기본 데이터 삽입 방법
-- b. INSERT INTO ~ SELECT ~ FROM 를 이용한 INSERT 방법 : 테이블이 있을때만 가능. 데이터 복제
-- c. INSERT INTO ~ SELECT ~ FROM 를 이용한 INSERT 방법 : 테이블이 있을때만 가능. 데이터 복사
-- d. CREATE TABLE 테이블명 ~ FROM 를 이용한 INSERT 방법 : 테이블이 없을때만 가능. 테이블 복제
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- a. INSERT INTO ~ VALUES
--    emp 테이블에 경리부 소속의 사원 송중기를 추가하시오.


-- b. INSERT INTO ~ SELCET ~ FROM 를 이용한 INSERT 방법 
--    서브쿼리를 이용해서 emp 테이블에 사원 송중기를 추가


-- c. 테이블이 없는 경우에 테이블과 데이터를 복제 하는 방법
--    CREATE TABLE 새로만들테이블명 AS SELECT * FROM 복사할테이블명;


-- d. 테이블은 이미 생성되어 있고 데이터만 복사
--    INSERT INTO 복사할테이블명 SELECT * FROM 복사할테이블명 [WHERE 절]
--    new_emp 의 모든 데이터 삭제


-- e. 테이블이 없을때 테이블 구조만 복사하기 : 
-- CREATE TABLE new_table LIKE old_table;


-- f. emp01 테이블 제거하기



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 수정하기.
-- a. UPDATE ~ SET ~ WHERE 를 이용한 UPDATE 방법 : 기본 데이터 수정 방법
-- b. 서브쿼리를              이용한 UPDATE 방법 : 
-- c. 조인을                  이용한 UPDATE 방법 : UPDATE ~ SET ~ FROM ~ WHERE
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- a. UPDATE ~ SET ~ WHERE 를 이용한 UPDATE 방법 : 기본 데이터 수정 방법
-- HR팀에서 근무하는 모든 직원을 인사부로 변경하고 월급을 300 으로 변경하시오


-- b. 서브쿼리를 이용한 UPDATE 방법 :
-- HR팀에서 근무하는 사원을 인사부로 변경하고 월급을 300 으로 변경하시오


-- c. 조인을  이용한 UPDATE 방법 : 
-- UPDATE [테이블명1] A INNER JOIN [테이블명2] B
-- ON A.[조인할 컬럼명] = B.[조인할 컬럼명]
-- SET [변경할 컬럼명] = 변경할값
-- ( WHERE 절 )
-- HR팀에서 근무하는 사원을 인사부로 변경하고 월급을 300 으로 변경하시오
select * from dept01;
select * from emp01;
start transaction;

update emp01 join dept01 on emp01.deptno= dept01.DEPTNO set emp01.deptno = (select deptno from dept01 where DNAME = '인사부'), sal = 300 where DNAME = 'HR팀'

rollback;


-- 미션. 
-- '인사부'의 부서 위치(loc)를 '전산부'가 있는 지역(loc)으로 옮겨라.








-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 삭제하기.
-- a. DELETE FROM 테이블명 WHERE 를 이용하는 방법 : 기본 데이터 삭제 방법
-- b. 서브쿼리를 이용한 DELETE 를 하는 방법 :
-- c. 조인을 이용한 DELETE     를 하는 방법 : 
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 


-- a. DELETE FROM ~ WHERE 를 이용하는 방법 : 기본 데이터 삭제 방법
-- 경리부에서 근무하는 모든 사원을 emp에서 삭제하시오.
start transaction; 
delete from emp where deptno = (select deptno from dept where dname = '경리부');

select * from emp;
rollback;

-- b. 서브쿼리를 이용한 DELETE 방법 :
-- 경리부에서 근무하는 모든 사원을 emp에서 삭제하시오.
start transaction; 
delete from emp where deptno = (select deptno from dept where dname = '경리부');

select * from emp;
rollback;


-- c. 조인을 이용한 DELETE 방법 :
-- 경리부에서 근무하는 모든 사원을 emp에서 삭제하시오.
start transaction; 
delete emp from emp join dept on emp.deptno = dept.DEPTNO where dept.DNAME = '경리부';

select * from emp;
rollback;
