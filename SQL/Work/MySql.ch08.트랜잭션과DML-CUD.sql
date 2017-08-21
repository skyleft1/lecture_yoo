--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 트랜잭션(transaction)
--
-- 데이터 처리의 논리적 작업 단위 
--		여러 개의 SQL 명령문들의 묶음으로 처리.
--
-- 데이터의 일관성 보장. all or nothing.
--		여러 개의 SQL문이 집합이 정상적으로 처리되면 정상 종료
--		여러 개의 SQL문이 중에서 하나의 SQL문이라도 잘못되면 전체 취소
-- COMMIT    : 변경 사항 영구 저장. ctrl+s
-- ROLLBACK  : 변경 사항 취소. ctrl+z
-- SAVEPOINT : rollback의 위치 지정. breakpoint와 유사
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2


select * from emp;

-- 트랜잭션 시작

-- 작업 1
SAVEPOINT A;
delete from emp where ename ='이병헌';
-- select * from emp where ename ='이병헌';

-- 작업 2
SAVEPOINT B;
update emp set job ='과장' where job ='대리';
-- select * from emp where job in ( '과장', '대리' );


-- 작업 3
SAVEPOINT C;
update emp set job='이사' where empno = 1006;
-- select * from emp where empno = 1006;

-- 작업 되돌리기
rollback;


-- 작업 되돌리기
rollback to C;

-- 트랜잭션 완료
commit;


  
  
  


--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- CREATE의 기본 사용 구문
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2,....컬럼명n) 
--               VALUES(값1, 값2, ..., 값n)
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept 테이블 복제해서 dept01 테이블을 만드시오
-- dept01 테이블이 존재할경우 삭제하고,
DROP TABLE IF EXISTS dept01;
-- 만든다.
CREATE table dept01 like dept;

-- dept01 테이블 구조 조회
SHOW COLUMNS FROM dept01;

-- dept 테이블에 홍보팀을 추가하시오
INSERT INTO dept VALUES(50, '홍보팀', '서울');
INSERT INTO dept (deptno, dname, loc) VALUES(50, '홍보팀', '서울');

-- emp 테이블에 홍보팀 소속의 사원 송중기를 추가하시오.
INSERT INTO emp(empno, deptno, ename, job) VALUES(1019, 50, '송중기', '사원');

-- emp 테이블에 영업부 소속의 과장 송혜교를 추가하시오. 
-- 입사일은 2015-01-01 이고 커미션은 100 이다.
SELECT @deptno := deptno FROM dept WHERE dname = '영업부';
SELECT @empno := MAX(empno)+1 FROM emp;
SELECT MAX(empno) FROM emp ;
INSERT INTO emp(empno, deptno, ename, job, hiredate, comm) VALUES(1020, 30, '송혜교', '과장', '2015-01-01', 100);
INSERT INTO emp(empno, deptno, ename, job, hiredate, comm) VALUES((SELECT (MAX(empno)+1) FROM emp), (SELECT deptno FROM dept WHERE dname = '영업부'), '송혜교', '과장', '2015-01-01', 100);


--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- UPDATE 의 기본 사용 방법
--
-- UPDATE 테이블명 
--    SET 컬럼명1 = 값1, 컬럼명2=값2, ... 컬럼명n=값n
--  WHERE 조건식
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept 테이블에서 홍보팀의 loc를 서울로 옮기시오
UPDATE dept SET LOC = '일산' WHERE dname = '홍보팀' ;

-- emp 테이블에서 사원 송중기의 직책을 대리로, 연봉을 1000으로, 부서를 영업부로 바꾸시오
UPDATE emp SET job = '대리', sal = 1000, deptno = (SELECT deptno FROM dept WHERE dname = '영업부') WHERE ename = '송중기';

-- emp 테이블에서  송혜교의 연봉을 700으로, 커미션 null로 바꾸시오.
UPDATE emp SET sal = 700, comm = null WHERE ename = '송혜교';



--  Q 직급에 따라 급여를 아래와 같이 수정하라 
-- 부장 5% 인상
-- 과장 10%
-- 대리 15%
-- 사원 20%

