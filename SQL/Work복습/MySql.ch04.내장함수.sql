-- @@@@@@@@@@
-- dual 테이블
-- dual 테이블은 계산이나 단순 연산을 위해서 사용.
-- @@@@@@@@@@

-- 24*35의 결과는
SELECT 24*35;


-- 현재 날짜를 출력하시오
SELECT curdate();

-- 현재  시간을 출력하시오
SELECT curtime();

SELECT now();

-- @@@@@@@@@@
-- 수학 함수
-- @@@@@@@@@@

-- 정수값 구하기. FLOOR
SELECT floor('23.340392');

-- 반올림
SELECT round('23.340392', -1);
SELECT round('23.340392', 2);

-- 버림

-- 나머지 구하기. MOD
SELECT MOD('23', 3);
SELECT MOD('15', 3);


-- @@@@@@@@@@
-- 문자 함수 : SUBSTR


-- @@@@@@@@@@

-- 대소문자 변환 : UPPER(), LOWER()
SELECT UPPER('dfEDFdfe');
SELECT LOWER('dfEDFdfe');

-- 문자 길이 구하기. LENGTH
SELECT LENGTH('dfEDFdfe');

-- 바이트 길이 구하기. 한글은 2byte, 영문자는 1byte
SELECT LENGTH('한글');
SELECT LENGTH('ㅎㅎ');
SELECT LENGTH('aa');

-- 문자열 추출. SUBSTR
SELECT substring('asdf1234' , 4);
SELECT substring('asdf1234' , 4, 2);

-- 왼쪽에 기호 채우기. LPAD
SELECT LPAD('asdf1234', 20 , '!');

-- 오른쪽에 기호 채우기. RPAD
SELECT RPAD('asdf1234', 20 , '!');

-- @@@@@@@@@@
-- 형변환 함수 : to_char, to_date, to_number
-- @@@@@@@@@@

-- 현재날짜( sysdate )를 문자열로 변환 : YYYY, MM, DD
SELECT now(), date_format(now(), '%Y');
SELECT now(), date_format(now(), '%y');

SELECT now(), date_format(now(), '%M');
SELECT now(), date_format(now(), '%m');

SELECT now(), date_format(now(), '%Y-%m-%d');
SELECT now(), date_format(now(), '%Y-%m-%d %h:%i:%s');

-- 현재시간( systimestamp) 을 문자열로 변환


-- 날짜와 시간을 문자열로 변환
SELECT now();
SELECT now(), date_format(now(), '%Y-%m-%d %h:%i:%s');

-- 통화 기호 붙이기
SELECT DAYOFWEEK(now());  -- 일:1 월:2~ 토:7 숫자로 반환

-- 문자를 날짜로 변환. to_date. 변환 후 DATE 포맷이 된다.
SELECT '2017-01-01', CONVERT('2017-01-01', datetime);

-- 문자를 숫자로 변환
SELECT '20170101', CONVERT('20170101', decimal);

-- 문자를 숫자로 변환시 숫자의 포맷 지정하기


-- 문자를 숫자로 변환: 20,000,000.73797874857848 을 숫자로 바꾸시오.
SELECT '20,000,000.73797874857848', CONVERT('20,000,000.73797874857848', DECIMAL);

SET @aaa = '20,000,000.73797874857848';
SET @bbb = REPLACE(@aaa, ',' , '');

SELECT @aaa, CONVERT(@bbb, DECIMAL(24, 14));


-- @@@@@@@@@@
-- 날짜 함수 : sysdate, systimestamp
-- @@@@@@@@@@

-- sysdate 를 'YYYY/MM/DD' 포맷으로 출력하시오
SELECT now(), DATE_FORMAT(now(), '%Y/%m/%d');

-- 날짜를 MONTH 기준으로 버리기. 해당 월의 첫째날 구하기

-- 날짜 사이의 개월 수 구하기

SELECT TIMESTAMPDIFF(YEAR, now(), '2017-05-15');
SELECT TIMESTAMPDIFF(MONTH, now(), '2017-05-15');
SELECT TIMESTAMPDIFF(DAY, now(), '2017-05-15');


-- 입사 날짜에 6개월 추가하기
SELECT DATE_ADD(NOW() , INTERVAL 6 YEAR);
SELECT DATE_ADD(NOW() , INTERVAL 6 MONTH);
SELECT DATE_ADD(NOW() , INTERVAL 6 DAY);


-- 가장 가까운 수요일은 언제인가?
SELECT CURDATE(), dayofweek(now()), (7-dayofweek(now())), date_add(curdate(), INTERVAL( 7-dayofweek(now()) +4 ) day);
SELECT date_add(curdate(), INTERVAL( 7-dayofweek(now()) +4 ) day);


-- 해당 월의 마지막날 구하기
SELECT LAST_DAY('2016-01-01');

-- 윤달 테이블 만들기
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
-- NULL을 변환하는 함수 : NVL
-- @@@@@@@@@@

-- NVL 사용법



-- @@@@@@@@@@
-- 선택 함수 : CASE 문. 자바의 연속if 와 유사
-- CASE WHEN ELSE 
-- @@@@@@@@@@ 


-- CASE WHEN ELSE 
 
 
 
 
 
-- @@@@@@@@@@@@@@
-- 미션
-- @@@@@@@@@@@@@@
-- 미션 1. SUBSTR 함수를 사용하여 9월에 입사한 사원을 출력하기 

-- 현재날(sysdate)에서 월을 가져오려면

-- 입사일(hiredate)에서 월을 가져오려면

-- 9월에 입사한 사원 출력하기



-- 미션 2. SUBSTR 함수를 이용하여 2003년도에 입사한 사원을 검색하기




-- 미션 3. 이름(ename)이 '기'로 끝나는 사원을 검색하시오


-- 미션 4. 이름의 두 번째 글자가 '동'이 있는 사원을 검색하기



-- 미션 5. 직급(job)에 따라 직급에 따라 급여를 인상하시오.
-- '부장'인 사원은 5% 인상 
-- '과장'인 사원은 10% 인상
-- '대리'인 사원은 15% 인상 
-- '사원'인 사원은 20% 인상

-- 미션 6. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 출력하시오
-- 구글 검색을 이용 : http://aesya.tistory.com/15


