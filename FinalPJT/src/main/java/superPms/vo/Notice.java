package superPms.vo;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int cnt;
	private int noticeno;
	private int refno;
	private String regdte;
	private String uptdte;
	private String title;
	private String content;
	private int viewcnt;
	private String writer;
	private String fno;
	private String deptid;
	private String fname;
	private String path;
	private MultipartFile report;
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	public Notice(int cnt, int noticeno, int refno, String regdte, String uptdte, String title, String content,
			int viewcnt, String writer, String fno, String deptid, String fname, String path, MultipartFile report) {
		this.cnt = cnt;
		this.noticeno = noticeno;
		this.refno = refno;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.title = title;
		this.content = content;
		this.viewcnt = viewcnt;
		this.writer = writer;
		this.fno = fno;
		this.deptid = deptid;
		this.fname = fname;
		this.path = path;
		this.report = report;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	
		
}
