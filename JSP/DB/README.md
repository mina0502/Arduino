```
	데이터베이스의 정의와 특징

데이터베이스 - 여러 사용자나 응용 프로그램이 공유하고 동시에 접근 가능한 데이터의 집합 || 데이터의 저장 공간 자체를 의미

DBMS - 데이터베이스를 관리・운영하는 소프트웨어 || 사용자나 응용 프로그램은 DBMS가 관리하는 데이터에 동시 접속해서 데이터를 공유

```
```

많이 사용되는 DBMS

★MySQL 

MariaDB

Oracle

SQL Server

DB2

Access

SQLite

```

```

	데이터베이스 특징

★데이터 무결성 : 데이터베이스 안의 데이터는 어떤 경로를 통해 들어왔든 오류가 있어서는 안됨

데이터 독립성 : 데이터베이스와 응용프로그램은 서로 의존적인 관계가 아니라 독립적인 관계

보안 : 데이터베이스 안의 데이터는 데이터를 소유한 사람이나 데이터에 접근이 허가된 사람만 접근할 수 있음

데이터 중복 최소화  : 데이터베이스에서 동일한 데이터가 여러 군데 중복 저장되는 것을 방지

응용프로그램 제작 및 수정 용이 : 데이터베이스를 이용하면 통일된 방식으로 응용 프로그램을 작성할 수 있고 유지 보수 또한 쉬움

데이터의 안전성 향상 : 데이터가 손상되는 문제가 발생하더라도 원래의 상태로 복원 또는 복구할 수 있음

```

```
	DBMS의 분류

계층형DBMS : 트리구조 , 접근성이 떨어짐 || linkedList

망형DBMS :  1:1, 1:N, N:N 관계 지원 효과적이고 빠른 데이터 추출 가능 , 복잡한 내부 포인터 사용 || 모든 구조를 이해해야함

관계형DBMS : 모든데이터는 테이블로 저장 , 기본키와 외래키를 사용하여 관계유지, 다른DBMS에 비해 업무 변화에 따라 바로 순응 할 수 있고 유지 보수 측면에서도 편리
		대용량 데이터를 체계적 관리 가능, 데이터의 무결성도 보장, 시스템 자원을 많이 차지하여 시스템이 전반적으로 느려지는 단점이 있음

```

