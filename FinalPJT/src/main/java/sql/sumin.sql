INSERT INTO dept values('de101','개발1','de100');
INSERT INTO emp values('monsta@gmail.com','monbebe001','임창균','010-4482-9879',2,'de101','2020-12-02','대리');
SELECT * FROM calendar;
INSERT INTO calendar values(cal_seq.nextval,'일정1','2023-02-16T09:00:00','2023-02-18T09:00:00','monsta@gmail.com',
	'navy','yellow','0','내용1','http://naver.com');

SELECT * FROM TODOLIST t ;
INSERT INTO todolist values(todo_seq.nextval,'중간발표피피티작성','0','monsta@gmail.com'); -- 0 : 미완료/ 1: 완료
INSERT INTO todolist values(todo_seq.nextval,'2차중간발표','1','monsta@gmail.com');
UPDATE todolist SET state='1' WHERE tno='1';
DELETE FROM todolist WHERE tno='1'; 
ALTER TABLE todolist ADD regdte varchar2(15);
INSERT INTO todolist values(todo_seq.nextval,'2차중간발표','0','monsta@gmail.com',sysdate);
update todolist 
			set todo='수정'
		where tno='28';
SELECT * FROM alert;
SELECT * FROM alert WHERE id='monsta@gmail.com';
INSERT INTO alert values(alert_seq.nextval,'프로젝트 참여알림','새 프로젝트에 참여되었습니다','calList.do','monsta@gmail.com','읽지않음','primary');
INSERT INTO alert values(alert_seq.nextval,'메일 알림','새 메일이 도착했습니다','calList.do','monsta@gmail.com','읽지않음','success');

ALTER TABLE alert ADD style varchar2(15);
UPDATE alert SET state='읽음' WHERE id='monsta@gmail.com';
SELECT count(no) alertCount FROM alert WHERE id='monsta@gmail.com' AND state='읽지않음';
INSERT INTO alert values(alert_seq.nextval,'일정 알림','새 일정이 등록되었습니다',
	'calList.do','monsta@gmail.com','읽지않음','danger');

UPDATE alert SET state='읽음' WHERE no='1';
SELECT * FROM emp;
SELECT * FROM mail;
SELECT * FROM RECEIVER r;
SELECT * FROM mailfile;

ALTER TABLE mail ADD fileNo number;
ALTER TABLE mail ADD fileName varchar2(30);
ALTER TABLE mail DROP COLUMN fileName;

CREATE SEQUENCE fileNo_seq
	START WITH 1
	MINVALUE 1;
INSERT INTO mail values(mail_seq.nextval,'새 프로젝트 초대','프로젝트 멤버에 초대되었습니다. 일정을 확인해주세요',
'monsta@gmail.com',sysdate,0,fileNo_seq.nextval,null);
SELECT * FROM RECEIVER r;
INSERT INTO RECEIVER values(1,'higirl@gmail.com');

CREATE TABLE mailFile(
	mailFno NUMBER,
	fname varchar2(50),
	regdte date
);
DELETE FROM mail WHERE sender='monsta@gmail.com';
SELECT m.*,r.RECEIVER FROM mail m,RECEIVER r  WHERE sender='monsta@gmail.com' AND m.MAILNO = r.MAILNO ;

SELECT m.*,r.receiver FROM mail m,RECEIVER r WHERE m.MAILNO =1 AND m.MAILNO = r.MAILNO;
ALTER TABLE RECEIVER  MODIFY content varchar2(600);
SELECT * FROM RECEIVER r ;
SELECT * FROM calendar;
SELECT fname FROM MAILFILE where mailfno=8;
SELECT m.*,receiver FROM mail m,receiver r WHERE m.MAILNO = r.mailno AND receiver='higirl@gmail.com' AND r.mailno=21;
SELECT * FROM mail;
SELECT * FROM RECEIVER r;
UPDATE mail SET state = 1 WHERE mailno = 21;
DELETE FROM mail WHERE SENDER ='monsta@gmail.com';
DELETE FROM receiver WHERE receiver ='higirl@gmail.com';
DELETE FROM mailfile WHERE mailfno=21;
SELECT * FROM RECEIVER;
SELECT * FROM MAILFILE m;
ALTER TABLE RECEIVER  DROP CONSTRAINT FK_receiver_2;
ALTER TABLE mail  ADD receiver varchar2(30);


--보낸 메일함
SELECT * FROM mail WHERE sender='monsta@gmail.com';
--보낸 메일함 상세
SELECT * FROM mail WHERE mailno=27;
--받은 메일함
SELECT * FROM receiver WHERE receiver='monsta@gmail.com';
--받은 메일함 상세
SELECT * FROM RECEIVER WHERE mailno=30;

SELECT count(*) FROM RECEIVER r  WHERE RECEIVER ='monsta@gmail.com';


 select * from (
         select rownum cnt, m.*
         FROM mail m
         where 1=1
         and sender='monsta@gmail.com'
        )
      where cnt between 1 and 5;
      
ALTER TABLE receiver MODIFY content varchar2(3000);