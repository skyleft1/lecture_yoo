
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- ������ �����ϱ�.
-- a. INSERT INTO ~ VALUES        �� �̿��� INSERT ��� : �⺻ ������ ���� ���
-- b. INSERT INTO ~ SELECT ~ FROM �� �̿��� INSERT ��� : ���̺��� �������� ����. ������ ����
-- c. INSERT INTO ~ SELECT ~ FROM �� �̿��� INSERT ��� : ���̺��� �������� ����. ������ ����
-- d. CREATE TABLE ���̺�� ~ FROM�� �̿��� INSERT ��� : ���̺��� �������� ����. ���̺� ����
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- a. INSERT INTO ~ VALUES
--    emp ���̺� �渮�� �Ҽ��� ��� ���߱⸦ �߰��Ͻÿ�.


-- b. INSERT INTO ~ SELCET ~ FROM �� �̿��� INSERT ��� 
--    ���������� �̿��ؼ� emp ���̺� ��� ���߱⸦ �߰�
select @maxempno := max(empno) from emp;
select @deptno   := deptno from dept where dname = '�渮��';
insert into emp( empno       , deptno , job   , ename   , hiredate , sal) 
         values( @maxempno +1, @deptno, '���', '���߱�', curdate(), 500);
select * from emp order by empno desc limit 0,1;         


-- c. ���̺��� ���� ��쿡 ���̺�� �����͸� ���� �ϴ� ���
--    CREATE TABLE ���θ������̺�� AS SELECT * FROM ���������̺��;
drop table if exists emp01; -- ���̺� ����.
create table emp01 as select * from emp ;


-- d. ���̺��� �̹� �����Ǿ� �ְ� �����͸� ����
--    INSERT INTO ���������̺�� SELECT * FROM ���������̺�� [WHERE ��]
--    new_emp �� ��� ������ ����
drop table if exists emp01;
create table emp01 like emp;  -- ���̺� ������  ����
insert into emp01 select * from emp;  -- �����͸� ����


-- e. ���̺��� ������ ���̺� ������ �����ϱ� : 
-- CREATE TABLE new_table LIKE old_table;
drop table if exists emp01;
create table emp01 like emp;  -- ���̺� ������  ����


-- f. emp01 ���̺� �����ϱ�
drop table if exists emp01;



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- ������ �����ϱ�.
-- a. UPDATE ~ SET ~ WHERE �� �̿��� UPDATE ��� : �⺻ ������ ���� ���
-- b. ����������              �̿��� UPDATE ��� : 
-- c. ������                  �̿��� UPDATE ��� : UPDATE ~ SET ~ FROM ~ WHERE
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

-- a. UPDATE ~ SET ~ WHERE �� �̿��� UPDATE ��� : �⺻ ������ ���� ���
-- HR������ �ٹ��ϴ� ��� ������ �λ�η� �����ϰ� ������ 300 ���� �����Ͻÿ�
select * from dept where dname like '%hr%' or dname like '%�λ�%';
update emp set deptno = 20, sal = 300 where deptno=21;
select * from emp where deptno=21;


-- b. ���������� �̿��� UPDATE ��� :
-- HR������ �ٹ��ϴ� ����� �λ�η� �����ϰ� ������ 300 ���� �����Ͻÿ�

select @deptno := deptno from dept where dname like '%�λ�%';
update emp set deptno = @deptno, sal = 300 
where deptno = ( select deptno from dept where dname = 'hr��' ) ;

select * from emp where deptno=21;


-- c. ������  �̿��� UPDATE ��� : 
-- UPDATE [���̺��1] A INNER JOIN [���̺��2] B
-- ON A.[������ �÷���] = B.[������ �÷���]
-- SET [������ �÷���] = �����Ұ�
-- ( WHERE �� )
-- HR������ �ٹ��ϴ� ����� �λ�η� �����ϰ� ������ 300 ���� �����Ͻÿ�

start transaction;

update emp inner join dept on dept.deptno = emp.deptno
   set emp.deptno = ( select deptno from dept where dname = '�λ��')
     , emp.sal    = 300
 where dept.dname ='HR��';

select * from emp where deptno in (20, 21);

rollback;


-- �̼�. 
-- '�λ��'�� �μ� ��ġ(loc)�� '�����'�� �ִ� ����(loc)���� �Űܶ�.
select * from dept where dname ='�λ��';  -- loc == ��õ
select * from dept where dname ='�����';  -- loc == ����

update dept set loc='��õ' where dname ='�����';

select @loc :=loc from dept where dname ='�λ��';
update dept set loc= @loc where dname ='�����';






-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- ������ �����ϱ�.
-- a. DELETE FROM ���̺�� WHERE �� �̿��ϴ� ��� : �⺻ ������ ���� ���
-- b. ���������� �̿��� DELETE �� �ϴ� ��� :
-- c. ������ �̿��� DELETE     �� �ϴ� ��� : 
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 


-- a. DELETE FROM ~ WHERE �� �̿��ϴ� ��� : �⺻ ������ ���� ���
-- �渮�ο��� �ٹ��ϴ� ��� ����� emp���� �����Ͻÿ�.
start transaction;

select * from dept where dname='�渮��';
select * from emp where deptno=10;
delete from emp where deptno=10;
select * from emp where deptno=10;

rollback;




-- b. ���������� �̿��� DELETE ��� :
-- �渮�ο��� �ٹ��ϴ� ��� ����� emp���� �����Ͻÿ�.
start transaction;

select * from dept where dname = '�渮��';

delete from emp 
 where deptno in ( select deptno from dept where dname = '�渮��' ) ;

select * from emp where deptno in ( select deptno from dept where dname = '�渮��' ) ;

rollback;



-- c. ������ �̿��� DELETE ��� :
-- �渮�ο��� �ٹ��ϴ� ��� ����� emp���� �����Ͻÿ�.
start transaction;

select * from dept where dname = '�渮��';

delete emp  
  from dept inner join  emp  on dept.DEPTNO = emp.DEPTNO
 where dept.dname = '�渮��';

select * 
  from  emp inner join  dept  on dept.DEPTNO = emp.DEPTNO
 where dept.dname = '�渮��'; 

rollback;
