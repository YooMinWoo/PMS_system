DROP TABLE project;

CREATE TABLE project (
	prjno	number		NOT NULL,
	regdte	date		NULL,
	deadline	date		NULL,
	subject	varchar2(500)		NULL,
	tlid	varchar2(50)		NOT NULL,
	deptid	varchar2(30)		NOT NULL,
	openStatus	char(1)		NULL
);

COMMENT ON COLUMN project.openStatus IS 0/1;

DROP TABLE emp;

CREATE TABLE emp (
	id	varchar2(50)		NOT NULL,
	pass	varchar2(15)		NULL,
	ename	varchar2(30)		NOT NULL,
	cell	varchar2(15)		NULL,
	auth	char(1)		NULL,
	deptid	varchar2(30)		NOT NULL,
	hiredate	date		NULL,
	job	varchar2(30)		NULL
);

DROP TABLE dept;

CREATE TABLE dept (
	deptid	varchar2(30)		NOT NULL,
	dname	varchar2(100)		NULL,
	parentDept	varchar2(30)		NULL
);

DROP TABLE calendar;

CREATE TABLE calendar (
	calno	number		NOT NULL,
	title	varchar2(200)		NULL,
	startdte	varchar2(30)		NULL,
	enddte	varchar2(30)		NULL,
	Key	varchar2(50)		NOT NULL,
	textColor	varchar2(20)		NULL,
	backColor	varchar2(20)		NULL,
	allday	number		NULL,
	content	varchar2(100)		NULL
);

DROP TABLE todolist;

CREATE TABLE todolist (
	tdno	number		NOT NULL,
	todo	varchar2(200)		NULL,
	state	char(1)		NULL,
	id	varchar2(50)		NOT NULL
);

DROP TABLE notification;

CREATE TABLE notification (
	notno	number		NULL,
	title	varchar2(200)		NOT NULL,
	cont	varchar2(1000)		NULL,
	url	varchar2(200)		NULL,
	id	varchar2(50)		NOT NULL,
	state	varchar(20)		NULL
);

DROP TABLE mail;

CREATE TABLE mail (
	mailno	number		NOT NULL,
	Field	varchar2(100)		NULL,
	Field2	varchar2(1000)		NULL,
	sender	varchar2(50)		NOT NULL,
	fno	varchar2(30)		NOT NULL,
	sendDte	varchar2(30)		NULL,
	state	number		NULL
);

DROP TABLE comm;

CREATE TABLE comm (
	no	varchar2(30)		NOT NULL,
	refno	number		NULL,
	regdte	date		NULL,
	uptdte	date		NULL,
	title	varchar2(500)		NULL,
	content	varchar2(2000)		NULL,
	viewcnt	number		NULL,
	writer	varchar2(50)		NOT NULL,
	fno2	varchar2(30)		NOT NULL,
	deptid	varchar2(30)		NOT NULL
);

DROP TABLE commRep;

CREATE TABLE commRep (
	no	varchar2(30)		NOT NULL,
	refno	number		NULL,
	content	varchar2(500)		NULL,
	regdte	date		NULL,
	uptdte	date		NULL,
	no2	varchar2(30)		NOT NULL,
	writer	varchar2(50)		NOT NULL
);

DROP TABLE work;

CREATE TABLE work (
	workno	number		NOT NULL,
	regdte	varchar2(30)		NULL,
	uptdte	varchar2(30)		NULL,
	subject	varchar2(200)		NULL,
	cont	varchar2(1000)		NOT NULL,
	id	varchar2(50)		NOT NULL,
	prjno	number		NOT NULL,
	fno	varchar2(30)		NOT NULL,
	hisno	number		NOT NULL,
	Field	number		NULL,
	state	varchar2(10)		NULL
);

DROP TABLE workrep;

CREATE TABLE workrep (
	no	number		NULL,
	repno	number		NULL,
	cont	varchar2(1000)		NULL,
	regdte	date		NULL,
	uptdte	date		NULL,
	id	varchar2(50)		NOT NULL,
	fno	varchar2(30)		NOT NULL,
	workno	number		NOT NULL
);

DROP TABLE history;

CREATE TABLE history (
	hisno	number		NOT NULL,
	repno	number		NULL,
	regdte	date		NULL,
	cont	varchar2(2000)		NULL
);

DROP TABLE file;

CREATE TABLE file (
	fno	varchar2(30)		NOT NULL,
	fname	varchar2(50)		NULL,
	regdte	date		NULL,
	uptdte	date		NULL,
	path	varchar2(200)		NULL
);

DROP TABLE projectMember;

CREATE TABLE projectMember (
	prjno	number		NOT NULL,
	id	varchar2(50)		NOT NULL,
	status	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN projectMember.status IS 초대중, 참여, 거절;

DROP TABLE Untitled;

CREATE TABLE Untitled (
	mailno	number		NOT NULL,
	receiver	varchar2(50)		NOT NULL
);

DROP TABLE approval_doc;

CREATE TABLE approval_doc (
	Key	VARCHAR(255)		NOT NULL
);

DROP TABLE workMember;

CREATE TABLE workMember (
	id	varchar2(50)		NOT NULL,
	workno	number		NOT NULL,
	div	char(1)		NULL
);

DROP TABLE risk;

CREATE TABLE risk (
	riskno	number		NOT NULL,
	risklevel	varchar2(50)		NULL,
	riskpriority	varchar2(50)		NULL,
	riskmoniter	varchar2(50)		NULL,
	riskstate	varchar2(50		NULL,
	riskname	varchar2(100)		NULL,
	id	varchar2(50)		NOT NULL,
	prjno	number		NOT NULL
);

ALTER TABLE project ADD CONSTRAINT PK_PROJECT PRIMARY KEY (
	prjno
);

ALTER TABLE emp ADD CONSTRAINT PK_EMP PRIMARY KEY (
	id
);

ALTER TABLE dept ADD CONSTRAINT PK_DEPT PRIMARY KEY (
	deptid
);

ALTER TABLE calendar ADD CONSTRAINT PK_CALENDAR PRIMARY KEY (
	calno
);

ALTER TABLE todolist ADD CONSTRAINT PK_TODOLIST PRIMARY KEY (
	tdno
);

ALTER TABLE notification ADD CONSTRAINT PK_NOTIFICATION PRIMARY KEY (
	notno
);

ALTER TABLE mail ADD CONSTRAINT PK_MAIL PRIMARY KEY (
	mailno
);

ALTER TABLE comm ADD CONSTRAINT PK_COMM PRIMARY KEY (
	no
);

ALTER TABLE commRep ADD CONSTRAINT PK_COMMREP PRIMARY KEY (
	no
);

ALTER TABLE work ADD CONSTRAINT PK_WORK PRIMARY KEY (
	workno
);

ALTER TABLE workrep ADD CONSTRAINT PK_WORKREP PRIMARY KEY (
	no
);

ALTER TABLE history ADD CONSTRAINT PK_HISTORY PRIMARY KEY (
	hisno,
	repno
);

ALTER TABLE file ADD CONSTRAINT PK_FILE PRIMARY KEY (
	fno
);

ALTER TABLE approval_doc ADD CONSTRAINT PK_APPROVAL_DOC PRIMARY KEY (
	Key
);

ALTER TABLE risk ADD CONSTRAINT PK_RISK PRIMARY KEY (
	riskno
);

ALTER TABLE history ADD CONSTRAINT FK_workrep_TO_history_1 FOREIGN KEY (
	repno
)
REFERENCES workrep (
	no
);

