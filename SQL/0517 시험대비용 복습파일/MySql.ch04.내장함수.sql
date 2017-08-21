-- @@@@@@@@@@
-- 계산이나 단순 연산을 위해서 사용.
-- @@@@@@@@@@

-- 24*35의 계산 결과를 출력하시오.
select 24*35 ;

-- 현재 날짜와 시간을 출력하시오
select now() ;

-- 현재 날짜를 출력하시오
select curdate() ;

-- 현재  시간을 출력하시오
select curtime() ;


-- @@@@@@@@@@
-- 숫자 관련 함수
-- @@@@@@@@@@

-- 정수값 구하기: floor
select floor(400.4545) ;

-- 반올림: round
select round(412.4545, 1) ;
select round(412.4545, 3) ;
select round(412.4545, -2) ;

-- 버림: truncate
select truncate(412.4545, 1) ;

-- 나머지 구하기: mod
select mod(412.4545, 5) ;



-- @@@@@@@@@@
-- 문자 관련 함수 : substring
-- @@@@@@@@@@


-- 대문자 변환 : upper()
select upper('ABC abc') ;

-- 소문자 변환 : lower()
select lower('ABC abc') ;

-- 문자 길이 구하기. length(). 한글은 2byte, 영문자는 1byte
select length('ABC abc') ;


-- 바이트 길이 구하기. 한글은 2byte, 영문자는 1byte
select length('에비씨 에비씨') ;
select length('ABC abc') ;


-- 문자열 추출. substring
select subString('ABC abc', 2) ;

-- 왼쪽에 기호 채우기. lpad
select lpad('ABC abc', 14 ,'0') ;


-- 오른쪽에 기호 채우기. rpad
select RPAD('ABC abc', 18 ,'0') ;

-- 문자열 바꾸기. replace
select replace('ABC abc', 'ab' ,'왔때매') ;


-- @@@@@@@@@@
-- 날짜 관련 함수 : now(), date_format(), date_add(), date_sub()
-- @@@@@@@@@@

-- 현재 날짜와 시간을 출력하시오
select now();

-- 현재 날짜를 출력하시오
select curdate();

-- 현재  시간을 출력하시오
select curtime();

-- 현재 날짜를 'YYYY/MM/DD' 포맷으로 출력하시오

select NOW(), DATE_FORMAT(NOW(), '%Y');
select NOW(), DATE_FORMAT(NOW(), '%Y/%m/%d');

-- 현재 날짜를 'YYYY-MM-DD' 포맷으로 출력하시오
select NOW(), DATE_FORMAT(NOW(), '%Y-%m-%d');


-- 현재 시간를 'hh:mm:ss' 포맷으로 출력하시오
select curtime(), DATE_FORMAT(curtime(), '%h-%i-%s');
select now(), DATE_FORMAT(now(), '%Y-%m-%d %h-%i-%s');


-- 이번달의 첫째날 요일 구하기
select date_format(now(), '%a');
SELECT '2017-04-01', DATE_FORMAT('2017-04-01', '%a');

-- 오늘은 이번달의 몇 주차인가?

-- 지금부터 '2014-01-01'까지의 개월 수 구하기
SELECT timestampdiff(MONTH, now(), '2014-01-01');

-- 오늘 날짜에 6개월 추가하기
SELECT DATE_ADD(now(), INTERVAL 6 MONTH);

-- 오늘 날짜에 -6개월 추가하기
SELECT DATE_ADD(now(), INTERVAL -6 MONTH);

-- 지금부터 가장 가까운 수요일은 몇일후 인가?
SELECT CURDATE(), dayofweek(now()), (7-dayofweek(now())), date_add(curdate(), INTERVAL( 7-dayofweek(now()) +4 ) day);
SELECT date_add(curdate(), INTERVAL( 7-dayofweek(now()) +4 ) day);

-- 지금부터 가장 가까운 수요일은 몇일인가?

-- 해당 월의 마지막 일을 구하기
SELECT LAST_DAY(now());


