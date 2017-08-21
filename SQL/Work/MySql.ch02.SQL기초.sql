-- SQL 에서 문자와 숫자의 차이
-- 숫자: 오른쪽 정렬
-- 문자: 왼쪽 정렬


-- SQL 에서 NULL 이란?

       
dept

--########################
-- select 사용법
-- 
-- select *
--  from 테이블명;

-- select 컬럼1, 컬럼2, 컬럼3
--   from 테이블명;
--########################


-- DEPT 테이블에서 컬럼명으로 데이터 조회하기
select * from dept;


-- DEPT 테이블에서 모든 컬럼의 데이터 조회하기
select deptno, dname, loc from dept;

-- EMP 테이블에서 JOB, ENAME 컬럼만 출력하세요
select job, ename from emp;


-- EMP 테이블에서 모든 컬럼의 데이터 조회하기
select * from emp;

--@@@@@@@@@@@@@@@@@@@@@@@@
-- 산술연산
--@@@@@@@@@@@@@@@@@@@@@@@@
  

-- null 연산

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- null 값을 연산하기 위해서는 nvl() 함수를 사용해야 한다
select ifnull(1,0);   -- 기대되는 것은 1이 출력되는 것

select ifnull(null,10);  -- 기대되는 것은 10이 출력되는 것

-- @@@@@@@@@@@@@@@@@@@@@@@@
  
  
-- emp 테이블에서 이름과 mgr 값을 출력하시오. (단, mgr이 null 이면 0으로 출력되게 해라)
select ename, ifnull(mgr,0)  from emp;

  
-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 컬럼에 별칭(별명) 주기
-- AS로 컬럼에 별칭 부여하기
select job as '직업', ename as '이름' from emp;

-- AS 없이 컬럼에 별칭 부여하기
select job '직업', ename '이름' from emp;

-- “ ”로 별칭 부여하기
select job aa, ename '+nickname' from emp;

-- @@@@@@@@@@@@@@@@@@@@@@@@


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 중복 제거 - DISTINCT
select ename from emp;  -- 18개 

select distinct ename from emp;  -- 17개(이병헌 중복제거)

-- Q. emp 테이블의 ename과 deptono 중복값 제거하라 -- 안된다.
-- select distinct ename, deptno from emp;  -- 결과는 안된다.

-- @@@@@@@@@@@@@@@@@@@@@@@@


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 컬럼 연결, 문자열 연결  : 
-- concat( 컬럼1, 컬럼2 );
-- concat( 컬럼1, 컬럼2, 컬럼3, 컬럼4);
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- "김사랑의 직급은 사원입니다" 출력하기

--  1) 김사랑 조회하기
select ename, job from emp where ename = '김사랑';

--  2) "김사랑의 직급은 사원입니다" 출력하기
select concat(ename, '의 직급은 ', job, '입니다.') from emp where ename = '김사랑';

-- ename 의 직급은 job 입니다
select concat(ename, '의 직급은 ', job, '입니다.') from emp ;


-- Q. "김사랑의 직급은 사원입니다"  출력되는 컬럼이름을 직급으로
select concat(ename , '의 직급은 ', job, '입니다.') as '직급' from emp where ename = '김사랑';


-- ########################
-- where 사용법
-- 
-- select 컬럼1, 컬럼2, 컬럼3
--   from 테이블명
--  where 조건
-- ########################

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 산술연산자를 이용한 조건 검색
-- =, > , >=, <, <=, !=
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- sal이 500보다 크거나 같은 경우만 출력하시오
select * from emp where sal >= 500;
  
-- deptno 가 10 인경우만 출력
select * from emp where deptno = 10;

-- 부정연산( <> , != )
-- deptno 가 10 이 아닌 사람만 출력하시오.
select * from emp where deptno != 10;

-- ename 이 '이문세'인 경우만 출력
select * from emp where ename = '이문세';

-- ename 이 '이문세'가 아닌 경우만 출력
select * from emp where ename != '이문세';



-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 논리연산자를 이용한 조건 검색 
-- and, or, not( !=, <> )
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- deptno 가 10 인 사람만 출력하시오
select * from emp where deptno = 10;

