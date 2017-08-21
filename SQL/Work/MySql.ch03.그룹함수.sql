-- @@@@@@@@@@@@@@
-- 그룹 함수
-- sum : 합계
-- avg : 평균
-- count : 갯수
-- min : 최소값
-- max : 최대값
-- @@@@@@@@@@@@@@

-- 전체 사원수를 출력하시오
SELECT COUNT(*) FROM emp;
SELECT COUNT(ename) FROM emp;

-- 사원 테이블을 부서별로 그룹화 하시오
SELECT COUNT(*), deptno, sal,ename FROM emp GROUP BY deptno;


-- 사원의 급여(sal)를 출력하되 백 단위에서 반올림하기
SELECT ename,sal, ROUND(sal, -1) FROM emp; 
SELECT ename,sal, ROUND(sal, -2) FROM emp; 

-- 모든 사원의 급여총액, 급여평균,  최대급여, 최소급여 구하기
SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal) FROM emp;


-- emp 테이블의 총 갯수는?
SELECT COUNT(*) FROM emp;
SELECT COUNT(*) FROM information_schema.columns WHERE table_name= 'emp';

-- ename 중복 제거후 count
SELECT COUNT(DISTINCT ename) FROM emp;


-- 사원들의 커미션(comm) 총액 구하기
SELECT SUM(comm) FROM emp;

-- 커미션(comm)을 받는 사원의 수를 구하기
SELECT COUNT(comm) FROM emp WHERE comm IS NOT NULL AND comm != 0;
SELECT COUNT(comm) FROM emp WHERE comm > 0;

-- 전체 사원의 수와 커미션(comm)을 받는 사원의 수를 구하기
-- 못한다.


-- @@@@@@@@@@@@@@
-- group by 절
-- 엑셀의 부분 합계 구하기와 유사.
-- 1. 데이터를 그룹핑할 때 사용 
-- 2. 그룹 함수를 사용할 때 사용
-- 3. GROUP BY 절에 명시된 컬럼만 SELECT 절에 사용할 수 있다.
-- 
-- 다차원 집계    //// 오라클 전용
--    ROLLUP     : 소계 구하기        //// 오라클 전용
--    CUBE 	 : 소계와 총계 구하기     //// 오라클 전용
--    COMPUTE	 :                      //// 오라클 전용
--    COMPUTE BY :                      //// 오라클 전용
-- @@@@@@@@@@@@@@

-- deptno 오름차순으로 deptno, sal, ename을 출력하시오.
SELECT deptno, sal, ename FROM emp ORDER BY deptno ASC;


-- -----------------------------------
-- a. 전체 사원중에서 최대급여와 최소급여를 출력하시오
SELECT MAX(sal), MIN(sal)  FROM emp;
-- b. deptno가 10인 부서의 최대, 최소급여 출력하시
SELECT MAX(sal), MIN(sal)  FROM emp WHERE deptno = 10;
-- -----------------------------------


-- -----------------------------------
-- 부서별 최대, 최소 급여 구하기
-- -----------------------------------

-- union 을 사용하면 가능
SELECT DISTINCT deptno FROM emp;
SELECT deptno, MAX(sal), MIN(sal)  FROM emp WHERE deptno = 10 UNION
SELECT deptno, MAX(sal), MIN(sal)  FROM emp WHERE deptno = 20 UNION
SELECT deptno, MAX(sal), MIN(sal)  FROM emp WHERE deptno = 21 UNION
SELECT deptno, MAX(sal), MIN(sal)  FROM emp WHERE deptno = 30 UNION
SELECT deptno, MAX(sal), MIN(sal)  FROM emp WHERE deptno = 31;


-- b. deptn0 = 10 인 사원중에서 급여(sal)의 최대, 최소를 구하시오
SELECT MAX(sal), MIN(sal)  FROM emp WHERE deptno = 10;
-- c. deptn0 = 20 인 사원중에서 급여(sal)의 최대, 최소를 구하시오
SELECT MAX(sal), MIN(sal)  FROM emp WHERE deptno = 20;
-- d. deptn0 = 21 인 사원중에서 급여(sal)의 최대, 최소를 구하시오
SELECT MAX(sal), MIN(sal)  FROM emp WHERE deptno = 21;
-- e. deptn0 = 30 인 사원중에서 급여(sal)의 최대, 최소를 구하시오
SELECT MAX(sal), MIN(sal)  FROM emp WHERE deptno = 30;
-- f. deptn0 = 31 인 사원중에서 급여(sal)의 최대, 최소를 구하시오
SELECT MAX(sal), MIN(sal)  FROM emp WHERE deptno = 31;


-- group by 를 사용하여
SELECT deptno, MAX(sal), MIN(sal)  FROM emp GROUP BY deptno ORDER BY deptno ASC;


-- -----------------------------------
-- 모든 데이터를 출력하되 직책(job)을 기준으로 오름차순으로 정렬 하시오.
-- -----------------------------------
SELECT * FROM emp ORDER BY job ASC;

