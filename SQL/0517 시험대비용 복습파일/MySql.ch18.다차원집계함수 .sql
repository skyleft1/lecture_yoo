-- @@@@@@@@@@@@@@
-- 다차원 집계  
--    ROLLUP     : 소계 구하기
--    CUBE 	     : 소계와 총계 구하기
--    COMPUTE	 : 
--    COMPUTE BY : 
-- @@@@@@@@@@@@@@

-- ====================
-- rollup : 주어진 데이터들의 소계를 구하는 함수
-- ROLLUP의 인수는 계층 구조이므로 인수 순서가 바뀌면 수행 결과도 바뀌된다
-- http://antkdi.tistory.com/27
-- MySQL 5.5 부터 지원
-- ====================


-- ====================
-- cube : 주어진 데이터의 소계와 총계까지 구하는 함수
-- ROLLUP에 비해 다양한 데이터를 얻지만 시스템에 부하를 많이준다.
-- http://antkdi.tistory.com/27
-- MySQL 5.6 에서 지원 하지 않음.
-- ====================
SELECT b.dname, a.job, SUM(a.sal) sal, COUNT(a.empno) emp_count, 
       GROUPING(b.dname) "D", GROUPING(a.job) "S"
FROM emp a, dept b
WHERE a.deptno = b.deptno
GROUP BY b.dname, a.job with CUBE





 
-- @@@@@@@@@@@@@@
-- 다차원 집계 함수 
-- PIVOT() / UNPIVOT() / GROUPING / GROUP_ID / GROUP SETS / LISTAGG
-- PIVOT ()  : 데이터를 검색할 때 행 집합을 열 집합으로 보여주는 역할을
-- UNPIVOT() : 데이터를 검색할 때 열 집합을 행 집합으로 보여주는 역할을
-- oracle 
-- http://godreem.tistory.com/entry/행을-열로-바꾸기-PIVOT-11g-이상-지원
-- 
-- MySql
-- http://stackoverflow.com/questions/12382771/mysql-pivot-crosstab-query
-- https://en.wikibooks.org/wiki/MySQL/Pivot_table
-- http://mysql.rjweb.org/doc.php/pivot
-- @@@@@@@@@@@@@@


-- =============
-- PIVOT ()
-- =============






-- 가상테이블(2014년 모든일자)

 
-- 월별 요일건수 (PIVOT 이용)


-- 직급별 직원수를 출력하시오




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






-- @@@@@@@@@@@@@@
-- 미션
-- @@@@@@@@@@@@@@