```

	SQL의 개요

SQL - 데이터베이스를 조작하는 언어

***********************************************

	SQL 특징 

1. 독립적

2. 이식성이 좋음

3. 표준이 계속 발전

4. 대화식 언어

5. 클라이언트/서버 구조 지원

**********************************************

```
```
	MySQL 기본적 쿼리문 익히기

<SELECT ... FROM>

원하는 데이터를 가져와 주는 기본적인 구문

가장 많이 사용되는 구문

데이터베이스 내 테이블에서 원하는 정보 추출하는 기능

SELECT 열이름 FROM 테이블이름 WHERE 조건


USE구문

USE 데이터베이스_이름


SELECT 와 FROM

USE DB_NAME
SELECT * FROM titles || SELECT * FROM DB_NAME.titles

SELECT 열 이름

테이블에서 필요로 하는 열만 가져오기 가능
여러 개의 열을 가져오고 싶을 때는 콤마로 구분
열 이름의 순서는 출력하고 싶은 순서대로 배열 가능

SHOW DATABASES - 현재 서버에 어떤 DB가 있는지 보여줌

SHOW TABLE STATUS - 테이블 정보 조회

SHOW TABLES - 테이블 이름만 간단히 보기

DESCRIBE DB_NAME || DESC_DB_NAME - 테이블의 열이 무엇이 있는지 확인

	DB 초기화

DROP DATABASE IF EXISTS dbName; - dbName이 있으면 삭제

CREATE DATABASE dbName;

계속 사용할 쿼리는 SQL파일로 저장해서 재사용가능
파일 내용을 불러다 쓰기 전에 모든 쿼리창을 닫아야함

특정 조건의 테이터만 조회 - <SELECT FROM WHERE>

조회하는 결과에 특정한 조건을 줘서 원하는 데이터만 보고 싶은 경우

SELECT 필드명 FROM 테이블이름 WHERE 조건식;

	관계연산자의 사용

~~했거나 , 또는 --> OR

~~하고 , 면서, 그리고 --> AND

!= --> NOT


	테이블 생성

CREATE TABLE 테이블 이름 (필드 이름1 자료형1, 필드 이름2 자료형2)

CREATE TABLE member(
id int NOT NULL AUTO_INCREMENT,

name VARCHAR(100) not null,
passwd BARCHAR(50) not null,
PROMARY KEY(id)
);

char(100) 와 varchar(100) 의 차이
char(100)의 경우 100개의 메모리를 차지하지만
varchar(100)의 경우 자동으로 메모리를 저장 (1개가 들어올경우 1개의 자리수로 저장됨)

	테이블 관련 명령어

테이블 구조 변경하기

ALTER TABLE 테이블 이름

[ ADD 필드 이름 자료형 |
 DROP COLUMN 필드 이름 |
 CANGE COLUMN 기존 필드 이름 새 필드 이름 자료형];

ALTER TALBE Member ADD phone varchar(100);

************************************************************************

INSERT 문

INSERT [INTO] 테이블 이름 [(열1,열2...)] VALUES(값1, 값2...)

INSERT 문에서 테이블 이름 다음에 나오는 열 생략 가능

USE DB_Name
CREATE TABLE testTBL1 (idint, userName char(4), age int);
INSERT INTO tableTBL1 VALUES (1,'mina',16);

id와 이름만 입력하고 나이는 입력하지 않을 경우
INSERT INTO testTBL1 (id, userName) VALUES(2,'mina');

열의 순서를 바꾸어 입력

INSERT INTO testTBL1 (userName, age, id) VALUES ('mina',16,3);


	AUTO_INCREMENT

자동으로 1부터 증가하는 값
PRIMARY KEY 또는 UNIQUE 에서만 가능
데이터 형식이 숫자인 열에만 사용가능
INSERT 문에서 NULL값으로 지정하면 자동으로 값이 입력

AUTO_INCREMENT 값을 100부터 시작하도록 하고 싶을때

ALTER TABLE testTBL2 AUTO_INCREMENT= 100;
INSERT INTO testTBL2 VALUES (NULL,'mina',16);
SELECT * FROM TestTBL2;


	UPDATE 문 || 전체 변경시 WHERE문 생략

UPDATE 테이블이름
SET 열1=값1, 열2= 값2
WHERE 조건;

	DELETE 문

DELETE FROM 테이블이름 WHERE 조건 ; 

WHERE절을 생략하면 테이블에 저장된 전체 데이터가 삭제

USE cookDB;
DELETE FROM tetTBL4 WHERE Fname='mina';


***********************************************************

drop talbe if exists member;

CREATE TABLE member(
 id varchar(20) not null primary key,
 pw varchar(20) not null,
 name varchar(30) not null,
 phone varchar(30)
);

************************************************************

```

```

****************************************************

	데이터베이스 생성

drop database if exists testdb;
create database testdb;

****************************************************

	testdb 사용

use testdb;


****************************************************

	members테이블 생성	

drop table if exists members;
create table members(
    id varchar(20) primary key,
    pw varchar(20) not null,
    username varchar(20) not null,
    phone varchar(20)
);


****************************************************

	members테이블에서 모든 열의 데이터를 전부 가져와 출력

select * from members;

****************************************************

	테이블에 데이터를 삽입하는 쿼리	

insert into members values ('mina','1234','miyamoto','010-1234-5678');
insert into members values ('mina1','1234','miyamoto',null);
insert into members values ('mina2','1234','miyamoto','010-1234-5679');
insert into members values ('mina3','1234','miyamoto','010-1234-5678'),('mina4','1234','miyamoto','010-1234-5678');

****************************************************

	테이블에 데이터를 수정하는 쿼리

update members set pw = '7890' where id = 'mina4';

****************************************************

	전테 데이터를 삭제하는 쿼리

delete from members;

****************************************************

	id가 'mina'인 데이터만 삭제하는 쿼리

delete from members where id= 'mina';

****************************************************

	테이블 정보를 보는 쿼리

describe members;
desc members;

****************************************************

	테이블을 수정하는 쿼리 || 컬럼 추가 쿼리

alter table members add column address varchar(100);

****************************************************

	데이터베이스를 삭제하는 쿼리

drop table members;

drop database testdb;

****************************************************

```