-- job이 과장인 사람만 출력하시오
select * from emp where job = '과장';

-- deptno 가 10  이고(and) job이 과장인 사람만 출력하시오
select * from emp where deptno = 10 and job = '과장';

-- deptno 가 10  이거나(or) job이 과장인 사람만 출력하시오
select * from emp where deptno = 10 or job = '과장';

 



-- 산술연사자를 이용해서 
-- sal 값이 400보다 크거나 같고 그리고(and) 
-- sal 값이 500보다 작거나 같은 사원만 출력하시오
select * from emp where sal >= 400 and sal <=500 ;

-- 산술연사자를 이용해서 
-- sal 값이 400보다 크거나 같거나(or) 
-- sal 값이 500보다 작거나 같은 사원만 출력하시오
select * from emp where sal >= 400 or sal <=500 ;

-- between A and B 를 이용해서 
-- sal 값이 400보다 크거나 같고 그리고(and) 
-- sal 값이 500보다 작거나 같은 사원만 출력하시오
select * from emp where sal between 400 and 500;
-- SELECT * FROM emp WHERE 400 <= sal and sal <= 500;

-- between A and B 를 이용해서 
-- sal 값이 400보다 작거나(or) sal 값이 500보다 큰 경우의 사원만 출력하시오 
-- 만들 수 없다.
-- select * from emp where sal between 400 or 500; --- 오류 발생

-- 입사일(hiredate)이 2005/01/01 이전인 사람들만 출력하시오
-- to_date('2005/01/01', 'YYYY/MM/DD')

select * from emp where hiredate < '2005/01/01';


-- 입사일(hiredate)이 2005/01/01 부터  2012/12/31 까지 입사한 사람들만 출력하시오
-- 비교 연산자를 이용하는 경우
select * from emp where hiredate > '2005/01/01' and hiredate < '2012/12/31';

-- between A and B 를 이용해서 
select * from emp where hiredate between '2005/01/01' and '2012/12/31';


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- like를 이용한 조건 검색
-- %
-- _
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 이름(ename)이 '이'로 시작하는 사원만 출력하시오   
select * from emp where ename like '이%';  -- M으로 시작 => 'M%'


-- 이름이 '이'로 끝나는 사원만 출력하시오
select * from emp where ename like '%호';  -- M으로 끝 => '%M' (3번째가 M 인경우 '__M%' 활용)

-- 이름에 '이'가 들어가 있는 사원만 출력하시오
select * from emp where ename like '%이%';  -- M가 포함된 => '%M%'


-- 이름에 '성'자가 들어가는 사원을 출력하시오
select * from emp where ename like '%성%';

-- 이름에 '성'자가 들어가지 않는 사원을 출력하시오. NOT 사용 
select * from emp where ename not like '%성%';


-- 글자한개를 표시: _ 
-- 와일드카드(_) 를 활용해 안성기 출력
select * from emp where ename like '안__';

-- 글자 두 개를 표시: _ 2개
-- -- 와일드카드(_) 를 활용해 감우성, 조인성 출력
select * from emp where ename like '__성';

-- Q 
-- LIKE 'a%'
-- LIKE '%a'
-- LIKE '%or%'
-- LIKE 
-- LIKE
-- LIKE


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- in , not in
-- in      연산. or  연산의 축약
-- not in  연산. and 연산의 축약
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- or 연산으로
-- comm이 80 이거나 100 이거나 200인 사람만 출력하시오.
SELECT * FROM emp WHERE comm = 80 or comm = 200;

-- in 연산으로 
-- comm이 80 이거나 100 이거나 200인 사람만 출력하시오.
SELECT * FROM emp WHERE comm in (80, 200);


-- comm이 80 이 아니고 그리고 100 이 아니고 그리고 200 이 아닌 사람만 출력하시오.
SELECT * FROM emp WHERE comm != 80 and comm != 100 and comm != 200;

-- not in 연산으로 
-- comm이 80 이 아니고 그리고 100 이 아니고 그리고 200 이 아닌 사람만 출력하시오.
SELECT * FROM emp WHERE comm NOT IN (80, 100, 200);



