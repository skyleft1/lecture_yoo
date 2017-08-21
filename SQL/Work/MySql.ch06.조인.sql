
--########################
-- 조인은 1개 이상의 테이블을 연결할 때
--
--
--########################

 
 -- 테이블 축약 표현 
 

-- emp 테이블에서 이름(enam)이 '이문세'인 사람을 출력하시오.
SELECT * FROM emp WHERE ename = '이문세';


-- dept 테이블에서 deptno 가 10 인 부서를 출력하시오.
SELECT * FROM dept WHERE deptno = '10';

-- 서브쿼리를 이용해서 '이문세'의 정보와 부서명을 출력하시오.
SELECT *, (SELECT dname FROM dept WHERE deptno= 10) FROM emp WHERE ename = '이문세';


-- 서브쿼리를 이용해서 '이문세'의 정보와 부서명 그리고 위치를 출력하시오.
SELECT *, (SELECT dname FROM dept WHERE deptno= 10) 
        , (SELECT loc FROM dept WHERE deptno= 10) 
FROM emp WHERE ename = '이문세';

-- 서브쿼리를 이용해서 여러 컬럼을 표시할 때 문제 발생됨.
-- 이런 경우에는 조인을 이용하여 쉽게 해결이 가능한다.


-- 조인을 이용해서 '이문세'의 정보와 부서명 그리고 위치를 출력하시오.
SELECT * FROM dept INNER JOIN emp ON dept.deptno = emp.deptno;
SELECT * FROM dept LEFT JOIN emp ON dept.deptno = emp.deptno;


SELECT * FROM dept AS D INNER JOIN emp AS E ON D.deptno = E.deptno;


SELECT *, loc FROM dept INNER JOIN emp ON dept.deptno = emp.deptno;

-- @@@@@@@ 
-- equi join 
-- @@@@@@@ 
SELECT * FROM dept INNER JOIN emp ON dept.deptno = emp.deptno;
SELECT * FROM dept AS D, emp AS E WHERE D.deptno = E.deptno;
SELECT * FROM dept, emp WHERE dept.deptno = emp.deptno;


-- @@@@@@@ 
-- inner join 
-- emp 와 dept 테이블 inner join 하기
-- @@@@@@@ 

SELECT * FROM emp INNER JOIN dept ON emp.deptno = dept.deptno ;
 
  
-- @@@@@@@ 
-- left join
-- @@@@@@@ 
SELECT * FROM emp LEFT JOIN dept ON emp.deptno = dept.deptno ;


-- dept 테이블을 기준으로 emp 테이블의 데이터를 합치시오.
SELECT * FROM dept AS D LEFT JOIN emp AS E ON D.DEPTNO = E.deptno;

-- dept - emp 의 차집합을 구하시오
SELECT * FROM dept AS D LEFT JOIN emp AS E ON D.DEPTNO = E.deptno WHERE ename IS NULL;
SELECT * FROM dept AS D LEFT JOIN emp AS E ON D.DEPTNO = E.deptno WHERE ename IS NOT NULL;


-- @@@@@@@ 
-- right join : 기준 테이블 emp

-- 
-- 위의 query를 right join 에서 left join 으로 바꾸시오.
SELECT * FROM emp LEFT JOIN dept ON emp.deptno = dept.deptno ;
SELECT * FROM dept RIGHT JOIN emp ON dept.deptno = emp.deptno ;
-- left join : 기준 테이블 emp
-- @@@@@@@    


-- book 테이블과 auth 테이블에서 
-- left join 과 right join  하기
SELECT * FROM book AS B LEFT JOIN auth AS A ON B.authid = A.authid ;
SELECT * FROM book AS B RIGHT JOIN auth AS A ON B.authid = A.authid ;


------------
-- auth(부모테이블), book(자식테이블) 테이블에서 left join 구하기
------------
-- auth - book 의 차집합 
SELECT * FROM auth AS A LEFT JOIN book AS B ON A.authid = B.authid ;
SELECT * FROM auth AS A LEFT JOIN book AS B ON A.authid = B.authid WHERE B.bookname IS NULL ;
SELECT * FROM auth AS A LEFT JOIN book AS B ON A.authid = B.authid WHERE B.bookid IS NULL ;

