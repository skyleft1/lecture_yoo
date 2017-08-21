
--######################## 
-- WITH 구문
--
-- WITH 구문내의 쿼리 결과(SUB쿼리)를 여러번 사용하고자 할 때 유용하다.
-- 서브쿼리 블럭에 이름을 지정할 수 있도록 해줌.
-- 오라클은 WITH 구문을 뷰나 일회용 테이블로 여긴다.
-- Oracle 9 이상 지원
-- mysql 은 지원하지 않음
--
-- FROM 절에 서브쿼리를 사용하는 경우에는 WITH 문을 사용하시오.
--
-- http://powerofwriting.tistory.com/entry/Oracle-WITH-구문-예제
--########################
 
 
-- 그림처럼 테이블을 만들고 id, pid, data 형태의 데이터를 만드시오
-- 그림처럼 데이터를 만드시오.
-- 단, 테이블은 tree로 하시오.

CREATE TABLE `tree` (
	id INT(11) NULL DEFAULT NULL,
	pid INT(11) NULL DEFAULT NULL,
	data VARCHAR(50) NULL DEFAULT NULL
);


SET @id := 26;
SET @L := 0;

SELECT @r AS _ID
		, (SELECT @r := pid FROM tree WHERE id = _ID) AS _PARENT_ID
		, (@L := @L + 1) AS level
	FROM (SELECT @r := @id ) AS vars
		, (SELECT * FROM tree WHERE id < @id ) AS h
WHERE @r != 0;



-- 1 테이블을 만드시오.
insert into tree2 values (1,0,'ROOT');
insert into tree2 values (2,1,'CHILD');
insert into tree2 values (3,2,'CHILD OF 2');
insert into tree2 values (4,2,'CHILD OF 2');
insert into tree2 values (5,2,'CHILD OF 2');

-- 2 아래와 같이 데이터를 만든다.
SET @level := 0;
SELECT tree2.id, parent_id, @level := @level + 1 AS level, etc FROM tree2 LEFT JOIN tree ON tree2.id = tree.id WHERE tree2.id IN (1, 2, 5);

SET @id := 5;
SET @L := 0;

SELECT @r AS _ID
		, (SELECT @r := parent_id FROM tree2 WHERE id = _ID) AS _PARENT_ID
		, (@L := @L + 1) AS level
		, tree2.etc
	FROM (SELECT @r := @id ) AS vars
		, (SELECT * FROM tree2 WHERE id < @id ) AS h
		, tree2 LEFT JOIN tree ON tree2.id = tree.id
		
WHERE @r != 0 OR tree2.id = tree2.etc


SET @id := 5;
SET @L := 0;

SELECT @r AS _ID
		, (SELECT etc FROM tree2 WHERE id = @cl ) AS etc
		, (SELECT @r := parent_id FROM tree2 WHERE id = _ID) AS PARENT_ID
		, @L := @L + 1 AS level
FROM (SELECT @r := 5, @l := 0 ) vars
		, tree2 h
WHERE @r != 0
ORDER BY _id ASC;


 
-- @@@@@@@ 
-- 한개의 SUB쿼리를 사용하는 WITH 구문 사용방법
-- WITH ALIAS명 AS ( 
--    SUB쿼리 
-- )
-- SELECT 컬럼명 FROM ALIAS명;
-- @@@@@@@ 





-- @@@@@@@ 
-- 여러개의 SUB쿼리를 사용하는 WITH 구문
-- WITH ALIAS명_1 AS ( SUB쿼리 ),
--      ALIAS명_2 AS ( SUB쿼리 )
-- SELECT 컬럼명 FROM ALIAS명 where 조인조건;
-- @@@@@@@ 


  

 
 
--######################## 
-- 계층형 쿼리
--
-- 답변형 게시판, 부서 조직도, 메뉴트리를 나타낼 때 사용한다.
-- 
-- 오라클에서는 SELECT 문에서 START WITH와 CONNECT BY 절을 이용하여 데이터를 계층적인 형태로 출력할 수 있다.
-- SELECT LEVEL, 컬럼1, 컬럼2, ...
-- FROM 테이블
-- WHERE 조건
-- START WITH 계층의 시작점이 될 행을 구별하는 논리식
-- CONNECT BY 계층을 구성할 때 사용될 논리식
--
-- http://ndatabase.blogspot.kr/2013/07/blog-post_19.html
-- http://noritersand.tistory.com/4
--######################## 


-- emp 테이블에서 매니저 사번 확인


-- self join 으로 담당 매니저 찾기


-- LEVEL을 이용하여 데이터 확인
 

-- LPAD 함수로 계층 표현
 
 
-- PRIOR / SYS_CONNECT_BY_PATH
-- PRIOR : 반환되는 레코드가 많을 경우엔 PRIOR를 통해 출력한다.
-- SYS_CONNECT_BY_PATH(A, B) : 연결된 계층의 위치를 확인할 떄 사용



-- ORDER SIBLINGS BY를 이용한 계층간 정렬




-- 답변형 게시판이나 부서관계도를 나타낼 때 사용한다.

   