UPDATE emp SET sal = CASE WHEN job = '부장' THEN sal*1.05 
									WHEN job = '과장' THEN sal*1.1 
									WHEN job = '대리' THEN sal*1.15 
									WHEN job = '사원' THEN sal*1.2 
				else sal
				end 


-- Q 급여가 500 이상인 직원만 급여를10% 인상하도록 수정
UPDATE emp SET sal = sal*1.1 WHERE sal > 500 ;
 
 
-- Q 2005년에 입사한 모든 직원의 입사일을 오늘 날짜로 수정하라
UPDATE emp2 SET hiredate = curdate() WHERE hiredate > '2005-01-01' AND hiredate < '2006-01-01' ;


-- Q 50번 부서의 부서위치를 40번 부서의 위치로 바꿔라(sql 쿼리 써라)
SELECT @loc := loc FROM dept WHERE deptno = 40 ;
UPDATE dept SET loc = @loc WHERE deptno = 50 ;



-- q emp 테이블에서 급여가 500 미만은 사원들의 급여를 50%씩 인상하시오
UPDATE emp SET sal = sal*1.5 WHERE sal < 500 ;

-- Q emp 테이블에 아이린과 강민경를 추가하시오.
INSERT INTO emp(empno, ename) VALUES(1019, '아이린');

-- Q emp 테이블에서 직급이 정해지지 않은 직원을 삭제하시오
DELETE FROM emp WHERE job = null;

-- Q emp 테이블에서 경리부에 소속된 사원들만 삭제하시오
DELETE FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dname = '경리부');


-- Q 테이블 , 데이터 추가 문제
CREATE TABLE test1 (
		eno int  NOT  NULL ,
		ename  varchar(20)  ,
		job  varchar(20)   ,
		salary  int   
		);

CREATE TABLE test1 (
		eno int					,
		ename  varchar(20)	,
		job  varchar(20)		,
		salary  int   			
		);

INSERT INTO test1 VALUES(1000 , 'APPLE' , 'POLICE' , 100 );
INSERT INTO test1 VALUES(1010 , 'BANANA' , 'NURSE' , 150 );
INSERT INTO test1 VALUES(1020 , 'ORANGE' , 'DOCTOR' , 250 );
INSERT INTO test1 VALUES(1030 , 'VERY' ,null, 250 );
INSERT INTO test1 VALUES(1040 , 'CAT' ,null, 200 );
		




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- DELETE 의 기본 사용 방법
--
-- DELETE FROM 테이블명
--  WHERE 조건식
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- dept에서 홍보팀를 삭제하시오.
DELETE FROM dept01 WHERE dname = '홍보팀';


-- emp에서 송중기와 송혜교를 삭제하시오.
DELETE FROM emp WHERE ename = '송중기';
DELETE FROM emp WHERE ename = '송혜교';
DELETE FROM emp WHERE ename = '송중기' and ename = '송혜교';


--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 삽입하기.
-- a. INSERT INTO ~ VALUES        를 이용한 INSERT 방법 : 기본 데이터 삽입 방법
-- b. INSERT INTO ~ SELECT ~ FROM 를 이용한 INSERT 방법 : 테이블이 있을때만 가능. 데이터 복제
-- c. INSERT INTO ~ SELECT ~ FROM 를 이용한 INSERT 방법 : 테이블이 있을때만 가능. 데이터 복사
-- d. CREATE TABLE 테이블명 ~ FROM        를 이용한 INSERT 방법 : 테이블이 없을때만 가능. 테이블 복제
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- a. INSERT INTO ~ VALUES
--    emp 테이블에 경리부 소속의 사원 송중기를 추가하시오.
INSERT INTO emp (empno, ename, deptno) VALUES (1019, '송중기', (SELECT deptno FROM dept WHERE dname = '경리부'));

-- b. INSERT INTO ~ SELCET ~ FROM 를 이용한 INSERT 방법 
--    서브쿼리를 이용해서 emp 테이블에 사원 송중기를 추가
INSERT INTO emp2 SELECT * FROM emp WHERE ename = '송중기';


