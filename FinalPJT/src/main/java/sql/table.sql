CREATE TABLE dept (
	deptid	varchar2(30) PRIMARY KEY,
	dname	varchar2(100),
	parentDept	varchar2(30)	
);

CREATE TABLE emp (
	id	varchar2(50) PRIMARY KEY,
	pass	varchar2(15),
	ename	varchar2(30),
	cell	varchar2(15),
	auth	char(1),
	deptid	varchar2(30),
	hiredate	date,
	job	varchar2(30)
);

ALTER TABLE emp ADD CONSTRAINT FK_EMP FOREIGN KEY(deptid)
references dept(deptid) on delete CASCADE;


CREATE TABLE files (
	fno	varchar2(30) PRIMARY KEY,
	fname	varchar2(50),
	regdte	date,
	uptdte	date,
	path	varchar2(200)
);

CREATE SEQUENCE files_seq
START WITH 1
MINVALUE 1;

CREATE TABLE calendar (
	id	number	PRIMARY key,
	title	varchar2(200),
	startdte	varchar2(30),
	enddte	varchar2(30),
	writer	varchar2(50),
	textColor	varchar2(20),
	backgroundColor	varchar2(20),
	allDay	number,
	content	varchar2(100),
	url varchar2(1000)
);

CREATE SEQUENCE cal_seq
START WITH 1
MINVALUE 1;

ALTER TABLE calendar ADD CONSTRAINT FK_calendar FOREIGN KEY(writer)
references emp(id) on delete CASCADE;

CREATE TABLE todolist (
	tno	NUMBER PRIMARY key,
	todo	varchar2(200),
	state	char(1),
	id	varchar2(50)
);

CREATE SEQUENCE todo_seq
START WITH 1
MINVALUE 1;

ALTER TABLE todolist ADD CONSTRAINT FK_todolist FOREIGN KEY(id)
references emp(id) on delete CASCADE;


CREATE TABLE mail (
	mailno	number	PRIMARY KEY,
	title	varchar2(100),
	content	varchar2(1000),
	sender	varchar2(50),
	fno	varchar2(30),
	sendDte	varchar2(30),
	state	number
);

ALTER TABLE mail ADD CONSTRAINT FK_mail FOREIGN KEY(sender)
references emp(id) on delete CASCADE;
ALTER TABLE mail ADD CONSTRAINT FK_mail_2 FOREIGN KEY(fno)
references files(fno) on delete CASCADE;

CREATE SEQUENCE mail_seq
START WITH 1
MINVALUE 1;

CREATE TABLE receiver (
	mailno	NUMBER,
	receiver varchar2(50)
);

ALTER TABLE receiver ADD CONSTRAINT FK_receiver FOREIGN KEY(receiver)
references emp(id) on delete CASCADE;
ALTER TABLE receiver ADD CONSTRAINT FK_receiver_2 FOREIGN KEY(mailno)
references mail(mailno) on delete CASCADE;

CREATE TABLE alert (
	no	number	PRIMARY KEY,
	title	varchar2(200),
	content	varchar2(1000),
	url	varchar2(200),
	id	varchar2(50),
	state	varchar(20)
);

CREATE SEQUENCE alert_seq
START WITH 1
MINVALUE 1;

ALTER TABLE alert ADD CONSTRAINT FK_alert FOREIGN KEY(id)
references emp(id) on delete CASCADE;


CREATE TABLE notice (
	noticeno NUMBER PRIMARY KEY,
	refno	number,
	regdte	date,
	uptdte	date,
	title	varchar2(500),
	content	varchar2(2000),
	viewcnt	number,
	writer	varchar2(50),
	fno	varchar2(30),
	deptid	varchar2(30)
);

CREATE SEQUENCE notice_seq
START WITH 1
MINVALUE 1;


ALTER TABLE notice ADD CONSTRAINT FK_notice_1 FOREIGN KEY(writer)
references emp(id) on delete CASCADE;
ALTER TABLE notice ADD CONSTRAINT FK_notice_2 FOREIGN KEY(fno)
references files(fno) on delete CASCADE;
ALTER TABLE notice ADD CONSTRAINT FK_notice_3 FOREIGN KEY(deptid)
references dept(deptid) on delete CASCADE;


CREATE TABLE noticeRep (
	repno	NUMBER PRIMARY KEY ,
	refno	number,
	content	varchar2(500),
	regdte	date,
	uptdte	date,
	noticeno NUMBER,
	writer	varchar2(50)
);

CREATE SEQUENCE noticeRep_seq
START WITH 1
MINVALUE 1;


ALTER TABLE noticeRep ADD CONSTRAINT FK_noticeRep_1 FOREIGN KEY(noticeno)
references notice(noticeno) on delete CASCADE;
ALTER TABLE noticeRep ADD CONSTRAINT FK_noticeRep_2 FOREIGN KEY(writer)
references emp(id) on delete CASCADE;