-- -----------------------------------
-- 중복되지 않게 직책(job)을 출력하시오
-- -----------------------------------
SELECT DISTINCT job FROM emp;

-- -----------------------------------
-- 직책(job)별 사원수를 출력하시오
-- -----------------------------------
SELECT job, COUNT(*) FROM emp GROUP BY job ORDER BY job ASC;

-- -----------------------------------
-- 중복되지 않는 직책(job)별 사원수를 출력하시오
-- -----------------------------------
SELECT DISTINCT job, COUNT(job) FROM emp GROUP BY job ORDER BY job ASC;


-- -----------------------------------
-- 부서별(deptno)로 사원수와 커미션(comm)을 받는 사원수를 
-- 사원번호(deptno) 오름차순으로 출력하시오
-- -----------------------------------
SELECT deptno, COUNT(*), COUNT(comm) FROM emp GROUP BY deptno ORDER BY deptno ASC;

SELECT deptno, COUNT(*), COUNT(IF(comm = 0, null, comm)) AS `COUNT(comm)` FROM emp GROUP BY deptno ORDER BY deptno ASC;



-- ====================
-- rollup : 주어진 데이터들의 소계를 구하는 함수
-- ROLLUP의 인수는 계층 구조이므로 인수 순서가 바뀌면 수행 결과도 바뀌된다
-- http://antkdi.tistory.com/27
-- ====================
-- 값을 
SELECT job, sum(sal) FROM emp GROUP BY job WITH ROLLUP;  --  최종합 출력
SELECT job, sum(sal) FROM emp GROUP BY job, sal WITH ROLLUP;  --  부분합 출력

SELECT deptno, sum(sal) FROM emp GROUP BY deptno WITH ROLLUP;  -- 최종합 출력
SELECT deptno, sum(sal) FROM emp GROUP BY deptno, sal WITH ROLLUP;  -- 부분합과 최종합을 모두 출력

-- ====================
-- cube : 주어진 데이터의 소계와 총계까지 구하는 함수
-- ROLLUP에 비해 다양한 데이터를 얻지만 시스템에 부하를 많이준다.
-- http://antkdi.tistory.com/27
-- ====================
-- mysql 5.5 부터 지원

SELECT deptno, sum(sal) FROM emp GROUP BY deptno WITH ROLLUP;  -- 




-- @@@@@@@@@@@@@@
-- having 절
-- @@@@@@@@@@@@@@


-- -----------------------------------
-- 부서별 부서번호(deptno)와 급여(sal) 평균 구하기
-- -----------------------------------
SELECT deptno, avg(sal) FROM emp GROUP BY deptno;


-- -----------------------------------
-- 부서별 급여 평균이 500이상인 부서 번호와 급여 평균 구하기
-- 1. 부서별로 부서번호와 급여평균 구하기
-- 2. 그룹핑된 데이터에서 급여 평균이 500이상인 데이터만 재검색
-- -----------------------------------
SELECT deptno, avg(sal) FROM emp WHERE avg(sal) >=500 GROUP BY deptno; -- 에러
SELECT deptno, avg(sal) FROM emp GROUP BY deptno HAVING avg(sal) >=500 ; 
-- GROUT BY 가 있을때 WHERE 절을 못쓰니, GROUP BY 뒤에 HAVING 을 사용한다.

-- -----------------------------------
-- 부서번호(deptno)가 10, 20, 30인 부서중에서 
-- 부서별 부서번호와 급여(sal)평균 출력하시오
-- 부서별 급여평균이 400이상인 부서번호와 급여평균 구하기
-- 위의 데이터를 부서번호 오름차순으로 정렬하시오
-- -----------------------------------
SELECT deptno, avg(sal)FROM emp WHERE deptno IN(10,20,30) GROUP BY deptno HAVING avg(sal) >=500 ORDER BY deptno ASC; 


-- 문제 1: 직급별 급여 총액 구하기
-- 사원을 제외하고 
-- 직급(job)별 
-- 급여총액이 1000 이상인 급여(sal) 총액 구하고 출력하시오.
-- 단, 급여총액 순으로 정렬하시오
-- 사원을 제외                --> where
-- 직급(job)별                --> group by
-- 급여 총액이 1000 이상      --> having
-- 급여총액 순으로 정렬하시오 --> order by

SELECT job, SUM(sal) FROM emp WHERE job != '사원' GROUP BY job HAVING SUM(sal) >= 1000 ORDER BY sal DESC;


-- 문제 2:  
-- 가장 최근에 입사한 사원의 입사일과 이름을 구하시오
-- oracle의 rowid나 rownum을 흉내내는 방법
-- 을 이용하는 방법

SELECT ename, hiredate FROM emp ORDER BY hiredate DESC LIMIT 0, 1;


-- 가장 무난한듯
SET @rownum:=0; 
SELECT @rownum:=@rownum+1 , hiredate FROM emp ORDER BY hiredate;
-- 가장 무난한듯

