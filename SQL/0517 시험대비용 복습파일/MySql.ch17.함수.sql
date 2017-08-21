-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 함수 : 오브젝트의 일종
--        반드시 반환값이 존재.
--        1) 함수 블록에는 반드시 RETURN문이 있어야 한다.
--        2) 함수는 RETURN 절에 지정된 것과 동일한 datatype으로 RETURN 값을 설정해야 한다.
--        3) 다중 RETURN 문은 사용할 수 있지만 한 번의 호출로는 한 개의 RETURN 문만 실행된다.
--  
-- 함수 종류: 
--        스칼라 함수(한개만 리턴) 
--        테이블 함수(여러개 리턴)
-- 
-- 함수 실행
--        스칼라 함수 실행 : select  함수명(...)
--        테이블 함수 실행 : select  함수명(...)
-- 
-- 함수예제
--        arr_split 만들기 : 스칼라 함수
--        str_split 만들기 : 테이블 함수
--  
-- http://laserbit.tistory.com/entry/오라클-FUNCTION-생성
-- http://www.gurubee.net/lecture/1042
-- http://www.gurubee.net/lecture/2238
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2



-- ###############################
-- 스칼라 함수 
-- ###############################


-- @@@@@@@
-- 스칼라 함수.
-- 입력한 문자열을 반환하는 udf_string_print 함수를 만드시오.
-- 스칼라 함수 생성 : 1개 리턴
-- 매개변수 : 문자열 
-- 스칼라 함수 실행 : SELECT 함수이름() FROM 테이블명;
-- 스칼라 함수 실행 : SELECT 함수이름 ;
-- @@@@@@@



-- @@@@@@@ 
-- 문제. 스칼라 함수, udf_find_dname 를 만드시오.
-- emp 테이블의 empno를 입력하면 dept 테이블의 부서명을 돌려주는 함수를 작성하여라.
-- 
-- 실행 예시: 
--    select udf_find_dname(1001);
-- 
--    select *, (select dname from dept where deptno = emp.deptno) from emp  ;
--    select *, udf_find_dname(???) '부서명' from emp ;
-- @@@@@@@



-- @@@@@@@
-- 문제. 컬럼 존재 여부 체크하는 함수 를 만드시오.
-- udf_col_length('테이블명','컬럼명') 
-- 
-- select * 
--   from information_schema.columns 
--  where table_schema = 'db_name' 
--    and table_name   = 'table_name' 
--    and column_name  = 'column_name' ;  
-- @@@@@@@ 






-- @@@@@@@ 
-- 3개를 리턴 받는 스칼라 함수, emp_disp를 만드오.  
-- EMP 테이블에서 이름을 입력 받아 부서번호,부서명,급여를 검색하는 function을 작성하여라. 
-- 단, 부서번호를 RETURN에 사용하여라.
-- 
-- oracle, mssql 은 가능
-- mysql 은 불가능. mysql에서는 procedure를 사용해야 함.
-- @@@@@@@

-- 스칼라 함수 실행 : select 사용


-- @@@@@@@ 
-- udf_ipconfig 를 만드시오.
-- 
-- client 접속 정보를 출력하는 SQL문
-- select host 
--   into myip
--   from information_schema.PROCESSLIST
--  where id = connection_id()  ;
-- @@@@@@@





-- ###############################
-- 테이블 함수 생성 : 여러개 리턴
--      Table Function
--      Pipelined Table Function
-- 
--      Oracle, MsSQL은 테이블 함수 지원
--      MySQL은 테이블 함수 지원 안됨.
-- ###############################

-- @@@@@@@ 
-- Table Function  생성 : 여러개 리턴
-- oracle, mssql 은 가능
-- mysql 은 불가능.
-- @@@@@@@




-- @@@@@@@ 
-- Table Function  실행 : SELECT 함수이름 ;
-- @@@@@@@ 



-- @@@@@@@ 
-- Pipelined Table Function  생성 : 여러개 리턴
-- @@@@@@@




-- @@@@@@@ 
-- Pipelined Table Function 실행 : SELECT 함수이름 ;
-- @@@@@@@ 




-- ###############################
-- 예제 풀이
-- ###############################


-- @@@@@@@ 
-- 함수예제-arr_split
-- SELECT arr_split('블로그|MSSQL|WEB', '|', 1) ;    
-- 출력 결과: '블로그'
-- @@@@@@@ 



-- @@@@@@@ 
-- 함수예제-str_split
-- select * from dbo.STR_SPLIT(  'a,b,c', ',' ); 
-- 
-- 출력 결과
-- +-------+
-- | value |
-- +-------+
-- | a     |
-- +-------+
-- | b     |
-- +-------+
-- | c     |
-- +-------+
-- 
-- oracle, mssql 은 가능. mysql 은 불가능.
-- @@@@@@@ 

