
-- @@@@@@@@@@@@@@@@@@@@
-- 인덱스
-- 
-- 인덱스 생성
--    1. DDL로
--    2. 툴에서
-- 
-- 테이블의 인덱스 확인하기
-- show index from tablename;
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


-- 기본키와 유니크키의 차이는 무엇인가?
-- -->> null 허용여부 : 기본키는 null을 허용하지 않지만, 유니크키는 null값을 허용함(단한번만 허용)

-- @@@@@@@@@@@@@@@@@@@@
use test;

-- dept01 테이블을 삭제하시오.
DROP TABLE IF EXISTS dept01;


-- dept 테이블을 복제해서 dept01 테이블을 생성하시오.
CREATE TABLE dept01 AS SELECT * FROM dept;
SHOW COLUMNS FROM dept01;

-- dept01 테이블에 pkid 컬럼을 추가히고 auto_increment로 설정하시오. 
ALTER TABLE dept01 MODIFY pid int not null auto_increment primary key;
	
-- dept01 테이블의 인덱스를 출력하는 sql문을 만드시오.
SHOW INDEX FROM dept01;

-- dept01 테이블의 dname 에 인덱스, idx_dname를 생성하시오.
CREATE INDEX idx_dname ON dept01(dname);
SHOW INDEX FROM dept01;

-- dept01에 dname='abc' 값을 갖는 데이터를 2번 insert하여 결과를 확인한다.
-- 에러가 발생하면 그 이유를 찾아보고 해결책을 제시하시오.
SELECT MAX(deptno) INTO @max from dept01;
INSERT INTO dept01(deptno, dname) values (@max+1, 'abc');
-- > 잘 들어간다 (에러가 발생하지 않음)


-- dept01 테이블의 idx_dname 인덱스가 존재한다면 삭제하시오.
DROP INDEX idx_dname ON dept01;
SHOW INDEX FROM dept01;

-- dept01 테이블의 deptno 에 고유 인덱스, idx_deptno  생성하시오.
CREATE unique INDEX idx_deptno ON dept01(deptno);
SHOW INDEX FROM dept01;

-- dept01에 deptno=1000을 갖는 데이터를 2번 insert하여 결과를 확인한다.
-- 에러가 발생하면 그 이유를 찾아보고 해결책을 제시하시오.
INSERT INTO dept01 (deptno) values(1000);
INSERT INTO dept01 (deptno) values(1000);
-- > 에러발생 (유니크인덱스기 때문에 안된다.)

-- dept01 테이블의 idx_deptno 인덱스가 존재한다면 삭제하시오.
DROP INDEX idx_deptno ON dept01;

-- dept01 테이블의 deptno와 dname을 결합하여 고유 인덱스, idx_deptno_dname을 생성하시오.
CREATE unique INDEX idx_deptno_dname ON dept01(deptno, dname);
show index FROM dept01;

-- dept01 테이블의 idx_empno_ename 인덱스가 존재한다면 삭제하시오.
DROP INDEX idx_deptno_dname  ON dept01;
show index FROM dept01;



-- ########################
-- 모든 인덱스를 출력하는 SQL문을 만드시오.
-- list all non-unique indexes
-- ########################
SHOW INDEX FROM dept01;

-- ########################
-- 모든 인덱스를 삭제하는 SQL문을 만드시오.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- drop all non-unique indexes
-- ########################
DROP INDEX ON dept01;



-- @@@@@@@@@@@@@@
-- 미션 13.
-- 1. BOOK 테이블에 BOOKNAME 에 비고유(NONUNIQUE) 인덱스 설정
-- 2. BOOK 테이블의 bookname, year, price 컬럼 3개를 결합해서 고유(UNIQUE) 인덱스 설정
-- @@@@@@@@@@@@@@

CREATE INDEX idx_bookname ON book(bookname);
CREATE INDEX idx_bookname_year_price ON book(bookname, year, price);
SHOW INDEX FROM book;



