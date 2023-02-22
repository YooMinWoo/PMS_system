CREATE TABLE superEmp (
	id	varchar2(50)	NOT NULL,
	pass	varchar2(15)	NULL,
	ename	varchar2(30)	NOT NULL,
	cell	varchar2(15)	NULL,
	auth	char(1)	NULL,
	deptid	varchar2(30)	NOT NULL,
	hiredate	date	NULL,
	job	varchar2(30)	NULL
);
DELETE FROM superEmp WHERE job='ceo';
SELECT * FROM superEmp ORDER by auth;
INSERT INTO superEmp values('imadmin@gmail.com','admin1234!','김관리','010-1111-2222',0,'de100','2018-03-20','과장'); /*관리자*/
INSERT INTO superEmp values('monsta@gmail.com','monbebe001','임창균','010-4482-9879',2,'de101','2020-12-02','대리'); /*pm*/
INSERT INTO superEmp values('imceo@gmail.com','777ceo!','이회장','010-1090-8875',1,'ceo','2010-03-03','ceo'); /*ceo*/
INSERT INTO superEmp values('xxxyuu@google.com','t711txt0703','유기현','010-3044-0082',4,'ma200','2020-12-02','대리'); /*일반사원*/
INSERT INTO superEmp values('t711txt@gmail.com','ssangyong33','김은빈','010-8547-4226',3,'de101','2022-03-21','사원'); /*프로젝트멤버*/
INSERT INTO superEmp values('rabbit@gmail.com','animallove11','김도영','010-4522-5678',3,'de101','2022-12-28','사원'); /*프로젝트멤버*/
INSERT INTO superEmp values('person1004@gmail.com','god100034!','신리나','010-2656-0943',3,'de101','2022-03-21','사원'); /*프로젝트멤버*/
INSERT INTO superEmp values('randlod@gmail.com','num9234','배수지','010-9123-3458',3,'de101','2021-12-20','사원'); /*프로젝트멤버*/
INSERT INTO superEmp values('yesman@gmail.com','nonono4456!!','정재현','010-7804-3456',3,'de101','2021-12-20','사원'); /*프로젝트멤버*/

CREATE TABLE superDept (
	deptid	varchar2(30)	NOT NULL,
	dname	varchar2(100)	NULL,
	parentDept	varchar2(30)	NULL
);
SELECT * FROM superDept;
INSERT INTO superDept values('ceo','최고경영진',null);
INSERT INTO superDept values('de100','개발',null);
INSERT INTO superDept values('de101','개발1','de100');
INSERT INTO superDept values('de102','개발2','de100');
INSERT INTO superDept values('de103','개발3','de100');
INSERT INTO superDept values('ma200','마케팅',null);
INSERT INTO superDept values('ma201','마케팅1','ma200');
INSERT INTO superDept values('hr300','인사',null);
INSERT INTO superDept values('ac400','회계',null);


ALTER TABLE superEmp ADD CONSTRAINT PK_superEmp PRIMARY KEY (
	id
);

ALTER TABLE superDept ADD CONSTRAINT PK_superDept PRIMARY KEY (
	deptid
);

ALTER TABLE superEmp ADD CONSTRAINT FK_superDept_TO_superEmp_1 FOREIGN KEY (
	deptid
)
REFERENCES superDept (
	deptid
);