-- @@@@@@@@@@@@@@@@@@@@@@@@
-- is null , is not null
-- =
-- like
-- is null
-- @@@@@@@@@@@@@@@@@@@@@@@@
-- comm 값이  null 인 경우의 출력하시오
SELECT * FROM emp WHERE comm = null;  -- 0개
SELECT * FROM emp WHERE comm IS NULL;  -- 14개

-- comm 값이  null 이 아닌 경우만 출력하시오
SELECT * FROM emp WHERE comm IS NOT NULL;


-- ########################
-- 정렬
-- 오름차순 정렬
-- 내림차순 정렬
-- ########################

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 오름차순 정렬 : ASC : ascending 
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- sal 컬럼을 오름값순으로 정렬하시오
SELECT * FROM emp ORDER BY sal ASC;
-- 이름(ename)을 오름차순으로 출력하시오
SELECT * FROM emp ORDER BY ename ASC;


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 내림차순 정렬 : DESC : descending 
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- sal 컬럼을 내림값순으로 출력하시오
SELECT * FROM emp ORDER BY sal DESC;
SELECT * FROM emp ORDER BY ename DESC;


-- 이름이 '이병헌'인 사원을 찾아서 
-- sal 값을 기준으로 오름차순 정렬하시오.
SELECT * FROM emp WHERE ename = '이병헌' ORDER BY sal ASC;


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 중복 정렬: 정렬 조건이 2개 인 경우
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 이름(ename)은 오름차순으로 정렬하고 
-- 입사일(hiredate)은 내림차순으로 정렬하시오
SELECT * FROM emp ORDER BY ename ASC, hiredate DESC;


-- Q 급여를 많이 받는 순으로 출력하되, 급여가 같으면 이름 의 철자가 빠른순으로 출력해라
SELECT * FROM emp ORDER BY sal DESC, ename ASC;

-- ########################
-- 집합 연산자
-- 합집합: union
-- 교집합: INNER JOIN (intersect 오라클)
-- 차집합: RIGHT JOIN (minus 오라클)
-- ########################

-- 합집합 구하기. 중복 제거. UNION
SELECT * FROM group_star UNION SELECT * FROM single_star;

-- 합집합 구하기. 중복 포함
SELECT * FROM group_star UNION ALL SELECT * FROM single_star;

-- 교집합 구하기. 공통 부문만 출력
SELECT group_star.* FROM group_star INNER JOIN single_star ON group_star.name = single_star.nickname;

SELECT `그룹`.* FROM group_star AS `그룹` INNER JOIN single_star AS `싱글` ON `그룹`.name = `싱글`.nickname;



SELECT * FROM group_star LEFT JOIN single_star ON group_star.name = single_star.nickname;

-- 차집합 구하기 : GROUP_STAR - SINGLE_STAR : 10개 출력
SELECT * FROM group_star LEFT JOIN single_star ON group_star.name = single_star.nickname WHERE single_star.nickname IS NULL;


-- 차집합 구하기 : SINGLE_STAR - GROUP_STAR : 3개 출력
SELECT * FROM single_star LEFT JOIN group_star ON single_star.nickname = group_star.name WHERE group_star.name IS NULL;


-- ########################
-- 미션 1.
-- ########################
-- emp테이블에서 사원의 이름과 급여와 입사일만을 출력하시오. 
-- 컬럼 3개 출력하기
SELECT ename, sal, hiredate FROM emp ;

-- 컬럼 이름에 별칭을 붙여 출력하시오.
SELECT ename AS '이름', sal AS '급여', hiredate AS '입사일' FROM emp ;


-- 직급이 중복되지 않게 한 번씩만 출력하시오
SELECT DISTINCT job FROM emp ;

-- ########################
-- 미션2. SEARCHING( WHERE )
-- ########################
-- 급여가 300 이하인 사원의 사원번호, 사원 이름, 급여를 출력하기
SELECT empno, ename, sal FROM emp WHERE sal <= 300;


