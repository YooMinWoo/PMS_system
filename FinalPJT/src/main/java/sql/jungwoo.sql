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

SELECT * FROM MAIL m ;

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
SELECT * FROM PROJECTMEMBER p;
SELECT * FROM emp;
SELECT * FROM risk
WHERE PRJNO =23;
SELECT * FROM PROJECT p ;
SELECT * FROM GANTT g ;
SELECT * FROM NOTICEREP n  ;
SELECT * FROM SOLUTION s ;
CREATE SEQUENCE strategy_seq
START WITH 1
MINVALUE 1;
INSERT INTO SOLUTION VALUES(sol_seq.nextval,41,'monsta@gmail.com','Avoidance','인원을 늘리던지 기간을 늘려보겠다',sysdate);
ALTER TABLE SOLUTION ADD solregdate DATE;
SELECT * FROM NOTICEREP n ;
select * FROM emp;
SELECT * FROM PROJECTMEMBER p ;
from
    (select rownum cnt, A.*
    from
        (select *
        from RISK 
        where riskno>0
        and prjno = 23
        AND riskname like '%'||'은'||'%'
        order by riskpriority
        ) A
    )
where cnt between 1 and 5;
SELECT * FROM NOTICEREP n ;	
SELECT * FROM (
		SELECT rownum cnt, S.* FROM (
			SELECT solno, riskno, id, sol_strategy, solution_content, 
						to_char(solregdate,'yyyy-mm-dd') solregdate
			FROM SOLUTION sol, 
			WHERE riskno=41
			ORDER BY solregdate
			) S
		)
		WHERE cnt BETWEEN 1 AND 5;
SELECT * FROM SOLUTION s ;
ALTER TABLE SOLUTION DROP COLUMN sol_strategy;
SELECT * FROM RISK r ;
SELECT * FROM (
			SELECT rownum cnt, s.* FROM (
			SELECT solno, riskno, e.ename, sol_strategy, solution_content, 
						to_char(solregdate,'yyyy-mm-dd') solregdate
			FROM SOLUTION sol, EMP e
			WHERE riskno=
			AND sol.ID =e.ID 
			ORDER BY solregdate
			) S
			)
		WHERE cnt BETWEEN 1 AND 5;
select *
from
    (select rownum cnt, A.*
    from
        (select *
        from RISK 
        where riskno>0
        and prjno = 23
        AND riskname like '%'||''||'%'
        order by riskpriority
        ) A
    )
where cnt between 1 and 10;
SELECT * FROM RISK;
ALTER TABLE risk DROP COLUMN strategyno;
WHERE RISKNO =41;
SELECT s.risk_STRATEGY  FROM risk r, strategy s
WHERE r.RISKNO  = s.riskNO
AND s.riskno=41;
SELECT * FROM PROJECT p  ;
SELECT e.ENAME, e.ID , e.PASS  FROM PROJECTMEMBER p, emp e WHERE PRJNO =82
AND p.OWNER =e.ID;

			SELECT solno, riskno, e.ename, solution_content, 
						to_char(solregdate,'YYYY-MM-DD HH24:MI:SS') solregdate
			FROM SOLUTION sol, EMP e
			WHERE riskno=41
			AND sol.ID =e.ID 
			ORDER BY solregdate;
SELECT * FROM (
			SELECT rownum cnt, s.* FROM (
			SELECT solno, riskno, e.ename, solution_content, 
						to_char(solregdate,'YYYY-MM-DD HH24:MI:SS') solregdate
			FROM SOLUTION sol, EMP e
			WHERE riskno=44
			AND sol.ID =e.ID 
			ORDER BY solregdate
			) S
			)
		WHERE cnt BETWEEN 1 AND 5;
	SELECT * FROM SOLUTION s   ;
INSERT INTO STRATEGY VALUES (strategy_seq.nextval, 44, 'ACCEPTANCE');
	SELECT * FROM STRATEGYCARE s ;
INSERT INTO STRATEGYCARE VALUES (care_seq.nextval,1,'지금 순조로히 처리중입니다.','monsta@gmail.com',sysdate);
update risk
		set
			riskstate = '처리중'
	   where riskno = 53;
SELECT * FROM STRATEGYCARE s ;
SELECT * FROM (
			SELECT rownum cnt, C.* FROM (
			SELECT careno, strategyno, care_content,e.ENAME,
						to_char(caredate,'YYYY-MM-DD HH24:MI:SS') caredate
			FROM STRATEGYCARE s , EMP e
			WHERE strategyno=1
			AND s.ID  =e.ID 
			ORDER BY caredate
			) C
			)
		WHERE cnt BETWEEN 1 AND 5;
SELECT * FROM STRATEGYCARE s ;