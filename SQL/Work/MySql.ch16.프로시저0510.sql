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

delimiter $$
	drop procedure if exists hello $$
	create procedure hello ()

	begin
		select 'hello' $$
	end $$	
delimiter ;

call hello();


-- ########################
-- 프로시저 안에서 변수 선언
-- declare  변수명  변수타입;
-- ########################

-- variable_demo 프로시저를 만드시오.
-- my_integer 변수에 20 대입하시오.


delimiter $$
	drop procedure if exists variable_demo $$
	create procedure variable_demo ()

	begin
		declare my_integer int $$
		set my_integer := 20 $$
		select my_integer, 'hahaha' $$
	end $$	
delimiter ;

call variable_demo();


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
-- +------+------+-------+
-- | n    | m    | s     |
-- +------+------+-------+
-- |    1 |    2 | small |
-- +------+------+-------+
-- @@@@

delimiter $$
	drop procedure if exists simplecompare $$
	create procedure simplecompare(n int, m int)
	
	begin
		declare s varchar(100) $$
		
		if (n < m)  then	set s := 'small' $$
		elseif (n > m)  then	set s := 'large' $$
		else 			set s := 'same' $$
		end if $$

		select n, m, s $$

	end $$

delimiter ;

call simplecompare(1, 2) ;



-- @@@@@
-- 반복문
-- 
-- WHILE search_condition DO
--    statement_list
--    statement_list
--    statement_list
-- END WHILE
-- @@@@@

-- @@@@
-- 저장 프로시져 안에 간단한 루프. simple_loop 프로시저를 만드시오.
-- 매개변수는 없다
-- 프로시저 내의 변수: counter  정수
-- @@@@
delimiter $$
	drop procedure if exists simple_loop $$
	create procedure simple_loop()
	
	begin
		declare counter int default 0 $$
		
		while counter < 10 do
			select counter $$
			set counter := counter + 1 $$
		end while $$

	end $$

delimiter ;

call simple_loop() ;




-- @@@@
-- 문제. emp 테이블의 모든 데이터를 삭제하는 del_all 프로시저를 만드시오.
-- delete from emp;
-- @@@@
delimiter $$
	drop procedure if exists del_all $$
	create procedure del_all()
	
	begin
		delete from empex1 $$

	end $$

delimiter ;

call del_all() ;


-- 매개변수 1개를 입력 받고 입력 받은 값을 출력하는 usp_test 프로시저를 만드시오.
delimiter $$
	drop procedure if exists usp_test $$
	create procedure usp_test(a varchar(200))
	
	begin
		select a $$

	end $$

delimiter ;

call usp_test('haha') ;


-- @@@@@
-- 문제. 값을 입력 받고 제곱근을 구하는 usp_sqrt 프로시저를 만드시오.
-- MySQL 내장 함수 sqrt 를 사용하면 됩니다.
-- @@@@
delimiter $$
	drop procedure if exists usp_sqrt $$
	create procedure usp_sqrt(a int)
	
	begin
		select sqrt(a) $$

	end $$

delimiter ;

call usp_sqrt(16) ;



-- @@@@
-- 문제. 매개변수로 넘겨진 ename을 emp 테이블에서 찾아서 delete하는 usp_del_ename 프로시저를 만드시오.
--       usp_del_ename 프로시저를 이용하여 '김사랑'을 삭제하시오.
-- @@@@
delimiter $$
	drop procedure if exists usp_del_ename $$
	create procedure usp_del_ename(a varchar(100))
	
	begin
		delete from empex1 where ename = a $$

	end $$

delimiter ;

call usp_del_ename('김사랑') ;




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
delimiter $$
	drop procedure if exists usp_foreignkey $$
	create procedure usp_foreignkey(col_db_name varchar(100), col_table_name varchar(100))
	
	begin
		select table_name,column_name,referenced_table_name,referenced_column_name
		from information_schema.key_column_usage
		where referenced_table_name is not null
				and table_schema = col_db_name 
				and table_name = if(ifnull(col_table_name, '' )= '', table_name, col_table_name) $$
				--     컬럼                    변수                  컬럼        변수
	end $$
delimiter ;

call usp_foreignkey('test', 'emp') ;
call usp_foreignkey('test', 'assign') ;
call usp_foreignkey('test', '') ;
call usp_foreignkey('test', null) ;