------------
-- auth(부모테이블), book(자식테이블) 테이블에서 right join 구하기
------------
-- book - auth 의 차집합 
SELECT * FROM book AS B RIGHT JOIN auth AS A ON B.authid = A.authid ;

   
-- @@@@@@@ 
-- full join = left join union right join
-- auth(부모테이블), book(자식테이블) 테이블에서 full join 하기
-- @@@@@@@ 
SELECT * FROM auth AS A LEFT JOIN book AS B ON A.authid = B.authid UNION
SELECT * FROM auth AS A RIGHT JOIN book AS B ON A.authid = B.authid ;

-- mysql 은 full join 안 댐 

-- @@@@@@@ 
-- cross join
--    on 절을 생략
-- @@@@@@@ 
SELECT * FROM auth AS A CROSS JOIN book AS B ;



-- @@@@@@@ 
-- self join :  자기를 자신에게 조인을 하는 방법
-- @@@@@@@ 

-- 담당 매니저 찾기
SELECT a.empno, a.ename, a.mgr FROM emp AS a;  -- 지원 정보

SELECT b.empno, b.ename FROM emp AS b;  -- 상사 정보

SELECT b.empno AS '상사번호', b.ename AS '상사이름', a.mgr, a.ename AS '직원이름' FROM emp AS b JOIN emp a ON b.EMPNO = a.mgr;  


-- equi self 조인

SELECT b.empno AS '상사번호', b.ename AS '상사이름', a.mgr, a.ename AS '직원이름' FROM emp AS b, emp AS a WHERE b.empno = a.mgr;


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
SELECT * FROM auth AS A LEFT JOIN book AS B ON A.authid = B.authid UNION
SELECT * FROM auth AS A RIGHT JOIN book AS B ON A.authid = B.authid;
       
       
--@@@@@@@@@@
-- 미션 06-2. 
--@@@@@@@@@@

-- 조인과 서브쿼리를 언제 사용해야 하는가?
-- 결과값이 둘 이상 테이블이 나올경우 조인이 좋고 나머진 서브쿼리


-- 1. 경리부서에 근무하는 사원의 이름과 입사일을 출력하시오.
-- 1-1. dept 테이블에서 '경리부' 찾기


-- *** 서브쿼리가 좋은 경우
-- 1-2. 1-1의 deptno 를이용해서 emp 테이블에서 사원 찾기 -- 서브쿼리가 효율적.
SELECT ename, hiredate FROM emp AS E LEFT JOIN dept AS D ON E.DEPTNO = D.DEPTNO WHERE dname = '경리부';
SELECT ename, hiredate FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dname = '경리부');


-- *** 조인이 좋은 경우
-- 2. 인천에서 근무하는 사원의 이름, 입사일, 급여 그리고 부서명을 출력하시오.
SELECT ename, hiredate, sal, dname FROM emp AS E LEFT JOIN dept AS D ON E.DEPTNO = D.deptno WHERE loc = '인천';


-- *** 서브쿼리가 좋은 경우
-- 3. 인천에서 근무하는 직원의 수를 출력하시오. 서브쿼리 or 조인
SELECT COUNT(*) FROM emp WHERE deptno IN (SELECT deptno FROM dept WHERE loc = '인천');
SELECT COUNT(*) FROM emp AS E LEFT JOIN dept AS D ON E.DEPTNO = D.deptno WHERE loc = '인천';
SELECT COUNT(*) FROM emp AS E JOIN dept AS D ON E.DEPTNO = D.deptno WHERE loc = '인천';


-- *** 조인이 좋은 경우  : INNER JOIN 과 LEFT JOIN 중 어떤것을 사용할지는 나중에 ON 이후 생각한다.
-- 4. 직급(emp.job)이 과장인 직원의 이름(emp.ename), 부서명(dept.dname)을 출력하시오.
SELECT E.ename, D.dname FROM emp AS E LEFT JOIN dept AS D ON E.DEPTNO = D.deptno WHERE E.job = '과장';


