--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 데이터 타입
--
-- 문자열  : CHAR VS VARCHAR VS VARCHAR2
-- 숫자    : NUMERIC
-- 날짜    : DATE
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 오브젝트 타입
--
-- 테이블   ( TABLE     )

-- 뷰       ( VIEW      )
-- 인덱스   ( INDEX     )
-- 시퀀스   ( SEQUENCE  )

-- 프로시저 ( PROCEDURE )
-- 함수     ( FUNCTION  )

-- 트리거   ( TRIGGER   )
-- 패키지   ( PACKAGE   )
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 오브젝트 조작 : DDL
-- CREATE 
-- ALTER 
-- DROP
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- DDL(CREATE/ALTER/DROP) 이란?
--    오브젝트를 조작하기 위한 SQL.
--
-- CREATE  TABLE 이름 | VIEW 이름 | INDEX idx_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- ALTER   TABLE 이름 | VIEW 이름 | INDEX idx_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
-- DROP    TABLE 이름 | VIEW 이름 | INDEX idx_이름 | PROCEDURE usp_이름 | FUNCTION udf_이름 | SEQUENCE seq_이름  | TRIGGER trg_이름  
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

--############
-- 뷰는 가상 테이블이다. 읽기 전용 select 문
-- 사용 목적
--     1. 보안
--     2. 간편한 사용
-- 뷰 생성시 WITH READ ONLY 옵션을 추가.
--############



--############
-- 인덱스는 데이터 검색시 속도 향상을 위해서 사용.
-- where절에서 사용되는 컬럼에는 인덱스 적용을 고려하시오.
-- where절에서 사용되는 모든 컬럼에 인덱스를 걸라는 말씀은 아닙니다.
-- 
--############

-- INDEX1 삭제 
-- DROP INDEX INDEX1;



--############
-- 시퀀스는 자동 증가값 만들 때 사용.
--############




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 테이블 
-- 테이블 만들기     :  CREATE TABLE   테이블명                 ;
-- 테이블 변경       :  ALTER  TABLE   테이블명                  ; 
-- 테이블 삭제       :  DROP   TABLE   테이블명                 ;
-- 테이블 이름 바꾸기:  EXEC sp_rename 테이블명, 새로운테이블명    ; 
-- 테이블 복제       :  SELECT *  INTO 새테이블명 FROM 원본테이블;
-- 테이블 로우 제거  :  TRUNCATE TABLE 테이블명                 ; // DELETE 보다 속도가 빠름.
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- 테이블 추가

-- 테이블 삭제

-- 테이블 이름 바꾸기

-- 테이블 복제

-- 테이블 로우만 제거



--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 테이블 변경
-- 테이블에 컬럼 추가      : ALTER TABLE 테이블명 ADD          컬럼이름 컬럼타입 
-- 테이블에 컬럼 삭제      : ALTER TABLE 테이블명 DROP  COLUMN 컬럼이름 
-- 테이블에 컬럼 타입 변경 : ALTER TABLE 테이블명 ALTER COLUMN 컬럼이름 컬럼타입
-- 테이브에 컬럼 이름 변경 : EXEC SP_RENAME '테이블이름.컬럼이름' , '새컬럼이름', 'COLUMN'
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- 컬럼 존재 여부 체크 : COL_LENGTH('테이블명','컬럼명') 


-- 테이블에 컬럼 추가


-- 테이블에 컬럼 삭제


-- 테이블에 컬럼 타입 변경

-- 테이블 이름 바꾸기:  

-- 테이블 컬럼 이름 변경




--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- 딕셔너리. 
-- 테이블과 컬럼에 관련된 정보를 보여주기 시스템 테이블
-- 딕셔너리 종류: user, all, dba
--
-- v$database
-- v$thread
-- v$instance
--
-- user_tables
-- all_tables
-- dba_tables
--
-- user_constraints 
-- user_cons_columns 
-- user_tab_columns
--
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2



--########################
-- Database 목록 조회
--########################



--########################
-- 오브젝트 목록 조회
--########################



--########################
-- 테이블 목록 조회 
--########################



--########################
-- 컬럼 목록 조회
--########################




-- =============================================
-- 테이블의 FOREIGN KEY 삭제
-- =============================================







--########################
-- 임시 테이블
--  Refernce:  http://stackoverflow.com/questions/1799128/oracle-if-table-exists
--########################

-- 임시 테이블 삭제

--  Refernce:  http://blog.naver.com/PostView.nhn?blogId=jupita&logNo=20004844541
-- 1. 임시 테이블 생성

-- 2. 임시 테이블에 인덱스 만들기 

-- 3. 임시 테이블에 데이터 insert

-- 4. 임시 테이블에서 데이터 가져오기

-- 5. 임시 테이블의 데이터를 메모리에서 삭제
-- "on commit delete rows" 옵션 때문에 임시 테이블의 모든 데이터가 삭제 됨
-- 테이블은 삭제 되지 않음. 데이터만 삭제 됨
