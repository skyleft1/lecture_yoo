jdbc 실습용 DDL 문제
1. 데이터베이스 book_db를 만드시오.
2. auth, book 테이블을 조건에 맞게 만드시오.
3. 해당되는 데이터를 아래와 같이 만드시오.

mysql> show columns from auth;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| authid | int(11)     | NO   | PRI | NULL    | auto_increment |
| name   | varchar(50) | YES  |     | NULL    |                |
| birth  | varchar(10) | YES  |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+

mysql> select * from auth;
+--------+------+------------+
| authid | name | birth      |
+--------+------+------------+
|      1 | bob  | 1970.05.01 |
|      2 | kim  | 1980.05.01 |
|      7 | park | 2000.05.01 |
+--------+------+------------+

mysql> show columns from book;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| book_id   | int(11)     | NO   | PRI | NULL    | auto_increment |
| title     | varchar(50) | YES  |     | NULL    |                |
| publisher | varchar(30) | YES  |     | NULL    |                |
| year      | varchar(10) | YES  |     | NULL    |                |
| price     | int(11)     | YES  |     | NULL    |                |
| dtm       | date        | YES  |     | NULL    |                |
| use_yn    | tinyint(1)  | NO   |     | 0       |                |
| authid    | int(11)     | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

mysql> select * from book;
+---------+------------------+-----------+------+-------+------------+--------+--------+
| book_id | title            | publisher | year | price | dtm        | use_yn | authid |
+---------+------------------+-----------+------+-------+------------+--------+--------+
|       1 | Operating System | Wiley     | 2003 | 30700 | 2004-01-01 |      0 |      1 |
|       2 | MySQL            | OReilly   | 2009 | 58700 | 2010-01-01 |      1 |      2 |
|       3 | JAVA             | Hall      | 2013 | 40000 | 2014-01-01 |      1 |      3 |
|       4 | First SQL        | Wiley     | 2015 | 57700 | 2016-01-01 |      1 |      4 |
+---------+------------------+-----------+------+-------+------------+--------+--------+
