CREATE TABLE project (
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
SELECT * FROM BOARD b ;
INSERT INTO risk VALUES (6660126, '높음', '1', '땡땡씨', '대기','이 문제가 무엇인가 ?', 'qwer@naver.com', 3330001);
SELECT * FROM risk r
ORDER BY RISKNO DESC ;
DELETE FROM RISK
WHERE RISKNO =46;
		select * from Risk
		order by riskno DESC;
/*CREATE SEQUENCE risk_seq
START WITH 1
MINVALUE 1;*/
SELECT * FROM project;
INSERT INTO risk VALUES (risk_seq.nextval, '보통', '2', '땡땡씨', '발생','내일 점심은 무엇을 먹죠?', 'monsta@gmail.com', 22);
SELECT * FROM PROJECT;
SELECT * FROM EMP;
CREATE SEQUENCE risk_seq
START WITH 1
MINVALUE 1;
		select * from Risk
		order by riskpriority;
SELECT * FROM emp;
SELECT * FROM project;
SELECT * FROM dept;
INSERT INTO PROJECT VALUES (pro_seq.nextVal,sysdate,sysdate+30,'프로젝트 예시','monsta@gmail.com',10008,'1');
select *
from
    (select rownum as rn, A.*
    from
        (select *
        from RISK r 
        where riskno>0
        order by riskno desc
        ) A
    )
where rn between 1 and 5;

SELECT * from
(SELECT rownum cnt, A.* FROM 
(SELECT * FROM risk
WHERE riskno>0
ORDER BY riskno DESC)A ) T
WHERE cnt BETWEEN 6 AND 8; 

SELECT cnt, A.* FROM
(SELECT COUNT(*) cnt FROM risk WHERE riskno>0 ) cnt,
(SELECT * FROM risk WHERE riskno>0) A;
WHERE cnt BETWEEN 1 AND 5;

select *
from
    (select rownum as cnt, A.*
    from
        (select *
        from RISK
        where riskno>0
        order by riskno desc
        ) A
    )
where cnt between 3 and 5;
SELECT * FROM RISK r ;
SELECT * FROM solution;
ALTER TABLE risk DROP COLUMN risksolution;

SELECT * FROM EMP;

UPDATE risk 
SET risklevel = '보통' 
WHERE id IN (
  SELECT id
  FROM emp 
  WHERE id = 'monsta@gmail.com' 
    AND auth = 2
);

		SELECT DISTINCT e.mgr key, m.ename val
		FROM emp100 e, emp100 m
		WHERE e.mgr = m.empno	;
SELECT * FROM emp;
/*
select *
from
    (select rownum cnt rn, A.*
    from
        (select *
        from RISK r 
        where riskno>0
        order by riskno desc
        ) A
    )
where cnt between #{start} and #{end}

*/
SELECT * FROM emp;
SELECT * FROM PROJECT p ;
SELECT * FROM RISK r ;
INSERT INTO RISK (riskno, risklevel, riskpriority,
riskstate, riskname, id, prjno) VALUES
(risk_seq.nextval, 
'긴급',  '1', '발생', 
'이 프로젝트에 투입된 인원이 적다', 'monsta@gmail.com', 23);
		update risk
		set
			risklevel = '긴급',
			riskpriority = '1',
			riskmoniter = '김은빈',
			riskstate = 'PM담당',
			riskname = '수정이 잘 되는가 ?'
	   where riskno = 47;