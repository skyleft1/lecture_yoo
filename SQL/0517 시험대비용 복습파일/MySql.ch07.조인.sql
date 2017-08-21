
-- ########################
-- 조인은 2개 이상의 테이블을 연결할 때
-- 
-- 
-- ########################

 
 -- emp 테이블에 p 라는 별칭 부여하시오.
 select * from emp as p ;
 
 -- emp 테이블에 p 라는 별칭 부여하고 ename은 이름으로, job 은 직업으로 출력하시오.
select ename '이름', job '직업' from emp as p ;

-- emp 테이블에서 이름(enam)이 '이문세'인 사람을 출력하시오.
select * from emp p where ename = '이문세';

-- dept 테이블에서 deptno 가 10 인 부서를 출력하시오.
select * from dept where deptno = 10;

-- 서브쿼리를 이용해서 '이문세'의 데이터와 부서명을 함께 출력하시오.
select * , (select dname from dept where dept.deptno = emp.deptno) from emp where ename = '이문세';

-- 서브쿼리를 이용해서 '이문세'의 정보와 부서명 그리고 위치를 출력하시오.
select * , (select dname from dept where dept.deptno = emp.deptno) 
				,(select loc from dept where dept.deptno = emp.deptno) 
from emp where ename = '이문세';


-- 서브쿼리를 이용해서 여러 컬럼을 표시할 때 문제 발생됨.
-- 이런 경우에는 조인을 이용하여 쉽게 해결이 가능한다.


-- 조인을 이용해서 '이문세'의 정보와 부서명 그리고 위치를 출력하시오.
select emp.*, dept.loc from emp join dept on emp.deptno = dept.deptno where emp.ename = '이문세'


-- @@@@@@@ 
-- inner join 
-- emp 와 dept 테이블 inner join 하기
-- @@@@@@@ 

-- 직원 정보외 소속된 부서명을 출력하시오.

-- 위의 SQL을 수정하시오. 
-- dept 테이블에 d라는 별칭을, emp 테이블에는 e라는 별칭을 부여하도록 수정하시오.

-- @@@@@@@ 
-- equi join 
-- @@@@@@@ 
  
-- 위의 SQL에서 테이블에 별칭을 부여하도록 수정하시오. 
-- dept --> d , emp-->e .


-- @@@@@@@ 
-- left join
-- @@@@@@@ 

-- dept 테이블을 기준으로 emp 테이블의 데이터를 합치시오.

-- dept - emp 의 차집합을 구하시오. 3개의 출력



-- @@@@@@@ 
-- right join 
-- @@@@@@@    

-- emp 테이블을 기준으로 dept 테이블의 데이터를 합치시오.




-- ----------
-- auth(부모테이블), book(자식테이블) 테이블에서 left join 구하기
-- ----------

-- left join 하기 : auth 테이블을 기준으로 book 테이블의 데이터를 합치시오.
-- auth - book 의 차집합 




-- ----------
-- auth(부모테이블), book(자식테이블) 테이블에서 right join 구하기
-- ----------

-- right join : book 테이블을 기준으로 auth 테이블의 데이터를 합치시오.
-- book - auth 의 차집합 


   
-- ----------
-- full join = left join union right join
-- auth(부모테이블), book(자식테이블) 테이블에서 full join 하기
-- oracle은 full join을 지원함.
-- mysql은 full join을 지원하지 않음.
-- ----------



-- @@@@@@@ 
-- cross join
--    on 절을 생략
-- @@@@@@@ 





-- @@@@@@@ 
-- self join :  자신에게 자기를 조인을 하는 방법
-- @@@@@@@ 

-- inner join을 이용하여 담당 매니저 찾기. emp.mgr
SELECT b.empno , b.ename , a.mgr, a.ename  FROM emp AS b JOIN emp a ON b.EMPNO = a.mgr;  



-- equi self join을 이용하여 담당 매니저 찾기


       
       
-- @@@@@@@@@@
-- 미션 06. 
-- @@@@@@@@@@
-- 1. 경리부서에 근무하는 사원의 이름과 입사일을 출력하시오. 3개. 서브쿼리
select ename, hiredate from emp where deptno = (select deptno from dept where dname = '경리부');


-- 2. 인천에서 근무하는 사원의 이름, 입사일, 급여 그리고 부서명을 출력하시오. 3개. 조인
select ename, hiredate, sal, dname from emp join dept on emp.deptno = dept.DEPTNO where dept.LOC = '인천';


-- 3. 인천에서 근무하는 직원의 수를 출력하시오. 6개
select count(*) from emp join dept on emp.deptno = dept.DEPTNO where dept.LOC = '인천';


-- 4. 직급(emp.job)이 과장인 직원의 이름(emp.ename), 부서명(dept.dname)을 출력하시오. 3개
select ename, dname from emp join dept on emp.deptno = dept.DEPTNO where emp.job = '과장';


-- 5. 직속 상관이 "감우성"인 직원들의 이름(ename),직급(job)를 출력하시오. 6개
select b.empno, b.mgr, b.ename, b.job from emp a join emp b on a.empno = b.mgr where a.ename = '감우성';



-- 6. "감우성"과 같은 근무지에서 일하는 직급이 '사원'인 직원만 출력하시오.4개

select * from emp join dept on emp.deptno = dept.DEPTNO 
where dept.loc = (select loc from dept where deptno = (select deptno from emp where ename = '감우성')) AND job = '사원';


-- 7. '이문세'와 동일한 직급을 가진 사원을 출력하시오. 4개
select * from emp where job = (select job from emp where ename = '이문세');



-- 8. 부서별로 가장 급여를 많이 받는 사원의 
--    사원번호, 사원이름, 급여, 부서번호, 부서명를 출력하시오. 8개
select empno, ename, sal, emp.deptno, dname from emp join dept on emp.deptno = dept.DEPTNO 
where (sal, emp.deptno) in(select max(sal), deptno from emp Group by deptno);

select empno, ename, sal, emp.deptno, dname from emp join dept on emp.deptno = dept.DEPTNO 
where (emp.deptno, sal) in(select deptno, max(sal) from emp Group by deptno);



-- 8.1 서브쿼리 방식



-- 8.2 join 방식




-- 9. 직급(job) 과장이 속해 있는 부서의 부서번호와 부서명, 위치 
--    그리고 그 부서에 속한 사원들의 정보를 출력하시오. 9개
select emp.*, dept.* from emp join dept on emp.deptno = dept.DEPTNO 
where emp.deptno in(select deptno from emp where JOB = '과장')


-- 10. 과장보다 많은 급여를 받는 직원들의 이름, 부서명, 직급, 급여를 출력하되
--     과장은 출력하지 마시오. 5개 or 7개
SELECT * FROM emp AS E JOIN dept AS D ON E.DEPTNO = D.DEPTNO 
WHERE sal > any (SELECT DISTINCT sal FROM emp WHERE job = '과장') AND job != '과장' 


-- 11. 부서별로 과장보다 많은 급여를 받는 같은 부서에 근무하는 
--     직원들의 이름, 부서명, 직급, 급여를 출력하되 과장은 출력하지 마시오. 3개

select * from emp 
, (select deptno, max(sal) sal from emp where job = '과장' group by deptno) ts
where emp.deptno=ts.deptno and emp.sal > ts.sal ;

select * from emp 
 join (select deptno, max(sal) sal from emp where job = '과장' group by deptno) ts
on emp.deptno = ts.deptno and emp.sal > ts.sal ;

