package superPms.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Mail {
	private int cnt;
	private String mailno;
	private String title;
	private String content;
	private String sender;
	private Date sendDte;
	private Date receiveDte;
	private String state;
	private String receiver;
	private MultipartFile report;
	private String fname;
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getReceiveDte() {
		return receiveDte;
	}
	public void setReceiveDte(Date receiveDte) {
		this.receiveDte = receiveDte;
	}
	public String getMailno() {
		return mailno;
	}
	public void setMailno(String mailno) {
		this.mailno = mailno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public Date getSendDte() {
		return sendDte;
	}
	public void setSendDte(Date sendDte) {
		this.sendDte = sendDte;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	

	
	
}
