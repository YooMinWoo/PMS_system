package superPms.vo;

import java.util.Date;

public class MailFile {
	private int mailFno;
	private String fname;
	private Date regdte;
	private int rstate;
	private int sstate;
	
	
	public int getRstate() {
		return rstate;
	}
	public void setRstate(int rstate) {
		this.rstate = rstate;
	}
	public int getSstate() {
		return sstate;
	}
	public void setSstate(int sstate) {
		this.sstate = sstate;
	}
	public int getMailFno() {
		return mailFno;
	}
	public void setMailFno(int mailFno) {
		this.mailFno = mailFno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	
}
