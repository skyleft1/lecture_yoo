-- ########################
-- 프로시저 만들기
-- 
-- sql 프로그래명
--  1. 변수 선언
--  2. 선택문
--  3. 반복문
-- 
-- 프로시저 종류
--  1. 매개변수 없는 프로시저 만들기
--  2. 매개변수 있는 프로시저 만들기
--  3. 결과 반환 받는 프로시저 만들기
-- 
-- 프로시저 매개변수 : 프로시저의 파라미터는 IN, OUT, INOUT을 정의할 수 있다.
--  IN    : read-only
--  INOUT : read-write
--  OUT   : write-only
--  입력되어야 하는 매개변수에는 in을 사용하나 in을 생략 할 수 있다.
--  되돌려 받아야 하는 매개변수에는 out이나 inout을 지정한다.
-- 
-- 프로시저 실행하기
--  1. call 로 프로시저 실행
--  2. 프로시저에서 프로시저 실행 
-- 
-- http://m.egloos.zum.com/it79/v/1032459
-- http://thesunrises.tistory.com/m/511
-- ########################



-- ########################
-- 매개변수 없는 프로시저 만들기
-- ########################
-- 'hello' 출 출력하는 helloworld 프로시저를 만드시오.




-- ########################
-- 프로시저 안에서 변수 선언
-- declare  변수명  변수타입;
-- ########################

-- variable_demo 프로시저를 만드시오.
-- 지역변수 my_integer를 만들고 20 대입하고 my_integer 값을 출력하시오.


-- ########################
-- 선택문
-- 
-- if search_condition then statement_list
-- [elseif search_condition then statement_list]
-- [elseif search_condition then statement_list]
-- ...
-- [else statement_list]
-- end if
-- ########################

-- @@@@@
-- simplecompare 프로시저를 만드시오.
-- 매개변수 n --> int
-- 매개변수 m --> int
-- 출력: call simplecompare(1,2);
-- n > m ==> large, n<m ==> small 출력
-- +------+------+-------+
-- | n    | m    | s     |
-- +------+------+-------+
-- |    1 |    2 | small |
-- +------+------+-------+
-- @@@@

-- @@@@@
-- 반복문
-- 
-- cursor에서 주로 사용됨.
-- 
-- WHILE search_condition DO
--    statement_list
--    statement_list
--    statement_list
-- END WHILE
-- @@@@@

-- @@@@
-- simple_loop 프로시저를 만드시오.
-- 저장 프로시져 안에 간단한 루프.
-- 매개변수는 없다
-- 프로시저 내의 정수 변수: counter만들고 기본값을 0으로 설정.
-- counter가 10이 될 때까지 counter 를 1씩 증가시키면서 counter 값을 출력하시오.
-- @@@@



-- @@@@
-- 문제. emp 테이블의 모든 데이터를 삭제하는 del_all 프로시저를 만드시오.
-- delete from emp;
-- @@@@


-- 매개변수 1개를 입력 받고 입력 받은 값을 출력하는 usp_test 프로시저를 만드시오.



-- @@@@@
-- 문제. 값을 입력 받고 제곱근을 구하는 usp_sqrt_in 프로시저를 만드시오.
-- MySQL 내장 함수 sqrt 를 사용하면 됩니다.
-- @@@@


-- @@@@
-- 문제. 매개변수로 넘겨진 ename을 emp 테이블에서 찾아서 delete하는 usp_del_ename 프로시저를 만드시오.
--       usp_del_ename 프로시저를 이용하여 '김사랑'을 삭제하시오.
-- @@@@


-- @@@@
-- 문제. 외래키를 조회하는 usp_foreignkey 프로시저를 만드시오.
--       매개변수 2개 사용. 
--       첫번째 매개변수는 데이터베이스이름.
--       두번째 매개변수는 테이블이름.
-- 
-- 외래키를 조회하는 SQL 문.
--       select
--             table_name,column_name,referenced_table_name,referenced_column_name
--       from
--             information_schema.key_column_usage
--       where referenced_table_name is not null
--         and table_schema = 'test' 
--         and table_name = 'assign'
-- 
-- 실행
--  call usp_foreignkey('test', 'emp'); --> test 디비의 emp 테이블의 외래키 정보가 출력
--  +------------+-------------+-----------------------+------------------------+
--  | table_name | column_name | referenced_table_name | referenced_column_name |
--  +------------+-------------+-----------------------+------------------------+
--  | emp        | DEPTNO      | dept                  | DEPTNO                 |
--  +------------+-------------+-----------------------+------------------------+
--  
--  call usp_foreignkey('test', ''   ); --> test 디비의 모든  외래키 정보가 출력
--  +------------+-------------+-----------------------+------------------------+
--  | table_name | column_name | referenced_table_name | referenced_column_name |
--  +------------+-------------+-----------------------+------------------------+
--  | assign     | emp_no      | employee              | emp_no                 |
--  | assign     | pro_no      | project               | pro_no                 |
--  | book       | authid      | auth                  | authid                 |
--  | emp        | DEPTNO      | dept                  | DEPTNO                 |
--  | specialty  | emp_no      | employee              | emp_no                 |
--  +------------+-------------+-----------------------+------------------------+
--  
--  call usp_foreignkey('test', null ); --> test 디비의 모든  외래키 정보가 출력
--  +------------+-------------+-----------------------+------------------------+
--  | table_name | column_name | referenced_table_name | referenced_column_name |
--  +------------+-------------+-----------------------+------------------------+
--  | assign     | emp_no      | employee              | emp_no                 |
--  | assign     | pro_no      | project               | pro_no                 |
--  | book       | authid      | auth                  | authid                 |
--  | emp        | DEPTNO      | dept                  | DEPTNO                 |
--  | specialty  | emp_no      | employee              | emp_no                 |
--  +------------+-------------+-----------------------+------------------------+
-- 
-- @@@@
  
  
-- ########################
-- 모든 인덱스를 출력하는 usp_indexall 프로시저를 만드시오.
-- 매개변수 2개 사용. 
--   첫번째 매개변수는 데이터베이스이름.
--   두번째 매개변수는 테이블이름.
--  
-- SELECT table_name AS `Table`,
--        index_name AS `Index`,
--        GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
-- FROM information_schema.statistics
-- WHERE NON_UNIQUE = 1 
--   AND table_schema = 'test' 
--   AND table_name   = 'emp'
-- GROUP BY 1, 2;
-- 
-- 실행
--  call usp_indexall('test', 'emp'); --> test 디비의 emp 테이블의 인덱스 정보가 출력  
--  call usp_indexall('test', ''   ); --> test 디비의 모든 인덱스 정보가 출력  
--  call usp_indexall('test', null ); --> test 디비의 모든 인딕스 정보가 출력
-- ########################


