DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS(
userId varchar(12) not null,
password varchar(12) not null,
name varchar(30) not null,
email varchar(50),
authority varchar(20) not null,
primary key (userId));

insert into USERS values('test', 'test','test','test@test.test', 'ROLE_USER');
insert into USERS values('admin', 'admin','admin','admin@test.test', 'ROLE_ADMIN');

DROP TABLE IF EXISTS BOARDS;

CREATE TABLE BOARDS(
num int(8) not null auto_increment,
title varchar(60) not null,
userId varchar(12) not null,
contents varchar(300) not null,
createDate timestamp,
count int not null,
primary key(num));

insert into BOARDS(title, userId, contents, createDate, count)
values('alpa','userId', 'abcdefghijklmnopqrstuvwxyz', CURRENT_TIMESTAMP(), 0);
