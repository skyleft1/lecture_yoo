-- ########################
-- ���ν��� �����
-- 
-- sql ���α׷���
--  1. ���� ����
--  2. ���ù�
--  3. �ݺ���
-- 
-- ���ν��� ����
--  1. �Ű����� ���� ���ν��� �����
--  2. �Ű����� �ִ� ���ν��� �����
--      3. ��� ��ȯ �޴� ���ν��� �����
-- 
-- ���ν��� �Ű����� : ���ν����� �Ķ���ʹ� IN, OUT, INOUT�� ������ �� �ִ�.
--  IN    : read-only
--  INOUT : read-write
--  OUT   : write-only
--  �ԷµǾ�� �ϴ� �Ű��������� in�� ����ϳ� in�� ���� �� �� �ִ�.
--  �ǵ��� �޾ƾ� �ϴ� �Ű��������� out�̳� inout�� �����Ѵ�.
--
-- ���ν��� �����ϱ�
--  1. call �� ���ν��� ����
--  2. ���ν������� ���ν��� ���� 
-- 
-- http://m.egloos.zum.com/it79/v/1032459
-- http://thesunrises.tistory.com/m/511
-- ########################



-- ########################
-- �Ű����� ���� ���ν��� �����
-- ########################
-- helloworld ���ν����� ����ÿ�.




-- ########################
-- ���� ����
-- declare  ������  ����Ÿ��;
-- ########################

-- variable_demo ���ν����� ����ÿ�.




-- ########################
-- ���ù�
-- 
-- if search_condition then statement_list
-- [elseif search_condition then statement_list]
-- [elseif search_condition then statement_list]
-- ...
-- [else statement_list]
-- end if
-- ########################



-- @@@@@
-- �ݺ���
-- 
-- while search_condition do
--    statement_list
-- end while 
-- @@@@@

-- ���� ���ν��� �ȿ� ������ ����. simple_loop ���ν����� ����ÿ�.




-- ����. del_all ���ν����� ����ÿ�.
-- 



-- ########################
-- �Ű������� �ִ� ���ν��� �����
-- 
-- MySQL���� �Ķ���ʹ� IN, OUT, INOUT�� ������ �� �ִ�.
-- IN    : read-only
-- INOUT : read-write
-- OUT   : write-only
-- ########################


-- usp_test �� ����ÿ�.


-- usp_sqrt �� ����ÿ�.



-- ����. �Ű������� �Ѱ��� ename�� emp ���̺��� ã�Ƽ� delete�ϴ� usp_del_ename ���ν����� ����ÿ�.
--       usp_del_ename ���ν����� �̿��Ͽ� '����'�� �����Ͻÿ�.



-- ����. �Ʒ��� �ܷ�Ű�� ��ȸ�ϴ� sql���� ���ν����� ����ÿ�.
-- http://stackoverflow.com/questions/4004205/mysql-show-constraints-on-tables-command
-- 
-- select
--     table_name,column_name,referenced_table_name,referenced_column_name
-- from
--     information_schema.key_column_usage
-- where referenced_table_name is not null
--   and table_schema = 'test' 
--   and table_name = 'assign'


-- ########################
-- ��� �ε����� ����ϴ� SQL���� ����ÿ�.
-- list all non-unique indexes
-- ########################
-- SELECT table_name AS `Table`,
--        index_name AS `Index`,
--        GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
-- FROM information_schema.statistics
-- WHERE NON_UNIQUE = 1 AND table_schema = 'test' AND table_name = 'emp'
-- GROUP BY 1,2;


-- ########################
-- ���̺��� �ε����� �����ϴ� SQL���� ����ÿ�.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- drop all non-unique indexes
-- ########################
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
-- ����� ��ȯ �޴� ���ν��� ����� 
-- 
-- MySQL���� �Ķ���ʹ� IN, OUT, INOUT�� ������ �� �ִ�.
-- IN    : read-only
-- INOUT : read-write
-- OUT   : write-only
-- 
-- �ǵ��� �޾ƾ� �ϴ� �Ű��������� out�� �����Ѵ�.
-- ########################

-- usp_sqrt ���ν����� ����ÿ�.


-- discounted_price ���ν����� ����ÿ�.



-- @@@@@@@
-- ����. empno�� ���ڷ� �ѱ�� ename, sal, job �� ���� �޴� ���ν���, sel_empno�� ����ÿ�.
-- �ǵ��� �޾ƾ� �ϴ� �Ű��������� out�� �����Ѵ�.
-- @@@@@@@








-- @@@@@@@
-- ����. �÷� ���� ���� üũ�ϴ� ���ν��� �� ����ÿ�.
--       usp_col_length('�����ͺ��̽���', '���̺��','�÷���') 
-- @@@@@@@
-- ------------------------------------------------------------
-- Use the inforamtion_schema to tell if a field exists.
-- Optional param dbName, defaults to current database
-- ------------------------------------------------------------





-- ########################
-- ���ν������� ���ν��� ���ϱ�
-- ########################


-- ���� ���ν������� �� �ٸ� ���� �������� ȣ��

 

-- ����. TRANS_EMP --> SEL_EMPNO, DEL_ENAME ȣ�� 




-- ########################
-- cursor�� �̿��ϴ� ���ν��� ����� 
-- ########################


-- @@@@@@@
-- ����. cursor_sample01�� ����ÿ�.
-- @@@@@@@
 

-- @@@@@@@
-- ����. ��� �ε����� ����ϴ� ���ν����� ����ÿ�.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- @@@@@@@



-- @@@@@@@
-- ����. ��� �ε����� �����ϴ� ���ν����� ����ÿ�.
-- http://stackoverflow.com/questions/3798524/mysql-dropping-all-indexes-from-table
-- @@@@@@@




-- ########################
-- InsertUpdate ���ν��� vs MERGE ����
-- ########################



-- ########################
--  MERGE ����
-- ########################

