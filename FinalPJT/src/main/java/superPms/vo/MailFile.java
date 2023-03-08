package superPms.vo;

import java.util.Date;

public class MailFile {
	private int mailFno;
	private String fname;
	private Date regdte;
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
