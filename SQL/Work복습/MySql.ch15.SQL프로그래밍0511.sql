-- @@@@@@@@@@@@@@
-- 변수 선언
-- 	User-defined variables (prefixed with @) 	: sql 쿼리
--	Local Variables (no prefix) 					: procedure, function
--	Server System Variables (prefixed with @@)
-- 
-- http://stackoverflow.com/questions/11754781/how-to-declare-a-variable-in-mysql
-- @@@@@@@@@@@@@@


-- @@@@@
-- User-defined variables (prefixed with @) : sql 쿼리
-- @@@@@


-- @@@@@
-- Server System Variables (prefixed with @@)
-- @@@@@


-- @@@@@
-- Local Variables (no prefix, declare)  : procedure, function
-- @@@@@


-- @@@@@@@@@@@@@@
-- SQL에서의 선택문
--      ifnull
--      if
--      case when then
select empno, if(comm is null, -100000, comm) from emp;

select empno, ifnull(comm, -550) from emp;

select empno, case job when '과장' then sal * 0.9
							when '부장' then sal * 0.8
						else sal
						end
from emp;


-- @@@@@@@@@@@@@@

-- @@@@@
-- ifnull문 ( mysql 에서 사용 )
-- 형식 : ifnull ( 값1, 값2)
-- 설명 - price 값이 null 이면 0을, null 이 아니면 price 값을 출력
-- @@@@@


-- @@@@@
-- if 문
-- 형식 : if ( 조건문, 참일때 값, 거짓일때 값)
-- 
-- 설명 - 멤버 테이블에서 아이디(member_id) 와 생일을 뽑는데 null 일경우는 - 를 출력, 아니면 생일을 출력
-- @@@@@


-- @@@@@ 
-- sql문에서의 연속if 
-- 
-- case 문
-- 형식 :  case (조건 또는 값)
--             when 값1 then 표시값
--             when 값2 then 표시값
--             else 표시값
--         end
-- 
-- 설명 - a 값이 '1'이면 a, '2' 이면 b, 둘다 아닐경우 c 를 출력
-- @@@@@
