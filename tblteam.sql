USE mydb2;

create table tblTeam(
 num int primary key auto_increment,
 name char(10) not null,
 city char(10) not null,
 age int default 0,
 team char(10) not null
);

INSERT INTO tblteam VALUES(NULL,"조영문","서울",27,"백수");

UPDATE tblteam SET team = "인자위" WHERE num=1;

DELETE FROM tblteam WHERE num=4;

SELECT * 
FROM tblteam
WHERE num=1;