drop database if exists testdb;
create database testdb;


use testdb;


drop table if exists members;
create table members(
    id varchar(20) primary key,
    pw varchar(20) not null,
    username varchar(20) not null,
    phone varchar(20)
);


select * from members;

insert into members values ('mina','1234','miyamoto','010-1234-5678');
insert into members values ('mina1','1234','mi',null);
insert into members values ('mina2','1234','ya','010-1234-5679');
insert into members values ('mina3','1234','mo','010-1234-5678'),('mina4','1234','to','010-1234-5678');

update members set pw = '7890' where id = 'mina4';

delete from members;

delete from members where id= 'mina';

describe members;

desc members;

alter table members add column address varchar(100);

drop table members;

drop database testdb;

alter table members drop column phone;

