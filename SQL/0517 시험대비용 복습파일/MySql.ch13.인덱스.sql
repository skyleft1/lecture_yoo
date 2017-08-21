-- @@@@@@@@@@@@@@@@@@@@
-- 인덱스
-- 
-- 인덱스 생성
--    1. DDL로
--    2. 툴에서
-- 
-- 테이블의 인덱스 확인하기
-- 	show index from tablename;
-- 
-- 테이블의 인덱스 삭제하기
-- 	drop index 인덱스명;
-- 
-- 테이블의 인덱스 추가하기 : 컬럼은 2개 이상도 가능
-- 	인덱스 이름 작명 규칙: 테이블명_idx_컬럼명
-- 	인덱스를 사용해야 할 컬럼은 where 에서 사용되는 컬럼들중 빈도가 많은 컬럼에 ..
-- 	create index 인덱스명 on 테이블명( 칼럼명1, 칼럼명2, ... );
-- 
-- unique 인데스 생성하기
-- 	고유 인덱스 생성 : Unique 조건, 기본키(primary key) 
-- 	고유 인덱스는  Unique 조건과 같은 것이다.
-- 	create unique index 인덱스명 on 테이블명( 칼럼명1, 칼럼명2, ... );
-- 
-- 테이블의 인덱스 수정하기
 
-- 기본키(primary key)로 설정하면 자동으로 인덱스가 생성된다.
-- 
-- 기본키와 unique key(unique index) 의 차이점은 ?
-- 	null 허용 여부
--    기본키: null 불허
--    unique key : null 한번 허용
-- @@@@@@@@@@@@@@@@@@@@


-- dept01 테이블을 삭제하시오.

-- dept 테이블을 복제해서 dept01 테이블을 생성하시오.


-- dept01 테이블에 pkid 컬럼을 추가히고 auto_increment로 설정하시오. 

-- dept01 테이블의 인덱스를 출력하는 sql문을 만드시오.

-- dept01 테이블의 dname 컬럼에 인덱스, idx_dname를 생성하시오.


-- dept01에 dname='abc' 값을 갖는 데이터를 2번 insert하여 결과를 확인한다.
-- 에러가 발생하면 그 이유를 찾아보고 해결책을 제시하시오.


-- dept01 테이블의 idx_dname 인덱스가 존재한다면 삭제하시오.

-- dept01 테이블의 deptno 에 unique 인덱스, idx_deptno  생성하시오.


-- dept01에 deptno=1000을 갖는 데이터를 2번 insert하여 결과를 확인한다.
-- 에러가 발생하면 그 이유를 찾아보고 해결책을 제시하시오.

-- dept01 테이블의 idx_deptno 인덱스가 존재한다면 삭제하시오.


-- @@@@@
-- 문제. dept01 테이블의 deptno와 dname을 결합하여 고유 인덱스, idx_deptno_dname을 생성하시오.
-- @@@@@



-- @@@@@
-- 문제. dept01 테이블의 idx_empno_ename 인덱스가 존재한다면 삭제하시오.
-- @@@@@



-- @@@@@
-- 문제. 모든 인덱스를 출력하는 SQL문을 만드시오.
-- list all non-unique indexes
-- @@@@@


-- @@@@@
-- 문제. 테이블의 모든 인덱스를 삭제하는 SQL문을 만드시오.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- drop all non-unique indexes
-- @@@@@






-- ########################
-- 미션 13.
-- 1. book 테이블에 bookname 에 비고유(nonunique) 인덱스 설정
-- 2. book 테이블의 bookname, year, price 컬럼 3개를 결합해서 고유(unique) 인덱스 설정
-- ########################
