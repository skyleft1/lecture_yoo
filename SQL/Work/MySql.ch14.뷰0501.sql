
-- @@@@@@@@@@@@@@
-- 뷰
-- 
-- 뷰란 가상테이블이다.
-- 
-- 왜 뷰(View)를 사용하는가?
--      보안과 편리한 접근을 위해서 
-- 
-- 뷰(Views) 생성과 제거
--      CREATE VIEW  뷰이름  AS  SELECT
--      DROP VIEW 뷰이름
-- @@@@@@@@@@@@@@



           
-- 30번 부서에 소속된 사원을 조회하는 뷰, vw_emplist_from_deptno를 정의하시오.
CREATE VIEW vw_emplist_from_deptno AS 
SELECT * FROM emp WHERE deptno = 30;

SELECT * FROM vw_emplist_from_deptno;


-- 직원 이름과 부서명이 나오는 뷰, vw_emplist를 생성하시오.
CREATE VIEW vw_emplist AS 
SELECT emp.ENAME, dept.DNAME FROM emp join dept on emp.deptno = dept.deptno 

SELECT * FROM vw_emplist;

-- @@@@@@@@@@
-- 미션 14.
-- @@@@@@@@@@
-- 1. 경리부서에 근무하는 사원의 이름과 입사일을 출력하는 뷰를 생성하시오. 3개. 
DROP VIEW IF EXISTS vw_ename_hiredate;
CREATE VIEW vw_ename_hiredate AS 
SELECT distinct emp.ENAME, emp.hiredate FROM emp join dept on emp.deptno = dept.deptno WHERE dname = '경리부';

SELECT * FROM vw_ename_hiredate;


-- 2. 인천에서 근무하는 사원의 이름, 입사일, 급여 그리고 부서명을 출력하는 뷰를 생성하시오. 3개. 조인
CREATE VIEW vw_ena_hir_sal_dna AS 
SELECT emp.ENAME, emp.hiredate, emp.SAL, dept.dname FROM emp join dept on emp.deptno = dept.deptno WHERE dept.loc = '인천'

SELECT * FROM vw_ena_hir_sal_dna ;


-- 3. 인천에서 근무하는 직원의 수를 출력하는 뷰를 생성하시오. 6개
CREATE VIEW vw_count AS 
SELECT COUNT(*) FROM emp join dept on emp.deptno = dept.deptno WHERE dept.loc = '인천'

SELECT * FROM vw_count ;


-- 4. 직급(emp.job)이 과장인 직원의 이름(emp.ename), 부서명(dept.dname)을 출력하는 뷰를 생성하시오. 3개
CREATE VIEW vw_ena_dna AS 
SELECT emp.ENAME, dept.dname FROM emp join dept on emp.deptno = dept.deptno WHERE emp.job = '과장'

SELECT * FROM vw_ena_dna ;


-- 5. 직속 상관이 "감우성"인 직원들의 이름(ename),직급(job)를 출력하는 뷰를 생성하시오. 6개
CREATE VIEW vw_ena_job AS 
SELECT emp.ENAME, emp.job FROM emp join dept on emp.deptno = dept.deptno WHERE emp.mgr = (SELECT mgr FROM emp WHERE ename = '감우성');

SELECT * FROM vw_ena_job ;


-- 6. "감우성"과 같은 근무지에서 일하는 직급이 '사원'인 직원만 출력하는 뷰를 생성하시오.4개				    
CREATE VIEW vw_ex6 AS 
SELECT ename FROM emp join dept on emp.deptno = dept.deptno WHERE job = '사원' AND dept.loc = (SELECT loc FROM dept WHERE deptno = (SELECT deptno FROM emp WHERE ename = '감우성'));

SELECT * FROM vw_ex6 ;


-- 7. '이문세'와 동일한 직급을 가진 사원을 출력하는 뷰를 생성하시오. 4개
CREATE VIEW vw_ex7 AS 
SELECT * FROM emp WHERE job = (SELECT job FROM emp WHERE ename = '이문세');

SELECT * FROM vw_ex7 ;


-- 8. 부서별로 가장 급여를 많이 받는 사원의 
--    사원번호, 사원이름, 급여, 부서번호, 부서명를 출력하는 뷰를 생성하시오. 8개
CREATE VIEW vw_ex8 AS 
SELECT emp.ENAME, emp.sal, emp.deptno, dept.dname FROM emp join dept on emp.deptno = dept.deptno WHERE  (emp.deptno, emp.sal) IN (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);

SELECT * FROM vw_ex8 ;


-- 9. 직급(job) 과장이 속해 있는 부서의 부서번호와 부서명, 위치 
--    그리고 그 부서에 속한 사원들의 정보를 출력하는 뷰를 생성하시오. 9개
CREATE VIEW vw_ex9 AS 
SELECT emp.deptno, dept.dname, dept.loc, emp.* FROM emp join dept on emp.deptno = dept.deptno WHERE (emp.deptno) IN (SELECT deptno FROM emp WHERE job= '과장' GROUP BY deptno );

SELECT * FROM vw_ex9 ;


-- 10. 과장보다 많은 급여를 받는 직원들의 이름, 부서명, 직급, 급여를 출력하는 뷰를 생성하시오.
--     단, 과장은 출력하지 마시오. 5개 or 7개
CREATE VIEW vw_ex10 AS 
SELECT emp.ename, dept.dname, emp.job, emp.sal FROM emp join dept on emp.deptno = dept.deptno WHERE job != '과장' AND sal > ALL(SELECT sal FROM emp WHERE job = '과장');
SELECT emp.ename, dept.dname, emp.job, emp.sal FROM emp join dept on emp.deptno = dept.deptno WHERE job != '과장' AND sal > ANY(SELECT sal FROM emp WHERE job = '과장');

SELECT * FROM vw_ex10 ;


-- 11. 부서별로 과장보다 많은 급여를 받는 같은 부서에 근무하는 
--     직원들의 이름, 부서명, 직급, 급여를 출력하는 뷰를 생성하시오
--     단, 과장은 출력하지 마시오. 3개
CREATE VIEW vw_ex11 AS 
SELECT emp.ename, dept.dname, emp.job, emp.sal, emp.deptno FROM emp join dept on emp.deptno = dept.deptno 
	WHERE emp.deptno in(SELECT deptno FROM emp WHERE job= '과장' GROUP BY deptno) 
			AND emp.sal > ANY(SELECT sal FROM emp WHERE job = '과장' AND deptno in (SELECT deptno FROM emp WHERE job= '과장' GROUP BY deptno))
			AND emp.job != '과장';

SELECT * FROM vw_ex11 ;
