﻿CREATE TABLE project (
	prjno	number		PRIMARY KEY,
	regdte	date		NULL,
	deadline	date		NULL,
	subject	varchar2(500)		NULL,
	tlid	varchar2(50)		NOT NULL,
	deptid	varchar2(30)		NOT NULL,
	openStatus	char(1)		NULL
);
CREATE TABLE emp0126 (
	id	varchar2(50)		PRIMARY KEY,
	pass	varchar2(15)		NULL,
	ename	varchar2(30)		NOT NULL,
	cell	varchar2(15)		NULL,
	auth	char(1)		NULL,
	deptid	varchar2(30)		NOT NULL,
	hiredate	date		NULL,
	job	varchar2(30)		NULL
);


CREATE TABLE risk (
	riskno	number		PRIMARY KEY,
	risklevel	varchar2(50)		NULL,
	riskpriority	varchar2(50)		NULL,
	riskmoniter	varchar2(50)		NULL,
	riskstate	varchar2(50)		NULL,
	riskname	varchar2(100)		NULL,
	id	varchar2(50)		NOT NULL,
	prjno	number		NOT NULL
);

INSERT INTO risk VALUES (6660126, '높음', '1', '땡땡씨', '대기','이 문제가 무엇인가 ?', 'qwer@naver.com', 3330001);
DELETE FROM risk
WHERE RISKNO =6660126;
SELECT * FROM risk;