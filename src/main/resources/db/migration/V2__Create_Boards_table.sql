
CREATE TABLE BOARDS(
num int(11) not null auto_increment,
title varchar(60) not null,
name varchar(255) not null,
contents varchar(300) not null,
createDate timestamp,
count int not null,
primary key(num));