-- ########################
-- 테이블의 인덱스를 삭제하는 usp_indexdrop 프로시저를 만드시오.
-- drop all non-unique indexes
-- 1. drop index 쿼리문 임시테이블 insert
-- 2. 커서를 이용한 동적 쿼리 실행
-- 
-- set session group_concat_max_len=10240;
-- 
-- select concat('alter table ', `table`, ' drop index ', group_concat(`index` separator ', drop index ') )
-- from (
-- select table_name as `table`,
--        index_name as `index`
-- from information_schema.statistics
-- where non_unique   = 1 
--   and table_schema = 'test' 
--   and table_name   = 'emp'
-- group by `table`, `index`) as tmp
-- group by `table`;
-- ########################





-- ########################
-- 결과를 반환 받는 프로시저 만들기 
-- 
-- MySQL에서 파라미터는 IN, OUT, INOUT을 정의할 수 있다.
-- IN    : read-only
-- INOUT : read-write
-- OUT   : write-only
-- 
-- 되돌려 받아야 하는 매개변수에는 out을 지정한다.
-- ########################

-- @@@@@
-- 값을 입력 받고 제곱근을 구하여 결과를 리턴하는 usp_sqrt_out 프로시저를 만드시오.
-- MySQL 내장 함수 sqrt 를 사용하면 됩니다.
-- IN 매개변수   : inum, 타입은 실수로
-- OUT 매개변수  : onum, 타입은 실수로
-- @@@@



-- @@@@@
-- INOUT 매개변수를 사용하여 
-- 값을 입력 받고 제곱근 결과를 리턴하는 usp_sqrt_inout 프로시저를 만드시오.
-- MySQL 내장 함수 sqrt 를 사용하면 됩니다.
-- INOUT 매개변수   : num, 타입은 실수로
-- @@@@



-- @@@@@@@
-- 문제. empno를 인자로 넘기면 ename, sal, job 을 돌려 받는 프로시저, sel_empno를 만드시오.
-- in  매개변수: empno 값은 1001부터 1010 사이의 임의의 값을 사용하시고,
-- out 매개변수: ename, sal, job 을 되돌려 받아 값을 출력하시오. 
-- @@@@@@@



-- @@@@@@@
-- 문제. 컬럼 존재 여부 체크하는 프로시저 를 만드시오.
--       usp_col_length('데이터베이스명', '테이블명', '컬럼명') ;
-- 
-- 반환값 : 컬럼이 존재하면 1 반환
--          컬럼이 존재하지 않으면 0 반환
-- 
-- 컬럼 존재 여부를 조회하는 SQL문.
-- select * 
--   from information_schema.columns 
--  where table_schema = 'db_name' 
--    and table_name   = 'table_name' 
--    and column_name  = 'column_name' ; 
-- @@@@@@@



-- ########################
-- 프로시저에서 프로시저 콜하기
-- ########################

-- usp_callproc 프로시저를 만드시오.
-- 저장 프로시저에서 또 다른 저장 프러시저 호출
-- 첫번째 매개변수가 0이면 usp_foreignkey('test', 'emp') 를 호출
-- 첫번째 매개변수가 1이면 usp_indexall('test', 'emp') 를 호출




-- ########################
-- cursor를 사용하는 프로시저 cursor_example을 만드시오.
-- 1. 커서 declare
-- 2 .커서 open
-- 3. 커서 fetch
-- 4. 커서 close
-- ########################




-- ########################
-- InsertUpdate 프로시저 vs MERGE 구문
-- ########################

-- @@@@@
-- 문제. usp_emp_insertupdate 프로시저를 만드시오.
-- emp 테이블에 매개변수로 넘겨진 empno 데이터가 없으면 insert,
--                                empno 데이터가 있으면 update.
-- 
-- 매개변수
--   vempno     int 
--   vename     nvarchar(20)
--   vjob       nvarchar(20)
--   vdeptno    int
-- @@@@@



-- @@@@@
-- 문제. usp_emp_merge 프로시저를 만드시오.
--  emp 테이블에 매개변수로 넘겨진 empno 데이터가 없으면 insert,
--                                 empno 데이터가 있으면 update.
--  MERGE 구문 사용
-- @@@@@

