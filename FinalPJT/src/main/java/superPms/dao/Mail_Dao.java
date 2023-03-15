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
	
	
	public List<Mail> mySendMail(MailSch sch);
	
	public Mail sendDetail(int mailno);
	
	public Mail receiveDetail(int mailno);
	
	public String getMailFile(int mailfno);
	
	public List<Mail> myReceiveMail(MailSch sch);
	
	public void uptSendState(String mailno);
	public void uptReceiveState(String mailno);
	
	public void uptSendStateDetail(int mailno);
	public void uptReceiveStateDetail(int mailno);
	
	public void delSendMail(String mailno);
	
	public void delReceiveMail(String mailno);
	
	public void delFile(String mailno);
	
	public int totCntSend(MailSch sch);
	public int totCntReceive(MailSch sch);
	
	public String getFname(String mailno);
	
	public void uptfileSState(String mailno);
	public void uptfileRState(String mailno);
	
	public MailFile getFileState(String mailno);
	
}
