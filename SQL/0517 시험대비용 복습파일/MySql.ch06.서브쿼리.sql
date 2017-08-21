
--@@@@@@@@@@@@
-- 단일행 서브 쿼리 : =
--@@@@@@@@@@@@

-- '이문세'의 부서명 알아내기
select deptno from emp where ename = '이문세';

-- 서브쿼리를 이용하여 '이문세'의 부서명 알아내기
select * from dept where deptno = (select deptno from emp where ename = '이문세');

-- 평균 급여보다 더 많은 급여를 받는 사원 출력하기. 9명
-- 서브쿼리를 이용하여 평균 급여보다 더 많은 급여를 받는 사원 출력하기
select * from emp where sal > (select avg(sal) from emp );


-- 문제. 급여가 500을 초과하는 사원과 같은 부서에 근무하는 사원 구하기
select * from dept where deptno in (select deptno from emp where sal > 500);

-- @@@@@@@@@@@@
-- 다중행 서브 쿼리
-- @@@@@@@@@@@@


-- -------------------- 
-- 다중 행 subquery in 사용 예제
-- --------------------
-- 인천에서 근무하는 직원을 출력하시오. 6개
-- 서브쿼리를 이용하여 인천에서 근무하는 직원을 출력하시오.
select * from emp where deptno in(select deptno from dept where loc = '인천');

-- 급여가 500을 초과하는 사원과 같은 부서(deptno) 에 근무하는 직원을 출력하시오.
-- 서브쿼리를 이용하여 급여가 500을 초과하는 사원과 같은 부서(deptno) 에 근무하는 직원을 출력하시오.
select * from emp where deptno in(select deptno from emp where sal > 500);

---------------------- 
-- 다중 행 subquery not in 사용 예제
----------------------
-- 인천에 근무하지 않는 직원을 출력하시오.
-- 서브쿼리를 이용하여  인천에 근무하지 않는 직원을 출력하시오.
select * from emp where deptno in(select deptno from dept where loc != '인천');

-- -------------------- 
-- 다중 행 subquery ALL 사용 예제
-- --------------------
-- deptno=30인 부서의 최대 급여보다 많은 급여를 받는 직원을 출력하시오.
-- 첫번째 방식. MAX 사용
select * from emp where sal > (select max(sal) from emp where deptno = 30);


-- 두번째 방식. ALL  사용 == 연속 AND 와 같은 의미
select * from emp where sal > all(select sal from emp where deptno = 30);

-- -------------------- 
-- 다중 행 subquery ANY 사용 예제
-- --------------------
-- deptno=30인 부서의 최소 급여보다 많은 급여를 받는 직원을 출력하시오.
-- 첫번째 방식. MIN 사용
select * from emp where sal > (select min(sal) from emp where deptno = 30);

-- 두번째 방식. ANY 사용 == 연속 OR 와 같은 의미
select * from emp where sal > any(select sal from emp where deptno = 30);

-- -------------------- 
-- 다중 행 subquery exist 사용 예제
-- --------------------

-- 현재 직원이 있는 부서만 출력하시오. 5개만 출력되면 정상.
-- in을 사용하는 경우
-- exists 를 사용하는 경우
select * from emp where sal > any(select sal from emp where deptno = 30);
 
 
-- @@@@@@@@@@@@
-- table 서브 쿼리 : from 절에서 사용되는 서브쿼리
-- join 이 결합된 상태

-- @@@@@@@@@@@@
-- 인천에서 근무하는 직원을 출력하시오. 6개
-- where절 서브 쿼리를 사용하는 경우

select * from emp where deptno in(select deptno from dept where loc = '인천');
 
-- from절 서브 쿼리를 사용하는 경우 
select * from emp, (select deptno from dept where loc = '인천') d where emp.deptno = d.deptno;


-- @@@@@@@@@@@@
-- scalar 서브 쿼리 : select 절에서 사용되는 서브쿼리
-- join 이 결합된 상태
-- @@@@@@@@@@@@
-- emp 출력시 deptno 대신에 dept테이블의 dname 값이 출력되도록 하시오.

select *, (select dname from dept where emp.deptno = dept.deptno ) d from emp ;



-- @@@@@@@@@@@@@@
-- 미션 05. 
-- @@@@@@@@@@@@@@

-- 1. 서브쿼리를 이용해서 영업부에 근무하는 사원의 이름과 입사일을 출력하시오.
select ename, hiredate from emp where deptno = (select deptno from dept where dname = '영업부');



-- 2. 과장의 최소 급여보다 많은 급여를 받는 직원들의 
--    이름, 급여 그리고 직급을 출력하되, 과장은 출력하지 않는다.
select ename, sal, job from emp where sal > (select min(sal) from emp where job = '과장') and job != '과장';



-- 3. 인천에 위치한 부서에 소속된 직원들의 급여를 100씩 인상한 결과를 출력하시오.
select sal, (sal+100) from emp where deptno in(select deptno from dept where loc = '인천');


-- 4. 부서별로 가장 급여를 많이 받는 직원의 정보를 출력하시오.
select * from emp where (deptno, sal) in(select deptno, Max(sal) from emp group by deptno);

 
-- 5. 직급(job)이 과장인 직원들이 속한 부서 정보를 출력하시오.
select * from dept where deptno in (select deptno from emp where job = '과장');


-- 6. 평균 급여보다 더 많은 급여를 받는 사원 출력하기
select * from emp where sal > (select avg(sal) from emp);

-- 7. 이문세와 같은 부서에 근무하는 사원의 이름과 부서번호를 출력하는 SQL을 작성하시오.
select ename, deptno from emp where deptno = (select deptno from emp where ename = '이문세');


-- 8. 이문세와 동일한 직급을 가진 사원을 출력하시오.
select * from emp where job = (select job from emp where ename = '이문세');

-- 9. 이문세의 급여와 동일하거나 더 많이 받는 사원 명과 급여를 출력하시오.
select * from emp where sal >= (select sal from emp where ename = '이문세');

-- 10. 직속 상관이 감우성인 사원의 이름과 급여를 출력하시오.
select * from emp where empno = (select mgr from emp where ename = '이문세');