SELECT @rownum:=@rownum+1 , hiredate FROM emp, (SELECT @rownum:=0) TMP ORDER BY hiredate;
SELECT @rownum:=@rownum+1 , hiredate FROM emp, (SELECT @rownum:=5) TMP ORDER BY hiredate;
SELECT @rownum:=@rownum+2 , hiredate FROM emp, (SELECT @rownum:=0) TMP ORDER BY hiredate;


-- 문제 3:
-- 최근에 입사한 직원 10명의 입사일과 이름을 구하시오
-- oracle의 rowid나 rownum을 흉내내는 방법
-- top과 limit을 이용하는 방법
-- -----------------------------------
SELECT ename, hiredate FROM emp ORDER BY hiredate DESC LIMIT 0, 10;
 
 
-- @@@@@@@@@@@@@@
-- 미션
-- @@@@@@@@@@@@@@

-- 미션 1. 급여 최고액, 최저액, 총액 및 평균을 출력하시오
SELECT MAX(sal), MIN(sal), SUM(sal), AVG(sal) FROM emp;

-- 미션 2. 담당 업무(job)별로 급여 최고액, 최저액, 총액 및 평균 급여 출력하시오.
SELECT job, MAX(sal), MIN(sal), SUM(sal), AVG(sal) FROM emp GROUP BY job;

-- 미션 3. 담당 업무(job)별 사원수를 출력하기.
SELECT job, COUNT(*) FROM emp GROUP BY job;

-- 미션 4. 과장의 수를 출력하시오.
SELECT COUNT(*) FROM emp WHERE job = '과장';

-- 미션 5. 직급별 급여 총액을 구하시오.
-- a. 사원을 제외하는 쿼리문 작성
SELECT job FROM emp WHERE job != '사원' GROUP BY job;

-- b. 사원을 제외하고 직급별 급여 총액(sum) 구하기
SELECT job, SUM(sal) FROM emp GROUP BY job HAVING job != '사원';  -- 둘 다 된다.
SELECT job, SUM(sal) FROM emp WHERE job != '사원' GROUP BY job;   -- 둘 다 된다.

-- c. 사원을 제외하고 직급별 급여 총액이 1000 이상인  데이터만 출력.
SELECT job, SUM(sal) FROM emp WHERE job != '사원' GROUP BY job HAVING SUM(sal) >= 1000; 

-- 미션 6. 급여 최고액, 급여 최적액의 차액 출력하시오.
SELECT MAX(sal),MIN(sal), MAX(sal)-MIN(sal) AS `차액` FROM emp ;

-- 미션 7. 직급별 사원의 최저 급여 출력하시오.
SELECT job, MIN(sal) FROM emp GROUP BY job;

-- 미션 8. 부서별로 부서번호, 사원수, 평균 급여 출력하시오.
SELECT deptno, COUNT(deptno), AVG(sal) FROM emp GROUP BY deptno;





 
-- @@@@@@@@@@@@@@
-- 다차원 집계 함수 
-- PIVOT() / UNPIVOT() / GROUPING / GROUP_ID / GROUP SETS / LISTAGG
-- PIVOT ()  : 데이터를 검색할 때 행 집합을 열 집합으로 보여주는 역할을
-- UNPIVOT() : 데이터를 검색할 때 열 집합을 행 집합으로 보여주는 역할을
-- 
-- http://godreem.tistory.com/entry/행을-열로-바꾸기-PIVOT-11g-이상-지원
-- @@@@@@@@@@@@@@
SELECT * FROM emp ;
SELECT * FROM emp PIVOT(ename);

SELECT * FROM emp 
PIVOT(
SUM(ename)
FOR job IN([sal]);


SELECT ename, job FROM emp PIVOT(MAX(x) FOR ename IN ('김사랑', '사원'));
;

ename job sal 
김사랑 사원 300
한예슬 대리 250

-- =============
-- PIVOT ()
-- =============
-- 가상테이블(2014년 모든일자)

 
-- 월별 요일건수 (PIVOT 이용)


-- 직급별 사원수를 출력하시오




-- =============
-- UNPIVOT ()
-- =============




-- @@@@@@@@@@@@@@
-- RANKS 함수 : ROW_NUMBER() / RANK() / DENSE_RANK() / NTILE() / PARTION BY
-- http://egloos.zum.com/entireboy/v/4433510
-- @@@@@@@@@@@@@@


-- =============
-- ROW_NUMBER()
-- =============

-- deptno를 기준으로 내림차순으로 정렬하시오.



-- deptno에 ROW_NUMBER()를 적용하시오



-- =============
-- RANK ()
-- =============

-- ename을 기준으로 오름차순으로 정렬하시오.



-- ename에 rank()를 적용하시오






-- @@@@@@@@@@@@@@
-- SECECT를 이용하여 소계와 총계 구하기
-- @@@@@@@@@@@@@@
-- ORACLE 누적합 ( 집계 함수의 윈도우 옵션 )




