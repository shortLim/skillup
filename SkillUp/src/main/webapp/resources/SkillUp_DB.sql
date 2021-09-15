/* skillupデータベース作成 */
CREATE DATABASE skillup;

/* skillupデータベース選択 */
\c skillup;

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
  pno INT REFERENCES tbl_board ON DELETE CASCADE,
  cname VARCHAR(50) NOT NULL,
  cpass VARCHAR(100) NOT NULL,
  ccontent VARCHAR(200) NOT NULL,
  regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modidate TIMESTAMP DEFAULT NULL
);

/* 新規ポスト35件作成 */
INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'1testMan','1234','1タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'2testMan','1234','2タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'3testMan','1234','3タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'4testMan','1234','4タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'5testMan','1234','5タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'6testMan','1234','6タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'7testMan','1234','7タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'8testMan','1234','8タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'9testMan','1234','9タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'10testMan','1234','10タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'11testMan','1234','11タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'12testMan','1234','12タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'13testMan','1234','13タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'14testMan','1234','14タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'15testMan','1234','15タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'16testMan','1234','16タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'17testMan','1234','17タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'18testMan','1234','18タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'19testMan','1234','19タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'20testMan','1234','20タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'21testMan','1234','21タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'22testMan','1234','22タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'23testMan','1234','23タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'24testMan','1234','24タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'25testMan','1234','25タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'26testMan','1234','26タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'27testMan','1234','27タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'28testMan','1234','28タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'29testMan','1234','29タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'30testMan','1234','30タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'31testMan','1234','31タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'32testMan','1234','32タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'33testMan','1234','33タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'34testMan','1234','34タイトル','内容');

INSERT INTO tbl_board (bno,name,pass,title,content)
VALUES (1,'35testMan','1234','35タイトル','内容');
