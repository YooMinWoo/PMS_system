-- # 프로젝트 테이블
DROP TABLE project;

CREATE TABLE project (
	prjno	number		PRIMARY key,
	regdte	varchar2(50)	NOT NULL,
	deadline	varchar2(50)	NOT NULL,
	subject	varchar2(500)		NOT NULL,
	tlid	varchar2(50)		NOT NULL,
	deptid	varchar2(30)		NOT NULL,
	openStatus	char(1)		NOT NULL,
	foreign key(deptid) references dept777(deptid)
    on delete CASCADE,
    foreign key(tlid) references emp777(id)
    on delete CASCADE
);
	SELECT p.*,e.ename FROM project p,emp777 e 
	WHERE 1=1 AND p.tlid=e.ID  
	AND TO_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')>=to_date(p.deadline,'yyyy-mm-dd');
	
	SELECT TO_date(sysdate,'yyyy-mm-dd') FROM dual;

	SELECT p.*,e.ename FROM project p,emp777 e 
	WHERE 1=1 and openstatus='0' AND e.id=p.tlid
	and to_date(p.deadline,'yyyy-mm-dd')>=TO_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd') 
	AND (subject LIKE '%'||''||'%'
	or ename LIKE '%'||''||'%');

	-- 나의 업무 조회
	SELECT d.DNAME,p.SUBJECT ,p.PRJNO,m.PART,m.OWNER , c.cnt
	FROM  PROJECT p, PROJECTMEMBER m, dept777 d,(SELECT prjno,COUNT(*)+1 cnt FROM projectmember GROUP BY prjno) c
	WHERE 1=1 AND p.PRJNO =m.PRJNO AND m.OWNER ='emp1@gmail.com'
	AND d.DEPTID =p.DEPTID
	AND c.prjno=p.PRJNO ;
	
	SELECT prjno,COUNT(*)+1 FROM projectmember GROUP BY prjno; 
	
	SELECT p.prjno,p.subject,p.tlid,p.deptid
	FROM project p,PROJECTMEMBER m
	WHERE m.PRJNO =p.PRJNO ;
	
	
SELECT * FROM PROJECT;
-- openStatus 0이면 전체 공개 1이면 멤버공개
INSERT INTO project values(pro_seq.nextval,sysdate,to_date('2023-03-30','yyyy-mm-dd'),'첫번째 프로젝트','admin1@gmail.com','10','0');
INSERT INTO project values(pro_seq.nextval,'2023-02-01','2023-02-25','지난 프로젝트3','admin1@gmail.com','10','0');
SELECT * FROM project;
-- 전체 프로젝트(전체공개) & 진행중인 프로젝트 검색
SELECT p.*,e.ename FROM project p,emp777 e 
WHERE openstatus='0' AND e.id=p.tlid AND to_date(p.deadline,'yyyy-mm-dd')>=sysdate
AND (subject LIKE '%'||'리'||'%'
or ename LIKE '%'||'리'||'%')
;
CREATE SEQUENCE pro_seq
START WITH 1
MINVALUE 1;
SELECT PRO_SEQ.CURRVAL FROM DUAL;
COMMENT ON COLUMN project.openStatus IS 0/1;
DELETE FROM project;
-- # 프로젝트 멤버 테이블
DROP TABLE projectMember;

