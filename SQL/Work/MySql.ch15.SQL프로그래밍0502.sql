-- @@@@@@@@@@@@@@
-- 변수 선언
-- 	User-defined variables (prefixed with @) : sql 쿼리
--		Local Variables (no prefix)  : procedure, function
--		Server System Variables (prefixed with @@)
-- 
-- http://stackoverflow.com/questions/11754781/how-to-declare-a-variable-in-mysql
-- @@@@@@@@@@@@@@


-- @@@@@
-- User-defined variables (prefixed with @) : sql 쿼리
-- @@@@@

SET @start := 1, @finish := 10;
select @start, @finish;

select @start := 1, @finish := 10;


select max(empno), min(empno) into @max, @min FROM emp;
select @max, @min;
-- 위 세번째 방식이 가장 많이 사용된다.

select @max := max(empno), @min := min(empno) FROM emp;



-- @@@@@
-- Local Variables (no prefix)  : procedure, function
-- @@@@@
delimiter $$
	drop procedure if exists usp_test $$
	create procedure usp_test( var1 int)
	begin
		declare start int $$
		declare end int $$
		
		select var1, start, end $$
	end $$
delimiter ;


delimiter $$
	begin
		select 'hello world';
	end $$
delimiter ;


-- @@@@@
-- Server System Variables (prefixed with @@)
-- @@@@@  -- 잘 안쓴다
show variables like '%timeout%';
select @@collation_connection;
select @@autocommit;  -- > 1 (true) 이다.


-- @@@@@@@@@@@@@@
-- sql 문에서의 연속if

-- @@@@@@@@@@@@@@


-- @@@@@@@@@@@@@@
-- SQL에서의 선택문
--      if
--      case when then
--      ifnull
-- @@@@@@@@@@@@@@

-- @@@@@
-- if 문
-- 형식 : if ( 조건문, 참일때 값, 거짓일때 값)
-- 
-- 설명 - 멤버 테이블에서 아이디(member_id) 와 생일을 뽑는데 null 일경우는 - 를 출력, 아니면 생일을 출력
-- @@@@@
select empno, if (isnull(comm), -100, comm) FROM emp;


-- @@@@@ 
-- case 문
-- 형식 :  case (조건 또는 값)
--             when 값1 then 표시값
--             when 값2 then 표시값
--             else 표시값
--         end
-- 
-- 설명 - a 값이 '1'이면 a, '2' 이면 b, 둘다 아닐경우 c 를 출력
-- @@@@@
select empno, case job when '부장' then sal * 1.1
								when '과장' then sal * 1.2
								else salary
						end
from emp;


-- @@@@@
-- ifnull문 ( mysql 에서 사용 )
-- 형식 : ifnull ( 값1, 값2)
-- 설명 - price 값이 null 이면 0을, null 이 아니면 price 값을 출력
-- @@@@@

select empno, ifnull( comm, 0) from emp;
