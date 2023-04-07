CREATE TABLE 'tblRegister'(
	'username' CHAR(20) NOT NULL,
	'password' CHAR(20) NOT NULL,
	'grade' INT NOT NULL COMMENT '손님, 로그인유저, 관리자',
	'address' CHAR(30) NOT NULL,
	'sex' CHAR(10),
	'email' CHAR(20) NOT NULL,
	'date' DATE NOT NULL,
	PRIMARY KEY ('username')
);

CREATE TABLE 'tblOrder'(
	'orderNum' INT AUTO_INCREMENT,
	'pno' INT NOT NULL,
	'productCount' INT NOT NULL,
	'username' CHAR(20) NOT NULL,
	'date' DATE NOT NULL,
	'state' CHAR(20),
	PRIMARY KEY ('orderNum'),
	FOREIGN KEY ('username') REFERENCES tblRegister(username),
	FOREIGN KEY ('pno') REFERENCES tblproduct(pno)
)
