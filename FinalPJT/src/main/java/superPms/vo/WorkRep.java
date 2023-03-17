package superPms.vo;

import org.springframework.web.multipart.MultipartFile;

public class WorkRep {
	private int no;
	private int repno;
	private String cont;
	private String regdte;
	private String uptdte;
	private String id;
	private int fno;
	private String workno;
	private String fname;
	private MultipartFile report;
	private String ename;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRepno() {
		return repno;
	}
	public void setRepno(int repno) {
		this.repno = repno;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getRegdte() {
		return regdte;
	}
	public void setRegdte(String regdte) {
		this.regdte = regdte;
	}
	public String getUptdte() {
		return uptdte;
	}
	public void setUptdte(String uptdte) {
		this.uptdte = uptdte;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	
	public String getWorkno() {
		return workno;
	}
	public void setWorkno(String workno) {
		this.workno = workno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
}