-- 5. 직속 상관이 "감우성"인 직원들의 이름(emp.ename)과 직급(emp.job)을 출력하시오. 
SELECT ename, job FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename = '감우성'); 
SELECT B.ename, B.job FROM emp AS A JOIN emp AS B ON A.empno = B.mgr  WHERE A.ename = '감우성'; 


-- 6. "감우성"과 같은 근무지에서 일하는 직급이 '사원'을 출력하시오
SELECT * FROM emp AS E JOIN dept AS D ON E.DEPTNO = D.deptno 
	WHERE D.loc = (SELECT loc FROM dept WHERE deptno = (SELECT deptno FROM emp WHERE ename = '감우성')) AND job = '사원';

SELECT * FROM emp AS E JOIN dept AS D ON E.DEPTNO = D.deptno 
	WHERE D.loc = (SELECT loc FROM emp join dept ON emp.DEPTNO = dept.deptno WHERE ename = '감우성') AND job = '사원';

SELECT * FROM emp AS A JOIN dept AS B ON A.DEPTNO = B.deptno 
								JOIN dept AS C ON B.loc = C.loc
								JOIN emp AS D ON D.DEPTNO = C.deptno 
								WHERE a.ename = '감우성' d.job = '사원';


-- @@@@@@@@@@
-- 미션 06-3 
-- @@@@@@@@@@
-- 1. '이문세'와 동일한 직급을 가진 사원을 출력하시오.
SELECT * FROM emp AS E LEFT JOIN dept AS D ON E.DEPTNO = D.deptno WHERE job = (SELECT job FROM emp WHERE ename = '이문세')

-- 2. 직속 상관이 '감우성'인 사람만 출력하시오.
SELECT B.* FROM emp AS A JOIN emp AS B ON A.empno = B.mgr  WHERE A.empno = (SELECT empno FROM emp WHERE ename = '감우성'); 


-- 3. 부서별로 가장 급여를 많이 받는 사원의 
--    정보(사원번호, 사원이름, 급여, 부서번호, 부서명)를 출력하시오.

-- 서브쿼리 방식
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno;
SELECT *,(SELECT dname FROM dept WHERE emp.deptno = dept.deptno) FROM emp WHERE(deptno, sal) IN ( SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);


-- join 방식
SELECT empno, ename, sal, E.deptno, dname
 FROM emp AS E INNER JOIN dept AS D ON E.DEPTNO = D.DEPTNO
WHERE (E.deptno, E.sal) IN (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);



-- 4. 직급(job) 과장이 속해 있는 부서의 부서번호와 부서명, 위치 
--     그리고 그 부서에 속한 사원들의 정보를 출력하시오.
SELECT E.deptno, dname, loc,e.* FROM emp AS E JOIN dept AS D ON E.DEPTNO = D.DEPTNO 
WHERE E.deptno IN (SELECT distinct deptno FROM emp WHERE job = '과장');


-- 5. 과장보다 많은 급여를 받는 부서별 직원들의 이름, 부서명, 직급, 급여를 출력하되
--     과장은 출력하지 마시오. (과장 누구??)
SELECT * FROM emp AS E JOIN dept AS D ON E.DEPTNO = D.DEPTNO 
WHERE sal > any (SELECT DISTINCT sal FROM emp WHERE job = '과장') AND job != '과장' 

-- 부서별~ 부서별로 과장보다 많은 급여를 받는 같은 부서에 근무하는 ~~ 

SELECT deptno, MIN(sal) FROM emp WHERE job = '과장' GROUP BY deptno ;


SELECT emp.*, dept.DNAME 
FROM emp JOIN dept ON dept.deptno = emp.deptno
	, (SELECT deptno, MIN(sal) sal FROM emp WHERE job = '과장' GROUP BY deptno ) AS minsal
WHERE (emp.deptno = minsal.deptno AND emp.sal > minsal.sal) 
AND emp.jab != '과장';