-- c. 테이블이 없는 경우에 테이블과 데이터를 복제 하는 방법
--    CREATE TABLE 새로만들테이블명 AS SELECT * FROM 복사할테이블명;
--    new_emp 테이블 제거하기
CREATE TABLE emp3 AS SELECT * FROM emp ;


-- d. 테이블은 이미 생성되어 있고 데이터만 복사
--    INSERT INTO 복사할테이블명 SELECT * FROM 복사할테이블명 [WHERE 절]
--    new_emp 의 모든 데이터 삭제
INSERT INTO emp2 SELECT * FROM emp;

-- e. 테이블이 없을때만 테이블 구조만 복사하기 : 
-- CREATE TABLE 새로만들테이블명 AS 
-- SELECT * FROM 복사할테이블명 
-- WHERE 1 = 0   -- [where에다가 참이 아닌 조건을 넣어줌]
INSERT INTO emp4 AS SELECT * FROM emp WHERE 1 = 0;

-- new_emp2 테이블 제거하기




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 수정하기.
-- a. UPDATE ~ SET ~ WHERE 를 이용한 UPDATE 방법 : 기본 데이터 수정 방법
-- b. 서브쿼리를              이용한 UPDATE 방법 : 
-- c. 조인을                  이용한 UPDATE 방법 : UPDATE ~ SET ~ FROM ~ WHERE
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- UPDATE 문으로 모든 행의 내용 변경하기 

-- UPDATE 문으로 테이블의 특정 행만 변경하기

-- 한개 테이블에서 여러 개 칼럼의 값을 변경하기 


-- a. UPDATE ~ SET ~ WHERE 를 이용한 UPDATE 방법 : 기본 데이터 수정 방법
-- HR팀에서 근무하는 모든 직원을 인사부로 변경하고 월급을 300 으로 변경하시오

-- SELECT deptno, dname FROM dept WHERE dname='인사부' or dname='HR팀'  ; -- 21
   



-- b. 서브쿼리를              이용한 UPDATE 방법 :
-- HR팀에서 근무하는 사원을 인사부로 변경하고 월급을 300 으로 변경하시오

-- SELECT deptno, dname FROM dept WHERE dname='인사부' or dname='HR팀'  ; -- 21




-- c. 조인을  이용한 UPDATE 방법 : UPDATE /*+ BYPASS_UJVC  */ (  )  SET
-- HR팀에서 근무하는 사원을 인사부로 변경하고 월급을 300 으로 변경하시오

-- SELECT deptno, dname FROM dept WHERE dname='인사부' or dname='HR팀'  ; -- 21



-- 미션. 
-- '인사부'의 부서 위치(loc)를 '전산부'가 있는 지역(loc)으로 옮겨라.





--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 삭제하기.
-- a. DELETE FROM 테이블명 WHERE 를 이용하는 방법 : 기본 데이터 삭제 방법
-- b. 서브쿼리를 이용한 DELETE 를 하는 방법 :
-- c. 조인을 이용한 DELETE     를 하는 방법 : 
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 

-- DELETE 문으로 모든 행의 내용 삭제하기

-- DELETE 문으로 테이블의 특정 행만 삭제하기



-- a. DELETE FROM ~ WHERE 를 이용하는 방법 : 기본 데이터 삭제 방법
-- 경리부에서 근무하는 모든 사원을 emp에서 삭제하시오.



-- b. 서브쿼리를 이용한 DELETE 방법 :
-- 경리부에서 근무하는 모든 사원을 emp에서 삭제하시오.



-- c. 조인을 이용한 DELETE 방법 :
-- 경리부에서 근무하는 모든 사원을 emp에서 삭제하시오.




--@@@@@@@@@@
-- 미션 08
--@@@@@@@@@@

-- 미션 8-1. emp 테이블에서 사원의 급여가 500미만인 사원들의 
--           급여를 50%씩 인상(업데이트)하시오.



-- 미션 8-2. emp 테이블에서 직급에 따라 '부장'은 사원은 5%, 
--                            '과장'은 사원은 10%, 
--                            '대리'은 사원은 15%, 
--                            '사원'은 사원은 20% 
-- 급여를 인상(업데이트)하시오






--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 MERGE하기.
-- a. MERGE 기본 문법
-- b. 조인을 이용한 MERGE
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2





