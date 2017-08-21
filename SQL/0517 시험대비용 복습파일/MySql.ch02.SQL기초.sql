-- SQL 에서 문자와 숫자의 차이
-- 숫자: 오른쪽 정렬
-- 문자: 왼쪽 정렬


-- SQL 에서 NULL 이란?

       


-- ########################
-- select 사용법
-- 
-- select *
--   from 테이블명;
--
-- select 컬럼1, 컬럼2, 컬럼3
--   from 테이블명;
-- ########################


-- DEPT 테이블에서 모든 컬럼의 데이터 조회하기
select * from dept;


-- DEPT 테이블에서 컬럼명으로 데이터 조회하기
select deptno, dname, loc, pid from dept;


-- EMP 테이블에서 JOB, ENAME 컬럼만 출력하세요
select job, ename from emp;


-- EMP 테이블에서 모든 컬럼의 데이터 조회하기
select * from emp;


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 컬럼에 별칭(별명) 주기
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- AS로 컬럼에 별칭 부여하기
select job as 노예, ename from emp;

-- AS없이 컬럼에 별칭 부여하기
select job 노예, ename from emp;

-- '' 로 별칭 부여하기
select job `노예`, ename from emp;


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- null 처리를 위해서는 ifnull() 함수를 사용해야 한다
-- @@@@@@@@@@@@@@@@@@@@@@@@
  
-- emp 테이블에서 이름과 mgr 값을 출력하시오. 
-- 단, mgr이 null 이면 0으로 바꾸어 출력하시오.
select ename, ifnull(mgr, 999999999) from emp

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 중복 제거 - DISTINCT
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 중복되는 ename 을 제거하고 ename 만 출력하시오. 18개
select distinct ename from emp;


-- emp 테이블의 deptno 값이 중복되는 것을 제거하여 출력하시오. 17개
select distinct deptno from emp;

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 컬럼 연결,  문자열 연결  
--  concat( 컬럼1  , 컬럼2  ) 
--  concat( 컬럼1  , 컬럼2 , 컬럼3, 컬럼4   ) 
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 김사랑 조회하기

-- '김사랑의 직급은 직원입니다' 출력하기
select concat(ename, '의 직급은 ', job, '입니다') from emp;

-- concat(ename, '의 직급은 ', job, '입니다')


-- '김사랑의 직급은 직원입니다' 출력하는 컬럼이름을 '직급'으로 출력하시오
select concat(ename, '의 직급은 ', job, '입니다') AS `직급` from emp;

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

-- emp 테이블에서 sal이 500보다 크거나 같은 경우만 출력하시오
select * from emp where sal >= 500;
  
-- emp 테이블에서 deptno 가 10 인경우만 출력하시오.
select * from emp where deptno = 10;
 
-- 부정연산( != )
-- deptno 가 10 이 아닌 사람만 출력하시오.
select * from emp where deptno != 10;

 
-- 문제1.
-- ename 이 '이문세'인 경우만 출력
select * from emp where ename='이문세';


-- 문제2.
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

-- deptno 가 10  이고(and) job이 과장인 사람만 출력하시오. 교집합
select * from emp where deptno = 10 and job = '과장';


-- deptno 가 10  이거나(or) job이 과장인 사람만 출력하시오. 합집합
select * from emp where deptno = 10 or job = '과장';



-- 문제. 산술연사자를 이용해서 
-- sal 값이 400보다 크거나 같고 그리고(and) 
-- sal 값이 500보다 작거나 같은 직원을 출력하시오. 5개
select * from emp where sal >= 400 and sal <= 500;

-- 문제. 산술연사자를 이용해서 
-- sal 값이 400보다 작거나 같고 또는(or) 
-- sal 값이 500보다 크거나 같은 직원을 출력하시오. 16개
select * from emp where sal >= 400 or sal <= 500;


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- between A and B 를 이용한 조건 검색 
-- @@@@@@@@@@@@@@@@@@@@@@@@


-- 문제. sal 값이 400보다 크거나 같고 그리고(and) 
-- sal 값이 500보다 작거나 같은 직원을 출력하시오
select * from emp where sal between 400 and 500;


-- 방법1. 산술 연산자를 이용하는 방법5개

-- 방법2. between A and B 를 이용하는 방법



-- 문제. 입사일(hiredate)이 2005/01/01 이전인 사람들만 출력하시오
select * from emp where hiredate < '2005/01/01';