-- @@@@@@@@@@
-- 윤달 테이블 만들기
-- @@@@@@@@@@
SELECT LAST_DAY('2001-02-01') UNION
SELECT LAST_DAY('2002-02-01') UNION
SELECT LAST_DAY('2003-02-01') UNION
SELECT LAST_DAY('2004-02-01') UNION
SELECT LAST_DAY('2005-02-01') UNION
SELECT LAST_DAY('2006-02-01') UNION
SELECT LAST_DAY('2007-02-01') UNION
SELECT LAST_DAY('2008-02-01') UNION
SELECT LAST_DAY('2009-02-01') UNION
SELECT LAST_DAY('2010-02-01') UNION
SELECT LAST_DAY('2011-02-01') UNION
SELECT LAST_DAY('2012-02-01') UNION
SELECT LAST_DAY('2013-02-01') UNION
SELECT LAST_DAY('2014-02-01') UNION
SELECT LAST_DAY('2015-02-01') UNION
SELECT LAST_DAY('2016-02-01') UNION
SELECT LAST_DAY('2017-02-01') UNION
SELECT LAST_DAY('2018-02-01') UNION
SELECT LAST_DAY('2019-02-01') UNION
SELECT LAST_DAY('2020-02-01') UNION
SELECT LAST_DAY('2021-02-01') ;




-- @@@@@@@@@@
-- 형변환 함수 : convert() : date <--> character <--> number
-- @@@@@@@@@@

-- 현재일자를 문자열로 변환 : YYYY, MM, DD
select curdate(), convert(curdate(), nchar(22)) ;

-- 현재시간을 문자열로 변환
select curtime(), convert(curtime(), nchar(22)) ;

-- 통화 기호 붙이기.MySql 안됨.


-- 문자를 날짜로 변환. 변환 후 DATE 포맷이 된다.
select '2014-01-01', convert('2014-01-01', datetime) ;

-- 문자를 숫자로 변환
select '201401.45', convert('201401.45', decimal(9, 2)) ;

-- 문자를 숫자로 변환시 숫자의 포맷 지정하기
select '201,401.45', convert('201,401.45', decimal(9, 2)) ; -- 오류뜸
set @a := '201,401.45' ;
set @b := replace('201,401.45' ,',','' ) ;
select @a, convert(@b, decimal(9, 2)) ; 

-- 문자를 숫자로 변환: 20,000,000.73797874857848 을 숫자로 바꾸시오.
set @a := '20,000,000.73797874857848' ;
set @b := replace(@a ,',','' ) ;
select @a, convert(@b, decimal(20, 10)) ; 


-- @@@@@@@@@@
-- NULL을 처리하는 함수 : ifnull()
-- @@@@@@@@@@

-- ifnull 사용법



-- @@@@@@@@@@
-- 선택 함수 : CASE 문. 자바의 연속if 와 유사
-- CASE WHEN ELSE 
-- @@@@@@@@@@ 


-- CASE WHEN ELSE
 




-- @@@@@@@@@@@@@@
-- 미션
-- @@@@@@@@@@@@@@
-- 미션 1. substring 함수를 사용하여 9월에 입사한 사원을 출력하기. 1개
select hiredate, substring( hiredate, 6, 2) from emp ;

select * from emp where substring( hiredate, 6, 2) = '09' ;


-- 미션 2. SUBSTR 함수를 이용하여 2003년도에 입사한 사원을 검색하기. 2개
select hiredate, substring( hiredate, 1, 4) from emp ;
select * from emp where substring( hiredate, 1, 4) = '2003' ;

-- 미션 3. 이름(ename)이 '기'로 끝나는 사원을 검색하시오. 2개
select * from emp where ename like '%기';


-- 미션 4. 이름의 두 번째 글자에 '동'이 있는 사원을 검색하기. 2개
select * from emp where ename like '_동%';


-- 미션 5. 직급(job)에 따라 직급에 따라 급여를 인상하시오.
-- '부장'인 사원은 5% 인상 
-- '과장'인 사원은 10% 인상
-- '대리'인 사원은 15% 인상 
-- '사원'인 사원은 20% 인상
drop table if exists emp1;
create table emp1 as select * from emp;

select sal from emp1 ;
update emp1 set sal = case when job = '부장' then sal * 1.05 
											when job = '과장' then sal * 1.10 
											when job = '대리' then sal * 1.15 
											when job = '사원' then sal * 1.20 
											else sal
									end;


-- 미션 6. 입사일을 연도는 2자리(YY), 
--         월은 숫자로 표시하고 
--         요일은 약어(DY)로 출력하시오.
-- 구글 검색을 이용 
select hiredate, date_format( hiredate, '%y %c %W') from emp;


