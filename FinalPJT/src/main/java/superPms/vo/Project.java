package superPms.vo;

public class Project {
	private int prjno;
	private String regdte;
	private String deadline;
	private String subject;
	private String tlid;
	private String deptid;
	private String openStatus;
	
	private String ename;
	private String dname;
	
	
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getPrjno() {
		return prjno;
	}
	public void setPrjno(int prjno) {
		this.prjno = prjno;
	}
	public String getRegdte() {
		return regdte;
	}
	public void setRegdte(String regdte) {
		this.regdte = regdte;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTlid() {
		return tlid;
	}
	public void setTlid(String tlid) {
		this.tlid = tlid;
	}
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getOpenStatus() {
		return openStatus;
	}
	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
	}
	
}
