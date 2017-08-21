-- @@@@@@@@@@
-- dual 테이블
-- dual 테이블은 계산이나 단순 연산을 위해서 사용.
-- @@@@@@@@@@  // sql에 없음

-- 24*35의 결과는
SELECT 24*35;


-- @@@@@@@@@@df
-- 수학 함수
-- @@@@@@@@@@

-- 정수값 구하기. FLOOR
SELECT FLOOR('12345.75');

-- 반올림
SELECT ROUND('12345.75', 0);
SELECT ROUND('12345.75', 2);
SELECT ROUND('12345.75', -2);

-- 버림

-- 나머지 구하기. MOD
SELECT MOD('12345.75', 1);
SELECT MOD('12345.75', 2);
SELECT MOD('12345.75', 3);
SELECT MOD('12345.75', 4);

-- @@@@@@@@@@
-- 문자 함수 : SUBSTR
-- @@@@@@@@@@

-- 대소문자 변환 : UPPER(), LOWER()
SELECT UPPER('dkerdf');
SELECT UPPER('dkerDFDFdf');

SELECT LOWER('SDFDF');
SELECT LOWER('dkerDFDFdf');

-- 문자 길이 구하기. LENGTH
SELECT LENGTH('dkerDFDFdf');

-- 바이트 길이 구하기. 한글은 2byte, 영문자는 1byte


-- 문자열 추출. SUBstring
SELECT SUBSTRING('asdf dfer df31', 2, 3);  -- 자바와 다르다 SELECT SUBSTRING('문자열(0부터가 아니라 1부터임)', 어디부터, 몇글자);
SELECT SUBSTRING('asdf dfer df31', 0);
SELECT SUBSTRING('asdf dfer df31', 1);
SELECT SUBSTRING('asdf dfer df31', -7);
SELECT SUBSTRING('asdf dfer df31', -7, 2);

SELECT LEFT('abcde', 1);
SELECT LEFT('abcde', 2);
SELECT LEFT('abcde', 3);

SELECT RIGHT('abcde', 1);
SELECT RIGHT('abcde', 2);
SELECT RIGHT('abcde', 3);

-- 왼쪽에 기호 채우기. LPAD   -- SELECT LPAD(str,len,padstr);
SELECT LPAD('df3ed f',10,'0');

-- 오른쪽에 기호 채우기. RPAD
SELECT RPAD('df3ed f',10,'0');

-- 문자열 바꾸기
SELECT REPLACE('adsasdfedfd', 'a', '1');


-- @@@@@@@@@@
-- 날짜 함수 : now(), date_format(), date_add(), date_sub() 
-- @@@@@@@@@@

-- 현재 날짜를 출력하시오
SELECT curdate();

-- 현재  시간을 출력하시오
SELECT curtime();

-- 현재 날짜와 시간을 출력하시오
SELECT now();
SELECT sysdate();


-- 현재시간을 'YYYY/MM/DD' 포맷으로 출력하시오
SELECT NOW(), DATE_FORMAT(NOW(), '%Y');
SELECT NOW(), DATE_FORMAT(NOW(), '%y');
SELECT NOW(), DATE_FORMAT(NOW(), '%M');
SELECT NOW(), DATE_FORMAT(NOW(), '%m');
SELECT NOW(), DATE_FORMAT(NOW(), '%D');
SELECT NOW(), DATE_FORMAT(NOW(), '%d');
SELECT NOW(), DATE_FORMAT(NOW(), '%Y %m %d');
SELECT NOW(), DATE_FORMAT(NOW(), '%Y/%m/%d');

-- 현재시간을 'YYYY-MM-DD' 포맷으로 출력하시오
SELECT NOW(), DATE_FORMAT(NOW(), '%Y-%m-%d');

-- 현재시간을 'hh:mm:ss' 포맷으로 출력하시오
SELECT NOW(), DATE_FORMAT(NOW(), '%H');
SELECT NOW(), DATE_FORMAT(NOW(), '%h');
SELECT NOW(), DATE_FORMAT(NOW(), '%i');
SELECT NOW(), DATE_FORMAT(NOW(), '%s');

