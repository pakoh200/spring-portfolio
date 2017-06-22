CREATE TABLE SNS_INFO (
  id int(11) NOT NULL,
  sns_id varchar(255) NOT NULL,
  sns_type varchar(10) NULL,
  sns_name varchar(255) NULL,  
  CONSTRAINT id FOREIGN KEY (id) REFERENCES USERS (id)
);