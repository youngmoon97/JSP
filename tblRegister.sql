DROP TABLE IF EXISTS tblRegister;

CREATE TABLE tblRegister(
	id CHAR(20) NOT NULL,
	pwd CHAR(20) NOT NULL,
	name CHAR(20) NOT NULL,
	profile CHAR(30),
	PRIMARY KEY(id)
);

INSERT INTO tblregister(id,pwd,NAME) VALUES('aaa','1234','조영문');

UPDATE TABLE tblregister