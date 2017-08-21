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
--      3. 결과 반환 받는 프로시저 만들기
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
-- helloworld 프로시저를 만드시오.




-- ########################
-- 변수 선언
-- declare  변수명  변수타입;
-- ########################

-- variable_demo 프로시저를 만드시오.




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
-- 반복문
-- 
-- while search_condition do
--    statement_list
-- end while 
-- @@@@@

-- 저장 프로시져 안에 간단한 루프. simple_loop 프로시저를 만드시오.




-- 문제. del_all 프로시저를 만드시오.
-- 



-- ########################
-- 매개변수가 있는 프로시저 만들기
-- 
-- MySQL에서 파라미터는 IN, OUT, INOUT을 정의할 수 있다.
-- IN    : read-only
-- INOUT : read-write
-- OUT   : write-only
-- ########################


-- usp_test 를 만드시오.


-- usp_sqrt 를 만드시오.



-- 문제. 매개변수로 넘겨진 ename을 emp 테이블에서 찾아서 delete하는 usp_del_ename 프로시저를 만드시오.
--       usp_del_ename 프로시저를 이용하여 '김사랑'을 삭제하시오.



-- 문제. 아래의 외래키를 조회하는 sql문을 프로시저로 만드시오.
-- http://stackoverflow.com/questions/4004205/mysql-show-constraints-on-tables-command
-- 
-- select
--     table_name,column_name,referenced_table_name,referenced_column_name
-- from
--     information_schema.key_column_usage
-- where referenced_table_name is not null
--   and table_schema = 'test' 
--   and table_name = 'assign'


-- ########################
-- 모든 인덱스를 출력하는 SQL문을 만드시오.
-- list all non-unique indexes
-- ########################
-- SELECT table_name AS `Table`,
--        index_name AS `Index`,
--        GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
-- FROM information_schema.statistics
-- WHERE NON_UNIQUE = 1 AND table_schema = 'test' AND table_name = 'emp'
-- GROUP BY 1,2;


-- ########################
-- 테이블의 인덱스를 삭제하는 SQL문을 만드시오.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- drop all non-unique indexes
-- ########################
-- SET SESSION group_concat_max_len=10240;
-- 
-- SELECT CONCAT('ALTER TABLE ', `Table`, ' DROP INDEX ', GROUP_CONCAT(`Index` SEPARATOR ', DROP INDEX ') )
-- FROM (
-- SELECT table_name AS `Table`,
--        index_name AS `Index`
-- FROM information_schema.statistics
-- WHERE NON_UNIQUE = 1 AND table_schema = 'test' AND table_name = 'emp'
-- GROUP BY `Table`, `Index`) AS tmp
-- GROUP BY `Table`;






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

-- usp_sqrt 프로시저를 만드시오.


-- discounted_price 프로시저를 만드시오.



-- @@@@@@@
-- 문제. empno를 인자로 넘기면 ename, sal, job 을 돌려 받는 프로시저, sel_empno를 만드시오.
-- 되돌려 받아야 하는 매개변수에는 out을 지정한다.
-- @@@@@@@








-- @@@@@@@
-- 문제. 컬럼 존재 여부 체크하는 프로시저 를 만드시오.
--       usp_col_length('데이터베이스명', '테이블명','컬럼명') 
-- @@@@@@@
-- ------------------------------------------------------------
-- Use the inforamtion_schema to tell if a field exists.
-- Optional param dbName, defaults to current database
-- ------------------------------------------------------------





-- ########################
-- 프로시저에서 프로시저 콜하기
-- ########################


-- 저장 프로시저에서 또 다른 저장 프러시저 호출

 

-- 문제. TRANS_EMP --> SEL_EMPNO, DEL_ENAME 호출 




-- ########################
-- cursor를 이용하는 프로시저 만들기 
-- ########################


-- @@@@@@@
-- 문제. cursor_sample01을 만드시오.
-- @@@@@@@
 

-- @@@@@@@
-- 문제. 모든 인덱스를 출력하는 프로시저를 만드시오.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- @@@@@@@



-- @@@@@@@
-- 문제. 모든 인덱스를 삭제하는 프로시저를 만드시오.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- @@@@@@@




-- ########################
-- InsertUpdate 프로시저 vs MERGE 구문
-- ########################



-- ########################
--  MERGE 구문
-- ########################

