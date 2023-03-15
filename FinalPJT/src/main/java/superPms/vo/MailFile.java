package superPms.vo;

import java.util.Date;

public class MailFile {
	private int mailFno;
	private String fname;
	private Date regdte;
	private String rstate;
	private String sstate;
	
	public String getRstate() {
		return rstate;
	}
	public void setRstate(String rstate) {
		this.rstate = rstate;
	}
	public String getSstate() {
		return sstate;
	}
	public void setSstate(String sstate) {
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