-- 문제. 입사일(hiredate)이 2005/01/01 부터  
-- 2012/12/31 까지 입사한 사람들만 출력하시오
-- 방법1. 비교 연산자를 이용하는 경우
select * from emp where hiredate > '2005/01/01' and hiredate < '2013/01/01';
-- 방법2. between A and B 를 이용해서 
select * from emp where hiredate between '2005/01/01' and '2013/01/01';


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- like를 이용한 조건 검색
-- 와일드카드: % , _
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 이름(ename)이 '이'로 시작하는 직원을 출력하시오. 4개
select * from emp where ename like '이%%';

-- 이름(ename)이 '이'로 끝나는 직원을 출력하시오. 0개
select * from emp where ename like '%%이';

-- 이름(ename)에 '이'가 들어가 있는 직원을 출력하시오. 4개
select * from emp where ename like '%이%';

-- 문제. 이름(ename)에 '성'자가 들어가는 직원을 출력하시오. 3개
select * from emp where ename like '%성%';

-- 문제. 이름(ename)에 '성'자가 들어가지 않는 직원을 출력하시오. 15개
select * from emp where ename not like '%성%';


-- 와일드 카드 "_"를 사용하여 "안성기" 출력
select * from emp where ename like '_성_';

-- 와일드 카드 "_"를 사용하여 "감우성", "조인성" 출력하시오.
select * from emp where ename like '__성';


-- 문제
-- LIKE 'a%'	: 
-- LIKE '%a'	: 
-- LIKE '%or%'	: 
-- LIKE '_r%'	: 1r, 1ra, 2rr
-- LIKE 'a_%_%' : 
-- LIKE 'a%o'	: 


-- @@@@@@@@@@@@@@@@@@@@@@@@
-- in , not in
-- in      연산. or  연산의 축약된 표현
-- not in  연산.
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- or 연산으로
-- comm이 80 이거나 100 이거나 200인 사람만 출력하시오. 2개
select * from emp where comm = 80 or comm = 100 or comm = 200;

-- in 연산으로 
-- comm이 80 이거나 100 이거나 200인 사람만 출력하시오. 2개
select * from emp where comm in(80, 100, 200);

-- comm이 80 이 아니고 그리고 100 이 아니고 그리고 200 이 아닌 사람만 출력하시오. 1개
select * from emp where comm != 80 and comm != 100 and comm != 200;

-- not in 연산으로 
-- comm이 80 이 아니고 그리고 100 이 아니고 그리고 200 이 아닌 사람만 출력하시오. 1개
select * from emp where comm not in(80, 100, 200);



-- @@@@@@@@@@@@@@@@@@@@@@@@
-- is null , is not null
-- =
-- like
-- is null
-- @@@@@@@@@@@@@@@@@@@@@@@@
-- comm 값이  null 인 경우의 출력하시오. 14개
select * from emp where comm is null;

-- comm 값이  null 이 아닌 경우만 출력하시오
select * from emp where comm is not null;


-- ########################
-- 정렬
-- 오름차순 정렬 : asc
-- 내림차순 정렬 : desc
-- ########################

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 오름차순 정렬 : ASC : ascending 
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- sal 컬럼을 오름값순으로 정렬하시오
select * from emp order by comm asc;

-- 이름(ename)을 오름차순으로 출력하시오
select * from emp order by ename asc;

-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 내림차순 정렬 : DESC : descending 
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- sal 컬럼을 내림값순으로 출력하시오
select * from emp order by comm desc;

-- 이름(ename)이 '이병헌'인 직원을 찾아서 
-- sal 값을 기준으로 오름차순 정렬하시오.
select * from emp where ename = '이병헌' order by sal asc;




-- @@@@@@@@@@@@@@@@@@@@@@@@
-- 중복 정렬: 정렬 조건이 2개 인 경우
-- @@@@@@@@@@@@@@@@@@@@@@@@

-- 이름(ename)은 오름차순으로 정렬하고 
-- 입사일(hiredate)은 내림차순으로 정렬하시오     

select * from emp order by ename asc, hiredate desc;


-- 문제. 급여(sal)를 많이 받는 순으로 출력하되 급여가 같으면
--       이름(ename)의 철자가 빠른 순으로 출력하시오.

select * from emp order by sal desc, ename asc;


-- ########################
-- 집합 연산자
-- 합집합: union, union all
-- 교집합: inner join, equip join
-- 차집합: left join, right join
-- ########################

-- GROUP_STAR 데이터 조회. 14개
select * from group_star ;

-- SINGLE_STAR 데이터 조회.7개
select * from single_star ;


-- 중복이 제거된 합집합(union)을 구하시오 : GROUP_STAR , SINGLE_STAR.
select * from group_star union 
select * from single_star;

