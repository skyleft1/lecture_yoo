
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- CREATE의 기본 사용 구문
-- 테이블 복제 
-- CREATE TABLE new_table LIKE old_table;
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- dept01 테이블이 존재하면 삭제.
DROP TABLE IF EXISTS dept01       ; -- dept01 테이블 삭제

-- dept 테이블 복제해서 dept01 테이블을 만드시오. 구조만 복제
create table dept01 like dept;

-- dept01 테이블 데이터 조회
select * from dept01;

-- dept01 테이블의 구조 조회
show databases;
show tables;
show columns from dept01;



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2,....컬럼명n) 
--               VALUES(값1, 값2, ..., 값n)
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

drop table if exists emp1;
drop table if exists dept1;
create table emp1 as select * from emp;
create table dept1 as select * from dept;

-- dept 테이블에 홍보팀을 추가하시오
insert into dept( deptno, dname, loc)  
          values( 50, '홍보팀', '서울');


-- emp 테이블에 홍보팀 소속의 사원 송중기를 추가하시오.
insert into    emp1(empno, deptno, job   , ename   )
            values( 1019,  50   , '사원', '송중기') ;


-- emp 테이블에 영업부 소속의 과장 송혜교를 추가하시오. 
-- 단, 입사일은 2015-01-01 이고 커미션은 100 이다.
select @deptno := deptno       from dept  where dname ='영업부';
select @empno  := max(empno)+1 from emp;

insert into emp(  empno,  deptno , job   , ename   , hiredate    , comm)
         values( @empno, @deptno , '과장', '송해', '2015-01-01', 100 );



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- UPDATE 의 기본 사용 방법
-- 
-- UPDATE 테이블명 
--    SET 컬럼명1 = 값1, 컬럼명2=값2, ... 컬럼명n=값n
--  WHERE 조건식
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept 테이블에서 홍보팀의 loc를 일산으로 옮기시오
update dept set loc = '일산' where dname = '홍보팀' ;
 
select * from dept where dname = '홍보팀' ;

-- emp 테이블에서 사원 송중기의 직책을 대리로, 
-- 연봉을 1000으로, 부서를 영업부로 바꾸시오

update emp1 set job = '대리', sal = 1000, deptno = (select deptno from dept1 where dname = '영업부') where ename = '송중기'

-- emp 테이블에서  송혜교의 연봉을 700으로, 커미션 null로 바꾸시오.



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- DELETE 의 기본 사용 방법
-- 
-- DELETE FROM 테이블명
--  WHERE 조건식
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept에서 홍보팀을 삭제하시오.
delete from dept where dname = '홍보팀';


-- emp에서 송중기와 송혜교를 삭제하시오.
delete from emp where ename = '송중기' or ename ='송혜교';
delete from emp where ename in( '송중기' , '송혜교');
delete from emp where ename = '송중기';
delete from emp where ename = '송혜교';






-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 MERGE하기.
-- a. MERGE 기본 문법
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


DROP TABLE IF EXISTS employee       ; 

create table employee(    
   eno int             ,
   ename nvarchar(20)  ,
   job nvarchar(20)    ,
   salary int
);

insert into employee values(1000, 'APPLE' , 'POLICE', 100 ) ;
insert into employee values(1010, 'BANANA', 'NURSE' , 150 ) ;
insert into employee values(1020, 'ORANGE', 'DOCTOR', 250 ) ;
insert into employee values(1030, 'VERY'  , NULL    , 250 ) ;
insert into employee values(1040, 'CAT'   , ''      , 200 ) ;




-- 미션 2. 사용하여 직급(job)에 따라 급여(sal)을 아래와 같이 수정하시오.
-- 단, case~when~then을 사용하시오.
-- '부장'인 사원은 5% 인상 
-- '과장'인 사원은 10% 인상
-- '대리'인 사원은 15% 인상 
-- '사원'인 사원은 20% 인상

-- 미션 3. 급여(sal)가 500이상인 직원만 급여를 10% 인상하도록 수정하시오.
update emp1 set sal = sal*1.1 where sal > 500;

-- 미션 4. 2005년에 입사한 모든 직원의 입사일을 오늘 날짜로 수정하시오.
select * from emp1;
update emp1 set hiredate = curdate() where hiredate >= '2005-01-01' and hiredate < '2006-01-01' ;
select * from emp1;


-- 미션 5. 50번 부서의 부서의 위치(loc)를 40번 부서의 위치(loc)로 바꾸시오.
-- 단, 값 대신에 sql 쿼리를 사용하시오.
select @loc := loc from dept where deptno = 40; 
update dept set loc = @loc  where deptno = 50 ;


-- 미션 6. emp 테이블에서 급여가 500미만인 사원들의 급여를 50%씩 인상(업데이트)하시오.
select * from emp1;
update emp1 set sal = sal*1.5 where sal < 500;
select * from emp1;


-- 미션 7. emp 테이블에 아이린 과 강민경, 이해리 를 추가하시오.
select @empno := max(empno) + 1 from emp1;
insert into emp1 (empno, ename) values (@empno, '강민경'), ;


-- 미션 8. emp 테이블에서 직급(job)이 정해지지 않은 직원을 삭제하시오.
delete from emp1 where job is null;


-- 미션 9. emp 테이블에서 경리부에 소속된 사원들만 삭제하시오.
delete from emp1 where deptno = (select deptno from dept1 where dname = '경리부');










