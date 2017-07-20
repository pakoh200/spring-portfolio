
CREATE TABLE ANSWER (
  id int(11) NOT NULL auto_increment,
  writer varchar(255) NOT NULL,
  contents clob NOT NULL, 
  boardId int(11) NOT NULL,
  createDate timestamp,
  primary key(id),
  CONSTRAINT fk_writer_user FOREIGN KEY (writer) REFERENCES USERS (name) ON UPDATE CASCADE,
  CONSTRAINT fk_id FOREIGN KEY (boardId) REFERENCES BOARDS (num) ON DELETE CASCADE
);
