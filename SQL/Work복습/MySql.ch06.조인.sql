
--########################
-- 조인은 1개 이상의 테이블을 연결할 때
--
--
--########################

 
 -- 테이블 축약 표현 
 

-- emp 테이블에서 이름(enam)이 '이문세'인 사람을 출력하시오.

-- dept 테이블에서 deptno 가 10 인 부서를 출력하시오.


-- 서브쿼리를 이용해서 '이문세'의 정보와 부서명을 출력하시오.



-- 서브쿼리를 이용해서 '이문세'의 정보와 부서명 그리고 위치를 출력하시오.
-- 서브쿼리를 이용해서 여러 컬럼을 표시할 때 문제 발생됨.
-- 이런 경우에는 조인을 이용하여 쉽게 해결이 가능한다.


-- 조인을 이용해서 '이문세'의 정보와 부서명 그리고 위치를 출력하시오.




-- @@@@@@@ 
-- equi join 
-- @@@@@@@ 





-- @@@@@@@ 
-- inner join 
-- emp 와 dept 테이블 inner join 하기
-- @@@@@@@ 



 
  
-- @@@@@@@ 
-- left join
-- @@@@@@@ 





-- @@@@@@@ 
-- right join : 기준 테이블 emp
--
-- 위의 query를 right join 에서 left join 으로 바꾸시오.
-- left join : 기준 테이블 emp
-- @@@@@@@    




-- book 테이블과 auth 테이블에서 
-- left join 과 right join  하기





------------
-- auth(부모테이블), book(자식테이블) 테이블에서 left join 구하기
------------
-- auth - book 의 차집합 




------------
-- auth(부모테이블), book(자식테이블) 테이블에서 right join 구하기
------------
-- book - auth 의 차집합 



   
-- @@@@@@@ 
-- full join = left join union right join
-- auth(부모테이블), book(자식테이블) 테이블에서 full join 하기
-- @@@@@@@ 





-- @@@@@@@ 
-- cross join
--    on 절을 생략
-- @@@@@@@ 






-- @@@@@@@ 
-- self join :  자기를 자신에게 조인을 하는 방법
-- @@@@@@@ 

-- 담당 매니저 찾기



-- equi self 조인




-- equi self 조인을 inner self join 으로 바꾸기




--@@@@@@@@@@
-- 미션 06-1. ansi join 실습       
-- auth 와 book 테이블에서
--@@@@@@@@@@
  
-- inner join

-- left join

-- right join

-- full join           
       
-- 두 결과의 합집합 구하기 :  left join union right join


       
       
--@@@@@@@@@@
-- 미션 06-2. 
--@@@@@@@@@@
-- 1. 경리부서에 근무하는 사원의 이름과 입사일을 출력하시오.
-- 1-1. dept 테이블에서 '경리부' 찾기
-- 1-2. 1-1의 deptno 를이용해서 emp 테이블에서 사원 찾기



-- 2. 인천에서 근무하는 사원의 이름, 입사일, 급여 그리고 부서명을 출력하시오.



-- 3. 인천에서 근무하는 직원의 수를 출력하시오. 서브쿼리 or 조인


-- 4. 직급(emp.job)이 과장인 직원의 이름(emp.ename), 부서명(dept.dname)을 출력하시오.


-- 5. 직속 상관이 "감우성"인 직원들의 이름(emp.ename)과 직급(emp.job)을 출력하시오. 


-- 6. "감우성"과 같은 근무지에서 일하는 직급이 '사원'을 출력하시오





--@@@@@@@@@@
-- 미션 06-3 
--@@@@@@@@@@
-- 1. '이문세'와 동일한 직급을 가진 사원을 출력하시오.


-- 2. 직속 상관이 '감우성'인 사람만 출력하시오.


-- 3. 부서별로 가장 급여를 많이 받는 사원의 
--    정보(사원번호, 사원이름, 급여, 부서번호, 부서명)를 출력하시오.


-- 서브쿼리 방식


-- join 방식


-- 4. 직급(job) 과장이 속해 있는 부서의 부서번호와 부서명, 위치 
--     그리고 그 부서에 속한 사원들의 정보를 출력하시오.


-- 5. 과장보다 많은 급여를 받는 직원들의 이름, 부서명, 직급, 급여를 출력하되
--     과장은 출력하지 마시오.