SELECT NOW(), DATE_FORMAT(NOW(), '%H:%i:%s');

SELECT NOW(), DATE_FORMAT(NOW(), '%Y-%m-%d %h:%i:%s');

-- 날짜를 MONTH 기준으로 버리기. 해당 월의 첫째날 구하기

-- 해당 월의 첫째요일 구하기
SELECT '2017-04-01', DATE_FORMAT('2017-04-01', '%a');

-- '2014-01-01'의 첫째요일 구하기
SELECT '2014-01-01', DATE_FORMAT('2017-04-01', '%a');

-- 오늘은 이번달의  몇주차인가?


-- 오늘은 이번주의  무슨요일인가?
SELECT dayofweek(now());  -- 일:1, 월:2~ 토:7

-- 지금부터 '2014-01-01' 까지의 개월수 구하기
SELECT timestampdiff(MONTH, now(), '2014-01-01');
SELECT timestampdiff(MONTH, curdate(), '2014-01-01');

SELECT TIMESTAMPDIFF(YEAR, now(), '2017-05-15');
SELECT TIMESTAMPDIFF(MONTH, now(), '2017-05-15');
SELECT TIMESTAMPDIFF(DAY, now(), '2017-05-15');


-- 날짜 사이의 개월 수 구하기

-- 오늘 날짜에 6개월 추가하기
SELECT DATE_ADD(now(), INTERVAL 6 MONTH);
-- 오늘 날짜에 6개월 빼기
SELECT DATE_ADD(now(), INTERVAL -6 MONTH);

-- 가장 가까운 수요일은 언제인가?
SELECT CURDATE(), dayofweek(now()), (7-dayofweek(now())), date_add(curdate(), INTERVAL( 7-dayofweek(now()) +4 ) day);
SELECT date_add(curdate(), INTERVAL( 7-dayofweek(now()) +4 ) day);

DATE_ADD(now(), INTERVAL -6 MONTH);

-- 해당 월의 마지막날 구하기
SELECT LAST_DAY('2016-01-01');
SELECT LAST_DAY(now());


-- @@@@@@@@@@
-- 윤달 테이블 만들기  -- 울트라 에딧이용
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
-- 형변환 함수 : number <--> character <--> date
-- to_char, to_date, to_number
-- @@@@@@@@@@

-- 현재날짜( sysdate )를 문자열로 변환 : YYYY, MM, DD  date --> charactor 로 바꾼거임
SELECT curdate(), convert(curdate(), nchar(4));
SELECT curdate(), convert(curdate(), nchar(7));
SELECT curdate(), convert(curdate(), nchar(10));

-- 현재시간( systimestamp) 을 문자열로 변환
SELECT curtime(), CONVERT(curtime(), char(5));
SELECT curtime(), CONVERT(curtime(), char(15));
SELECT curtime(), CONVERT(curtime(), nchar(15));


-- 통화 기호 붙이기 --mysql 안 됌

-- 문자를 날짜로 변환. to_date. 변환 후 DATE 포맷이 된다.
SELECT '2017-04-13', CONVERT('2017-04-13', date);
SELECT '2017-04-13', CONVERT('2017-04-13', time);  -- 문제
SELECT '2017-04-13', CONVERT('2017-04-13', datetime);

-- 문자를 숫자로 변환
SELECT '-120', CONVERT( '-120', SIGNED);
SELECT '120', CONVERT( '120', SIGNED);
SELECT '120.124', CONVERT( '120.124', DECIMAL(7, 0));
SELECT '120.124', CONVERT( '120.124', DECIMAL(7, 3));
SELECT '120.124', CONVERT( '120.124', DECIMAL(7, 4));

-- 문자를 숫자로 변환시 숫자의 포맷 지정하기