ifnull(tablename, '') ---> tablename 또는 '' 를 의미

select * from emp where 1 = 1;
select * from emp where 1 = 2;

select * from emp where empno = empno;
select * from emp where empno = deptno;
  

-- ########################
-- 모든 인덱스를 출력하는 usp_indexall 프로시저를 만드시오.
-- list all non-unique indexes
-- 
-- SELECT table_name AS `Table`,
--        index_name AS `Index`,
--        GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
-- FROM information_schema.statistics
-- WHERE NON_UNIQUE = 1 AND table_schema = 'test' AND table_name = 'emp'
-- GROUP BY 1, 2;
-- ########################
delimiter $$
	drop procedure if exists usp_indexall $$
	create procedure usp_indexall(col_db_name varchar(100), col_table_name varchar(100))
	
	begin
		select table_name AS `Table`,
					index_name AS `Index`,
					GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
		from information_schema.statistics
		where NON_UNIQUE = 1 
			AND table_schema = col_db_name 
		 	AND table_name = if(ifnull(col_table_name, '') = '', table_name, col_table_name)
		GROUP BY 1, 2 $$
	end $$
delimiter ;

call usp_indexall('test', 'emp') ;
call usp_indexall('test', '') ;


-- ########################
-- 테이블의 인덱스를 삭제하는 usp_indexdrop 프로시저를 만드시오.
-- drop all non-unique indexes
-- 1. drop index 쿼리문 임시테이블 insert
-- 2. 커서를 이용한 동적 쿼리 실행
-- 
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
delimiter $$
	drop procedure if exists usp_indexdrop $$
	create procedure usp_indexdrop(col_db_name varchar(100), col_table_name varchar(100))
	
	begin
		select CONCAT('ALTER TABLE ', `Table`, ' DROP INDEX ', GROUP_CONCAT(`Index` SEPARATOR ', DROP INDEX ') )
		from (SELECT table_name AS `Table`, index_name AS `Index`
		from information_schema.statistics
		WHERE NON_UNIQUE = 1 
			AND table_schema = col_db_name
			AND table_name = if(ifnull(col_table_name, '') = '', table_name, col_table_name)
			GROUP BY (`Table`, `Index`) AS tmp
			GROUP BY `Table` $$
	end $$
delimiter ;


call usp_indexdrop('test', 'emp') ;




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



-- 값을 입력받고 제곱근을 구하여 리턴하는 usp_sqrt 프로시저를 만드시오.
-- in 매개변수 : inum, 타입은 실수
-- out 매개변수 : onum , 타입은 실수

delimiter $$
	drop procedure if exists usp_sqrt $$
	create procedure usp_sqrt(in inum decimal(5,3), out onum decimal(10,5))
	
	begin
		set onum := sqrt(inum) $$
	end $$
delimiter ;

call usp_sqrt(16, @out_value) ;
select @out_value ;


-- inout 으로 바꿔보자
delimiter $$
	drop procedure if exists usp_sqrt2 $$
	create procedure usp_sqrt2(inout num decimal(5,3))
	
	begin
		set num := sqrt(num) $$
	end $$
delimiter ;

set @out_value := 3;
call usp_sqrt2(@out_value) ;
select @out_value ;


-- discounted_price 프로시저를 만드시오.


-- @@@@@@@
-- 문제. empno를 인자로 넘기면 ename, sal, job 을 돌려 받는 프로시저, sel_empno를 만드시오.
-- 되돌려 받아야 하는 매개변수에는 out을 지정한다.
-- @@@@@@@
delimiter $$
	drop procedure if exists sel_empno $$
	create procedure sel_empno(inout p_empno int)
	
	begin
		set p_empno := p_empno $$
	end $$
delimiter ;


set @empno := 1010;
call sel_empno(@empno) ;
select ename, sal, job from emp WHERE empno = @empno;





-- @@@@@@@
-- 문제. 컬럼 존재 여부 체크하는 프로시저 를 만드시오.
--       usp_col_length('데이터베이스명', '테이블명','컬럼명') 
-- @@@@@@@
-- ------------------------------------------------------------
-- Use the inforamtion_schema to tell if a field exists.
-- Optional param dbName, defaults to current database
-- ------------------------------------------------------------
delimiter $$
	drop procedure if exists usp_col_length $$
	create procedure usp_col_length(a varchar(100), b varchar(100), c varchar(100))
	
	begin
		SELECT exists (select c
			FROM b 
			WHERE table_schema = a) $$
	end $$
delimiter ;


call usp_col_length('test', 'emp', 'sal') ;

		SELECT exists (select sal from emp);


-- @@@@@@@
-- 문제. 컬럼 존재 여부 체크하는 프로시저 를 만드시오.
-- usp_col_length('데이터베이스명', '테이블명', '컬럼명') ;
-- 
-- 반환값 : 컬럼이 존재하면 true 반환
-- 컬럼이 존재하지 않으면 false 반환
-- 
-- 컬럼 존재 여부를 조회하는 SQL문.
-- select *
-- from information_schema.columns
-- where table_schema = 'db_name'
-- and table_name = 'table_name'
-- and column_name = 'column_name' ;
-- @@@@@@@
delimiter $$
	drop procedure if exists usp_col_length $$
	create procedure usp_col_length(a nvarchar(100)  -- 필수 입력
											, b nvarchar(100)  -- 필수 입력
											, c nvarchar(100)) -- 선택 입력
	
	begin
		-- set a := if(ifnull(a, '') = '', database(), a ) $$
		if a is null then 
			set a := database() $$
		elseif a = '' then
			set a := database() $$
		else 
			set a := a $$				
		end if $$
			
		SELECT if(count(*) >= 1, true, false) exist
			from information_schema.columns
			where table_schema = a
			and table_name = b
			and column_name = c $$
	end $$
delimiter ;

call usp_col_length('test', 'emp', 'empno') ;
call usp_col_length('test', 'emp', '') ;
call usp_col_length('test', 'emp', null) ;



-- ########################
-- 프로시저에서 프로시저 콜하기
-- ########################


-- 저장 프로시저에서 또 다른 저장 프러시저 호출
delimiter $$
	drop procedure if exists usp_callproc $$
	create procedure usp_callproc(type int)
	
	begin
		if type = 0 then
			call usp_foreignKey('test', 'emp') $$
		elseif type = 1 then
			call usp_indexall('test', 'emp') $$			
		else
			select 'missing' $$
	end $$
delimiter ;


call usp_callproc() ;


-- 문제. TRANS_EMP --> SEL_EMPNO, DEL_ENAME 호출




-- ########################
-- cursor를 사용하는 프로시저 만들기
-- 문제. cursor_sample01을 만드시오.
-- ########################
delimiter $$
	drop procedure if exists cursor_sample01 $$
	create procedure cursor_sample01()
	begin
		declare vempno int $$
		declare vsal decimal(8, 2) $$		
		declare vdeptno int $$		
		declare done int default 0 $$  -- 커서 상태 체크

-- 커서 declare
		declare cur1 cursor for select empno, sal, deptno from emp $$
		declare continue handler for not found set done = 1 $$ -- 커서 탈출조건
		
-- 커서 open
		open cur1 $$
		curloop : while done = 0 do
		
		-- 커서 fetch
			fetch cur1 into vempno, vsal, vdeptno $$   -- 커서가 가리키고 있는 row 값을 변수에 넣는다.
			if done = 1 then 
				leave curloop $$
			end if $$
			select vempno, vsal, vdeptno $$
			
		end while $$
		
		-- 커서 close
		close cur1 $$
	end $$
delimiter ;

call cursor_sample01() ;

-- ########################
-- InsertUpdate 프로시저 vs MERGE 구문
-- ########################

-- @@@@@
-- 문제. usp_emp_insertupdate 프로시저를 만드시오.
-- emp 테이블에 매개변수로 넘겨진 empno 데이터가 없으면 insert,
-- empno 데이터가 있으면 update.
--
-- 매개변수
-- vempno int
-- vename nvarchar(20)
-- vjob nvarchar(20)
-- vdeptno int
-- @@@@@



-- @@@@@
-- 문제. usp_emp_merge 프로시저를 만드시오.
-- emp 테이블에 매개변수로 넘겨진 empno 데이터가 없으면 insert,
-- empno 데이터가 있으면 update.
-- MERGE 구문 사용
-- @@@@@
