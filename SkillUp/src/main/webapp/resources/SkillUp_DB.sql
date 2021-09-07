CREATE DATABASE skillup;

DROP TABLE IF EXISTS tbl_comment;

DROP TABLE IF EXISTS tbl_board;

DROP SEQUENCE IF EXISTS seq_tbl_comment;

DROP SEQUENCE IF EXISTS seq_tbl_board;

CREATE SEQUENCE seq_tbl_board START 1;

CREATE SEQUENCE seq_tbl_comment START 1;

CREATE TABLE tbl_board
(
  pno INT PRIMARY KEY DEFAULT nextval('seq_tbl_board'),
  bno INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  pass VARCHAR(100) NOT NULL,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(4000) NOT NULL,
  regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modidate TIMESTAMP DEFAULT NULL,
  ccnt INT DEFAULT 0,
  hit INT DEFAULT NULL
);

CREATE TABLE tbl_comment
(
  cno INT PRIMARY KEY DEFAULT nextval('seq_tbl_comment'),
  pno INT REFERENCES tbl_board,
  cname VARCHAR(50) NOT NULL,
  cpass VARCHAR(100) NOT NULL,
  ccontent VARCHAR(200) NOT NULL,
  regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modidate TIMESTAMP DEFAULT NULL
);

select max(pno) from tbl_board;
