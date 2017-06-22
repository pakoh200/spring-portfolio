DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS(
id int(11) not null auto_increment,
userId varchar(12) null UNIQUE,
password varchar(12) null,
name varchar(255) null,
email varchar(50) UNIQUE,
authority varchar(20) null,
primary key (id));