-- 중복이 포함된 합집합을 구하시오 : GROUP_STAR , SINGLE_STAR.  
select * from group_star union all
select * from single_star;

                                    
-- 교집합 구하기. 공통 부문만 출력 : GROUP_STAR , SINGLE_STAR.  
-- inner join 또는 equip join 사용 
select * from group_star inner join single_star on group_star.NAME = single_star.NICKNAME ;


-- 차집합 구하기 : GROUP_STAR - SINGLE_STAR : 10개 출력
-- left join 사용
select * from group_star left join single_star on group_star.NAME = single_star.NICKNAME WHERE nickname is null;


-- 차집합 구하기 : SINGLE_STAR - GROUP_STAR : 3개 출력
-- left join 사용
select * from single_star left join group_star on group_star.NAME = single_star.NICKNAME where name is null;








-- ########################
-- 미션 1. READ( SELECT )
-- ########################
-- emp테이블에서 직원의 이름과 급여와 입사일만을 출력하시오. 컬럼 3개 출력하기
select ename, sal, hiredate from emp ;

-- 컬럼 이름에 별칭을 붙여 출력하시오.
select ename haha, sal hoho, hiredate hihi from emp ;

-- 직급이 중복되지 않게 한 번씩만 출력하시오
select distinct job from emp ;

-- ########################
-- 미션2. SEARCHING( WHERE )
-- ########################
-- 급여가 300 이하인 직원의 직원번호, 직원 이름, 급여를 출력하기
select empno, ename, sal from emp where sal < 300;

-- 이름이 “오지호”인 직원의 직원번호, 직원명, 급여를 출력하기
select empno, ename, sal from emp where ename = '오지호';

-- 급여가 250이거나 300이거나 500인 직원들의 직원 번호와 직원명과 급여를 출력하시오
select empno, ename, sal from emp where sal in(250, 300, 500) ;

-- 급여가 250이거나 300이거나 500도 아닌 직원들을 검색하기
select empno, ename, sal from emp where sal not in(250, 300, 500) ;

-- ########################
-- 미션3. SORTING(ORDER BY)
-- ########################
-- LIKE 연산자와 와일드 카드를 사용하여 직원들 중에서 이름이 “김”으로 시작하는 사람이나
-- 이름 중에 “기”를 포함하는 직원의 직원번호와 직원이름을 출력하되 최근 입사한 직원 순으로 
-- 직원번호, 직원명, 직급, 입사일 컬럼 만 출력하기
select empno, ename, job, hiredate from emp where ename like "김__" or ename like "%기%" order by hiredate desc;


-- 상관이 없는 직원(사장이 되겠지요!)을 검색하기. mgr 컬럼을 사용하여 쿼리를 작성하시오.
select * from emp where mgr is null;


-- 부서 번호가 빠른 직원부터 출력하되 같은 부서내의 직원을 출력할 경우 
-- 입사한지 가장 오래된 직원부터 출력하기
select * from emp order by deptno asc, hiredate asc;



-- ########################
-- 미션 4.
-- ########################
-- book 테이블의 모든 데이터를 출력하시오
select * from book ;

-- book 테이블에서 bookname,  publisher,  price,  authid   컬럼만 레코드를 출력하시오.
select bookname,  publisher,  price,  authid from book ;


-- book 테이블에서 bookname 컬럼에 SQL 이 들어가 있는 레코드를 출력하시오
select * from book where bookname like "%sql%";

-- bookname 이 SQL로 끝나는 레코드를 출력하시오
select * from book where bookname like "%sql";


-- bookname 이 SQL로 시작하는 레코드를 출력하시오
select * from book where bookname like "sql%";

-- price가 30,700원 이상(크거나 같다)이고
--         50,000원 미만(작다)인 레코드를 출력하시오
select * from book where price >= 30700 and price < 50000;


-- price가 30,700원 이상이고 50,000원 미만인 레코드를 출력하시오.
-- 단, between문을 사용하시오
select * from book where price between 30700 and 50000;


-- bookname의 값이 'JAVA' 이고
-- price 가 30,000 원 이상인 데이터를 찾으시오
select * from book where bookname = 'java' and price > 30000;


-- price가 30,700원 이하(작거나 같다) 이거나 
--         58,000원 초과(크다)인 레코드를 출력하시오
select * from book where price <= 30700 and price > 50000;


-- 레코드를 price 오름차순으로 정렬하시오.
select * from book order by price asc;

-- 레코드를 price 내림차순으로 정렬하시오.
select * from book order by price desc;


-- 레코드를  정렬하시오. publisher 오름차순, price  내림차순
select * from book order by publisher asc, price desc;

-- bookname에 'SQL' 이 들어가는 레코드 중에 price 가 를 내림차순으로 정렬하시오
select * from book where bookname like "%sql%" order by price desc;

