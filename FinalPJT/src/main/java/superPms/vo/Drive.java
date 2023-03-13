package superPms.vo;

public class Drive {
	private int cnt;
	private int fno;
	private String fname;
	private String regdte;
	private String uptdte;
	private String path;
	public Drive(int cnt, int fno, String fname, String regdte, String uptdte, String path) {
		this.cnt = cnt;
		this.fno = fno;
		this.fname = fname;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.path = path;
	}
	public Drive() {
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