CREATE TABLE projectMember (
	prjno	number		NOT NULL,
	owner	varchar2(50)		NOT NULL,
	part	varchar2(100)		NOT NULL,
	foreign key(prjno) references project(prjno)
    on delete CASCADE,
    foreign key(owner) references emp777(id)
    on delete CASCADE
);
SELECT * FROM emp777;
SELECT deptid, dname FROM dept777;
SELECT e.id, e.ename, e.job, d.dname FROM emp777 e, dept777 d;
SELECT * FROM project;
INSERT INTO projectMember values(20,'emp2@gmail.com','마케팅');
SELECT * FROM projectMember;
ALTER TABLE projectMember ADD CONSTRAINT PK_ProjectMember PRIMARY KEY (
	prjno,owner
);
SELECT * FROM project p, projectmember m WHERE p.prjno=m.prjno;
-- # 사원 테이블
DROP TABLE emp777;
--emp auth 1이면 사원
INSERT INTO emp777 values('emp1@gmail.com','emp1','홍사원','010-2222-1111','1','10',sysdate,'사원');
INSERT INTO emp777 values('emp2@gmail.com','emp2','박사원','010-2124-1111','1','10',sysdate,'사원');
INSERT INTO emp777 values('emp3@gmail.com','emp3','금사원','010-3435-1111','1','10',sysdate,'사원');
INSERT INTO emp777 values('admin1@gmail.com','admin1','김관리','010-1111-2222','1','10',sysdate,'PM');
UPDATE emp777 SET auth='1' WHERE ename='김관리';
DELETE FROM emp777 WHERE ename='김관리';
SELECT * FROM emp;
select * FROM emp777;
CREATE TABLE emp777 (
	id	varchar2(50)	PRIMARY key,
	pass	varchar2(15)		NULL,
	ename	varchar2(30)		NOT NULL,
	cell	varchar2(15)		NULL,
	auth	char(1)		NULL,
	deptid	varchar2(30)		NOT NULL,
	hiredate	date		NULL,
	job	varchar2(30)		NULL,
	foreign key(deptid) references dept777(deptid)
    on delete cascade
);
-- # 부서 테이블
DROP TABLE dept777;
INSERT INTO dept777 VALUES('10','IT','');
CREATE TABLE dept777 (
	deptid	varchar2(30)		PRIMARY key,
	dname	varchar2(100)		NULL,
	parentDept	varchar2(30)		NULL
);
SELECT * FROM dept777;


-- ##간트차트
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
ALTER TABLE gantt ADD (description varchar2(4000));
-- 업무내용 추가함
ALTER TABLE gantt MODIFY parent varchar2(100);
ALTER TABLE gantt RENAME COLUMN startDate TO start_date;
INSERT INTO gantt values(gantt_seq.nextval,'테스트프로젝트1','gantt.config.types.project','2023-03-01',0,NULL,NULL,NULL,1,55);
INSERT INTO gantt values(gantt_seq.nextval,'테스트업무1','gantt.config.types.task','2023-03-01',0,'홍사원',23,8,null,55);
INSERT INTO gantt values(gantt_seq.nextval,'테스트업무2','gantt.config.types.task','2023-03-05',0,'금사원',23,7,null,55);
INSERT INTO gantt values(gantt_seq.nextval,'테스트업무3','gantt.config.types.task','2023-03-07',0,'금사원',23,5,null,55);

SELECT * FROM gantt;

DELETE FROM gantt;
update gantt set text='수정테스트',
start_date='Sun Mar 05 2023 00:00:00 GMT 0900 (한국 표준시)', 
progress=0.6, owner='금사원', 
parent=26 , duration=6 where id=29;
SELECT g.*,p.TLID  FROM gantt g, project p WHERE g.PRJNO =p.PRJNO AND p.prjno=55 ORDER BY START_date;
SELECT g.*,l.*,p.TLID  FROM gantt g, project p,link l WHERE g.PRJNO =p.PRJNO AND l.gid=g.id AND p.prjno=55;
DROP TABLE link;
CREATE TABLE link(
	id varchar2(100) PRIMARY KEY,
	source varchar2(100),
	target varchar2(100),
	type varchar2(1),
	prjno NUMBER,
	foreign key(prjno) references project(prjno)
    on delete CASCADE,
    foreign key(source) references gantt(id)
    on delete CASCADE,
    foreign key(target) references gantt(id)
    on delete CASCADE
);
DELETE FROM link;
SELECT * FROM link;
SELECT * FROM project p, gantt g, link l WHERE p.PRJNO =g.prjno AND p.prjno=l.prjno;
SELECT * FROM gantt g, link l WHERE g.id=l.gid;
SELECT * FROM PROJECT p, gantt g WHERE p.prjno=g.prjno;
DROP SEQUENCE gantt_seq;
CREATE SEQUENCE gantt_seq
START WITH 1
MINVALUE 1;
CREATE SEQUENCE link_seq
START WITH 1
MINVALUE 1;

SELECT * FROM project;