CREATE TABLE project (
	prjno	number		PRIMARY key,
	regdte	varchar2(50),
	deadline	varchar2(50),
	subject	varchar2(500),
	tlid	varchar2(50),
	deptid	varchar2(30),
	openStatus	char(1),
	foreign key(deptid) references dept(deptid)
    on delete CASCADE,
    foreign key(tlid) references emp(id)
    on delete CASCADE
);

CREATE SEQUENCE pro_seq
START WITH 1
MINVALUE 1;

CREATE TABLE projectMember (
	prjno	number		NOT NULL,
	owner	varchar2(50)		NOT NULL,
	part	varchar2(100)		NOT NULL,
	foreign key(prjno) references project(prjno)
    on delete CASCADE,
    foreign key(owner) references emp(id)
    on delete CASCADE
);
ALTER TABLE projectMember ADD CONSTRAINT PK_ProjectMember PRIMARY KEY (
	prjno,owner
);

CREATE TABLE work (
	workno	number	PRIMARY KEY,
	regdte	varchar2(30),
	enddte	varchar2(30),
	subject	varchar2(200),
	cont	varchar2(1000),
	id	varchar2(50),
	prjno	number,
	fno	varchar2(30),
	state	varchar2(10)
);

ALTER TABLE work ADD CONSTRAINT FK_work_1 FOREIGN KEY(id)
references emp(id) on delete CASCADE;
ALTER TABLE work ADD CONSTRAINT FK_work_2 FOREIGN KEY(prjno)
references project(prjno) on delete CASCADE;
ALTER TABLE work ADD CONSTRAINT FK_work_3 FOREIGN KEY(fno)
references files(fno) on delete CASCADE;

CREATE SEQUENCE work_seq
START WITH 1
MINVALUE 1;
	
CREATE TABLE workrep (
	no	number		PRIMARY KEY,
	repno	NUMBER,
	cont	varchar2(1000),
	regdte	date,
	uptdte	date,
	id	varchar2(50),
	fno	varchar2(30),
	workno	varchar2(100)
);

CREATE SEQUENCE workrep_seq
START WITH 1
MINVALUE 1;
	

ALTER TABLE workrep ADD CONSTRAINT FK_workrep_1 FOREIGN KEY(id)
references emp(id) on delete CASCADE;
ALTER TABLE workrep ADD CONSTRAINT FK_workrep_2 FOREIGN KEY(workno)
references gantt(id) on delete CASCADE;
ALTER TABLE workrep ADD CONSTRAINT FK_workrep_3 FOREIGN KEY(fno)
references files(fno) on delete CASCADE;	
	
CREATE TABLE history (
	hisno	number,
	regdte	date,
	cont	varchar2(2000),
	workno	number
);

CREATE SEQUENCE history_seq
START WITH 1
MINVALUE 1;

ALTER TABLE history ADD CONSTRAINT FK_history FOREIGN KEY(workno)
references work(workno) on delete CASCADE;

CREATE TABLE workMember (
	id	varchar2(50),
	workno	number,
	div	char(1)
);

ALTER TABLE workMember ADD CONSTRAINT FK_workMember_1 FOREIGN KEY(id)
references emp(id) on delete CASCADE;
ALTER TABLE workMember ADD CONSTRAINT FK_workMember_2 FOREIGN KEY(workno)
references work(workno) on delete CASCADE;

CREATE TABLE risk (
	riskno	number	PRIMARY KEY,
	risklevel	varchar2(50),
	riskpriority	varchar2(50),
	riskmoniter	varchar2(50),
	riskstate	varchar2(50),
	riskname	varchar2(100),
	id	varchar2(50),
	prjno	NUMBER
);

CREATE SEQUENCE risk_seq
START WITH 1
MINVALUE 1;

ALTER TABLE risk ADD CONSTRAINT FK_risk_1 FOREIGN KEY(id)
references emp(id) on delete CASCADE;
ALTER TABLE risk ADD CONSTRAINT FK_risk_2 FOREIGN KEY(prjno)
references project(prjno) on delete CASCADE;
ALTER TABLE risk ADD CONSTRAINT FK_risk_3 FOREIGN KEY(solno)
references solution(solno) on delete CASCADE;

CREATE TABLE solution(
	solno NUMBER PRIMARY KEY,
	solution_content varchar2(4000),
	riskno NUMBER,
	id varchar2(50),
);
ALTER TABLE solution ADD CONSTRAINT FK_solution_1 FOREIGN KEY(riskno)
references risk(riskno) on delete CASCADE;
ALTER TABLE solution ADD CONSTRAINT FK_solution_2 FOREIGN KEY(id)
references emp(id) on delete CASCADE;

DROP TABLE gantt;
CREATE TABLE gantt(
	id varchar2(100) PRIMARY KEY,
	text varchar2(500),
	type varchar2(100),
	start_date varchar2(100),
	progress NUMBER,
	owner varchar2(100),
	parent varchar2(100),
	duration NUMBER,
	OPEN char(1),	--1이면 TRUE, 0 이면 false
	prjno NUMBER,
	foreign key(prjno) references project(prjno)
    on delete CASCADE
);