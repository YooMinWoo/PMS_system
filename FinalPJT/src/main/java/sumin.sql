
CREATE TABLE emp777 (
	id	varchar2(50)	NOT NULL,
	pass	varchar2(15)	NULL,
	ename	varchar2(30)	NOT NULL,
	cell	varchar2(15)	NULL,
	auth	char(1)	NULL,
	deptid	varchar2(30)	NOT NULL,
	hiredate	date	NULL,
	job	varchar2(30)	NULL
);
INSERT INTO emp777 values('sss111@ssangyong.com','7777','이수진','01012345678','0','1000','2020-01-05','사원');
CREATE TABLE calendar777 (
	calno	number	NOT NULL,
	title	varchar2(200)	NULL,
	startdte	varchar2(30)	NULL,
	enddte	varchar2(30)	NULL,
	id	varchar2(50)	NOT NULL,
	textColor	varchar2(20)	NULL,
	backColor	varchar2(20)	NULL,
	allday	number	NULL,
	content	varchar2(100)	NULL,
	url varchar2(100)
);
ALTER TABLE calendar777 ADD url varchar2(100);
CREATE SEQUENCE cal777
	START WITH 1
	MINVALUE 1;
INSERT INTO calendar777 values(cal777.nextval,'일정1','2023-02-16T09:00:00','2023-02-23T09:00:00','sss111@ssangyong.com',
		'navy','pink','0','내용1','http://naver.com');
SELECT * FROM CALENDAR777 c ;
	
CREATE TABLE dept777 (
	deptid	varchar2(30)	NOT NULL,
	dname	varchar2(100)	NULL,
	parentDept	varchar2(30)	NULL
);
INSERT INTO dept777 values('1000','개발1팀','IT');