
--@@@@@@@@@@@@
-- 단일행 서브 쿼리 : =
--@@@@@@@@@@@@

-- '이문세'의 부서명 알아내기
SELECT deptno FROM emp WHERE ename = '이문세';

-- 서브쿼리를 이용하여 '이문세'의 부서명 알아내기
SELECT * FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = '이문세');
 
-- 평균 급여보다 더 많은 급여를 받는 사원 출력하기
SELECT AVG(sal) FROM emp;
SELECT * FROM emp WHERE sal > 457.77;

-- 서브쿼리를 이용하여 평균 급여보다 더 많은 급여를 받는 사원 출력하기
SELECT * FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);


--@@@@@@@@@@@@
-- 다중행 서브 쿼리
--@@@@@@@@@@@@


---------------------- 
-- 다중 행 subquery in 사용 예제
----------------------
-- 인천에서 근무하는 직원을 출력하시오.
SELECT deptno FROM dept WHERE loc = '인천';
SELECT * FROM emp WHERE deptno IN(SELECT deptno FROM dept WHERE loc = '인천');

-- 서브쿼리를 이용하여 인천에서 근무하는 직원을 출력하시오.
SELECT deptno FROM dept WHERE loc = '인천';
SELECT * FROM emp WHERE deptno IN(SELECT deptno FROM dept WHERE loc = '인천');


-- 급여가 500을 초과하는 사원과 같은 부서(deptno) 에 근무하는 직원을 출력하시오.
SELECT * FROM emp WHERE deptno in (SELECT deptno FROM emp WHERE sal > 500);

-- 서브쿼리를 이용하여 급여가 500을 초과하는 사원과 같은 부서(deptno) 에 근무하는 직원을 출력하시오.
SELECT * FROM emp WHERE deptno in (SELECT deptno FROM emp WHERE sal > 500);


---------------------- 
-- 다중 행 subquery not in 사용 예제
----------------------
-- 인천에 근무하지 않는 직원을 출력하시오.
SELECT * FROM emp WHERE deptno in (SELECT deptno FROM dept WHERE loc != '인천');

-- 서브쿼리를 이용하여  인천에 근무하지 않는 직원을 출력하시오.
SELECT * FROM emp WHERE deptno in (SELECT deptno FROM dept WHERE loc != '인천');


---------------------- 
-- 다중 행 subquery ALL 사용 예제
----------------------
-- deptno=30인 부서의 최대 급여보다 많은 급여를 받는 직원을 출력하시오.
-- 첫번째 방식. MAX 사용
SELECT * FROM emp WHERE deptno = 30
SELECT * FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30);

-- 두번째 방식. ALL  사용 == 연속 AND 와 같은 의미
SELECT * FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE deptno = 30);

---------------------- 
-- 다중 행 subquery ANY 사용 예제
----------------------
-- deptno=30인 부서의 최소 급여보다 많은 급여를 받는 직원을 출력하시오.
-- 첫번째 방식. MIN 사용

SELECT * FROM emp WHERE sal > (SELECT MIN(sal) FROM emp WHERE deptno = 30);

-- 두번째 방식. ANY 사용 == 연속 OR 와 같은 의미

SELECT * FROM emp WHERE sal > ANY (SELECT sal FROM emp WHERE deptno = 30);

---------------------- 
-- 다중 행 subquery exist 사용 예제
----------------------


-- 현재 직원이 있는 부서만 출력하시오. 5개만 출력되면 정상.

SELECT * FROM dept WHERE deptno in (SELECT deptno FROM emp GROUP BY deptno);

--@@@@@@@@@@@@
-- table 서브 쿼리 : from 절에서 사용되는 서브쿼리
--@@@@@@@@@@@@




--@@@@@@@@@@@@
-- scalar 서브 쿼리 : select 절에서 사용되는 서브쿼리
--@@@@@@@@@@@@






--@@@@@@@@@@@@@@
-- 미션 05. 
--@@@@@@@@@@@@@@

-- 1. 서브쿼리를 이용해서 영업부에 근무하는 사원의 이름과 입사일을 출력하시오.
SELECT ename, hiredate FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dname = '영업부');

-- 2. 과장의 최소 급여보다 많은 급여를 받는 사원들의 
--    이름, 급여 그리고 직급을 출력하되, 과장은 출력하지 않는다.
SELECT ename, sal FROM emp WHERE sal > ( SELECT MIN(sal) FROM emp WHERE job = '과장') AND job != '과장';


-- 3. 인천에 위치한 부서에 소속된 직원들의 급여를 100씩 인상한 결과를 출력하시오.
SELECT *, sal+100 FROM emp WHERE deptno IN (SELECT deptno FROM dept WHERE loc = '인천');


-- 4. 부서별로 가장 급여를 많이 받는 직원의 정보를 출력하시오.

SELECT deptno, MAX(sal) FROM emp WHERE deptno = 10 UNION
SELECT deptno, MAX(sal) FROM emp WHERE deptno = 20 UNION
SELECT deptno, MAX(sal) FROM emp WHERE deptno = 21 UNION
SELECT deptno, MAX(sal) FROM emp WHERE deptno = 30 UNION
SELECT deptno, MAX(sal) FROM emp WHERE deptno = 31 ;

SELECT * FROM emp WHERE (deptno, sal) IN (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);



-- 5. 직급(job)이 과장인 직원들이 속한 부서 정보를 출력하시오.
SELECT * FROM emp WHERE deptno IN(SELECT deptno FROM emp WHERE job = '과장');

          
          