-- 문자를 숫자로 변환: 20,000,000.73797874857848 을 숫자로 바꾸시오.
SET @aaa = '20,000,000.73797874857848';
SET @bbb = REPLACE(@aaa, ',', ''); 

SELECT @aaa, CONVERT(@bbb, DECIMAL( 24, 14));

SELECT @aaa, @bbb := REPLACE(@aaa, ',', ''), CONVERT(@bbb, DECIMAL(24, 14));
SELECT @aaa, REPLACE(@aaa, ',' , '') , CONVERT(REPLACE(@aaa, ',', ''), DECIMAL(24, 14));


-- @@@@@@@@@@
-- NULL을 변환하는 함수 : NVL
-- @@@@@@@@@@

-- NVL 사용법
SELECT IFNULL(null, 1);
SELECT IFNULL(2, 1);


-- @@@@@@@@@@
-- 선택 함수 : CASE 문. 자바의 연속if 와 유사
-- CASE WHEN ELSE 
-- @@@@@@@@@@ 


-- CASE WHEN ELSE 
SELECT ename, deptno, CASE WHEN deptno = 10 THEN 'aaaa'
									WHEN deptno = 20 THEN 'bbbb'
									WHEN deptno = 21 THEN 'cccc'
									WHEN deptno = 30 THEN 'dddd'
									ELSE 'eeee'
									END AS deptname
FROM emp;

 
 
 
 
-- @@@@@@@@@@@@@@
-- 미션
-- @@@@@@@@@@@@@@
-- 미션 1. SUBSTR 함수를 사용하여 9월에 입사한 사원을 출력하기 

-- 현재날(sysdate)에서 월을 가져오려면


-- 입사일(hiredate)에서 월을 가져오려면
SELECT hiredate, substring(hiredate, 7, 1) FROM emp ;
-- 9월에 입사한 사원 출력하기
SELECT * FROM emp WHERE substring(hiredate, 7, 1) = 9 ;



-- 미션 2. SUBSTR 함수를 이용하여 2003년도에 입사한 사원을 검색하기
SELECT substring(hiredate, 1, 4) FROM emp ;
SELECT * FROM emp WHERE substring(hiredate, 1, 4) = 2003 ;


-- 미션 3. 이름(ename)이 '기'로 끝나는 사원을 검색하시오
SELECT substring(ename, 3, 1) FROM emp ;
SELECT * FROM emp WHERE substring(ename, 3, 1) = '기';

-- 미션 4. 이름의 두 번째 글자가 '동'이 있는 사원을 검색하기
SELECT * FROM emp WHERE substring(ename, 2, 1) = '동';


-- 미션 5. 직급(job)에 따라 직급에 따라 급여를 인상하시오.
-- '부장'인 사원은 5% 인상 
SELECT *, sal*1.05 FROM emp WHERE substring(job, 1, 2) = '부장';
-- '과장'인 사원은 10% 인상
SELECT *, sal*1.1 FROM emp WHERE substring(job, 1, 2) = '과장';
-- '대리'인 사원은 15% 인상 
SELECT *, sal*1.15 FROM emp WHERE substring(job, 1, 2) = '대리';
-- '사원'인 사원은 20% 인상
SELECT *, sal*1.2 FROM emp WHERE substring(job, 1, 2) = '사원';

SELECT ename, sal, job, CASE when job  = '사원' then sal * (1.2)
								when job  = '대리' then sal * (1.15)
								when job  = '과장' then sal * (1.1)
								when job  = '부장' then sal * (1.05)
								else sal 
								end
								FROM emp;


-- 미션 6. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 출력하시오
-- 구글 검색을 이용 : http://aesya.tistory.com/15
SELECT * FROM emp 

SELECT DATE_FORMAT(hiredate, '%y');
SELECT DATE_FORMAT('hiredate', '%y');

SELECT curdate(), STR_TO_DATE('hiredate', '%y-%m-%d');


SELECT curdate(), convert(hiredate, date());


SELECT DATE_FORMAT('hiredate', '%y');
