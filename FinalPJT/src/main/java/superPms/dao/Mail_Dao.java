package superPms.dao;

import java.util.List;

import superPms.vo.Mail;
import superPms.vo.MailFile;
import superPms.vo.MailSch;
import superPms.vo.SuperEmpDept;

public interface Mail_Dao {
	
	public void insSender(Mail ins);
	public void insReceiver(Mail ins);
	public void insertUploadFile(MailFile f);
	public List<Mail> mySendMail(MailSch schs);
	public Mail sendDetail(int mailno);
	public Mail receiveDetail(int mailno);
	
	public String getMailFile(int mailfno);
	public List<Mail> myReceiveMail(MailSch sch);
	public void uptSendState(int mailno);
	public void uptReceiveState(int mailno);
	
	public void delSendMail(int mailno);
	public void delReceiveMail(int mailno);
	public void delFile(int mailno);
	
	public int totCntSend(MailSch sch);
	public int totCntReceive(MailSch sch);
	
	
	
}