-- 이름이 “오지호”인 사원의 사원번호, 사원명, 급여를 출력하기
SELECT empno, ename, sal FROM emp WHERE ename = '오지호';

-- 급여가 250이거나 300이거나 500인 사원들의 사원 번호와 사원명과 급여를 검색하기
SELECT empno, ename, sal FROM emp WHERE sal IN (250, 300, 500);
SELECT empno, ename, sal FROM emp WHERE sal = 250 or sal = 300 or sal = 500; 

-- 급여가 250이거나 300이거나 500도 아닌 사원들을 검색하기
SELECT empno, ename, sal FROM emp WHERE sal NOt IN (250, 300, 500);
SELECT empno, ename, sal FROM emp WHERE sal != 250 and sal != 300 and sal != 500; 

-- ########################
-- 미션3. SORTING(ORDER BY)
-- ########################
-- LIKE 연산자와 와일드 카드를 사용하여 사원들 중에서 이름이 “김”으로 시작하는 사람이나
-- 이름 중에 “기”를 포함하는 사원의 사원번호와 사원이름을 출력하기
SELECT * FROM emp WHERE ename LIKE '김__' or ename LIKE '%기%' 

-- 상관이 없는 사원(사장이 되겠지요!)을 검색하기
SELECT * FROM emp WHERE mgr IS null;


-- 사원 테이블에서 최근 입사한 직원 순으로 사원번호, 사원명, 직급, 입사일 컬럼 만 출력하기
SELECT empno, ename, job, hiredate FROM emp ORDER BY hiredate DESC;

-- 부서 번호가 빠른 사원부터 출력하되 같은 부서내의 사원을 출력할 경우 
-- 입사한지 가장 오래된 사원부터 출력하기
SELECT * FROM emp ORDER BY deptno ASC, hiredate ASC;




-- ########################
-- 미션4. 
-- ########################
-- 1. book 테이블의 모든 데이터를 출력하시오
SELECT * FROM book;

-- 2. book 테이블에서 bookname,  publisher,  price,  authid   컬럼만 레코드를 출력하시오.
SELECT bookname, publisher, price, authid FROM book;

-- 3. book 테이블에서 bookname 컬럼에 SQL 이 들어가 있는 레코드를 출력하시오
SELECT * FROM book WHERE bookname LIKE "%SQL%";

-- 4. bookname 이 SQL로 끝나는 레코드를 출력하시오
SELECT * FROM book WHERE bookname LIKE "%SQL";

-- 5. bookname 이 SQL로 시작하는 레코드를 출력하시오
SELECT * FROM book WHERE bookname LIKE "SQL&";

-- 6. price가 30,700원 이상(크거나 같다)이고
--            50,000원 미만(작다)인 레코드를 출력하시오
SELECT * FROM book WHERE price >= 30700 AND price < 50000;

-- 7. price가 30,700원 이상이고 50,000원 미만인 레코드를 출력하시오.
--    단, between문을 사용하시오
SELECT * FROM book WHERE price BETWEEN 30700 AND 50000;

-- 8. bookname의 값이 'JAVA' 이고
--    price 가 30,000 원 이상인 데이터를 찾으시오
SELECT * FROM book WHERE bookname = 'java' AND price >= 30000;

-- 9. price가 30,700원 이하(작거나 같다) 이거나 
--            58,000원 초과(크다)인 레코드를 출력하시오
SELECT * FROM book WHERE price <= 30700 OR price > 58000;

-- 10. 레코드를 price 오름차순으로 정렬하시오.
SELECT * FROM book ORDER BY price ASC;

-- 11. 레코드를 price 내림차순으로 정렬하시오.
SELECT * FROM book ORDER BY price DESC;

-- 12. 레코드를  정렬하시오. publisher 오름차순, price  내림차순
SELECT * FROM book ORDER BY publisher ASC, price DESC;

-- 13. bookname에 'SQL' 이 들어가는 레코드 중에 price 가 를 내림차순으로 정렬하시오
SELECT * FROM book WHERE bookname LIKE "%SQL%" ORDER BY price DESC;


-- Q 레코드 검색하기
SELECT * FROM book WHERE bookid < 5;

