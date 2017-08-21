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
--		  스칼라 함수 실행 : select 
--		  테이블 함수 실행 : select  
-- 
-- 함수예제
--		  arr_split 만들기 : 스칼라 함수
--		  str_split 만들기 : 테이블 함수
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
-- 스칼라 함수 실행 : SELECT 함수이름() FROM 테이블명;
-- 스칼라 함수 실행 : SELECT 함수이름 ;
-- @@@@@@@
delimiter $
	drop function if exists udf_string_print $
	create function udf_string_print(str nvarchar(1000))
	returns nvarchar(1000)
	begin
		declare str_copy nvarchar(1000) $
		
		set str_copy := str $
		return str_copy $
	end $
delimiter ;

select udf_string_print('haha');

select *, udf_string_print(ename) from emp;



-- @@@@@@@ 
-- 스칼라 함수. udf_find_dname 을 만들어라.
-- emp 테이블의 empno를 입력하면 dept 테이블의 부서명을 돌려주는 함수를 작성하여라.
-- udf_find_dname(1001);
-- @@@@@@@
delimiter $
	drop function if exists udf_find_dname $
	create function udf_find_dname(str int)
	returns nvarchar(1000)
	begin
		declare find_dname nvarchar(1000) $
		select dname into find_dname from dept inner join emp on dept.DEPTNO = emp.deptno where emp.empno = str $
		return find_dname $
	end $
delimiter ;
select *, udf_find_dname(1001) from emp where empno = 1001;


delimiter $
	drop function if exists udf_find_dname $
	create function udf_find_dname(str int)
	returns nvarchar(1000)
	begin
		declare find_dname nvarchar(1000) $
		set find_dname := (select dname from dept where deptno = (select deptno from emp where empno = str)) $
		return find_dname $
	end $
delimiter ;

select *, udf_find_dname(1001) from emp where empno = 1001;


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

delimiter $$
	drop procedure if exists udf_col_length $$
	create procedure udf_col_length(a nvarchar(100)  -- 필수 입력
											, b nvarchar(100)  -- 필수 입력
											, c nvarchar(100)) -- 선택 입력
	returns int
	begin
		declare exist int $$

		if a is null then 
			set a := database() $$
		elseif a = '' then
			set a := database() $$
		else 
			set a := a $$				
		end if $$
			
		SELECT if(count(*) >= 1, true, false) 
			into exist
			from information_schema.columns
			where table_schema = a
			and table_name = b
			and column_name = c $$
		return exist $
	end $$
delimiter ;

select udf_col_length('emp', 'empno', 'test' );




-- delimiter $$
-- 	drop procedure if exists refactor_table $$
-- 	create procedure refactor_table()
-- 	begin
-- 		if udf_col_length('emp', 'comm', 'test') = 1 then
-- 			alter table drop column comm 
-- 		end if
-- 		if udf_col_length('emp', 'comm', 'test') = 0 then		
-- 			alter table ADD column comm decimal(10, 5) null;
-- 		end if
-- 	end $$
-- delimiter ;




-- ###############################
-- 테이블 함수 생성 : 여러개 리턴
--		Table Function
--		Pipelined Table Function
-- 
--      Oracle은 테이블 함수 지원
--      MsSQL은 테이블 함수 지원
--      MySQL은 테이블 함수 지원 안됨.
-- ###############################

-- @@@@@@@ 
-- Table Function  생성 : 여러개 리턴
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




-- @@@@@@@ 
-- 함수예제-arr_split
-- @@@@@@@ 
delimiter $
	drop function if exists arr_split $
	create function arr_split(str VARCHAR(500), del VARCHAR(2), idx INT )
	returns varchar(500)
	begin
		return SUBSTR(SUBSTRING_INDEX(str, del, idx),LENGTH(SUBSTRING_INDEX(str, del, idx-1))+IF(idx > 1, 2, 1));
	end $
delimiter ;

select arr_split('show me the money',' ',4) ;


-- @@@@@@@ 
-- 함수예제-str_split
-- @@@@@@@ 






