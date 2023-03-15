package superPms.vo;

public class Solution {
	private int cnt;
	private int solno;
	private int riskno;
	private String ename;
	private String solution_content;
	private String solregdate;
	public Solution() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Solution(int solno, int riskno, String ename, String solution_content, String solregdate) {
		super();
		this.solno = solno;
		this.riskno = riskno;
		this.ename = ename;
		this.solution_content = solution_content;
		this.solregdate = solregdate;
	}

	public Solution(int cnt, int solno, int riskno, String ename, String solution_content, String solregdate) {
		super();
		this.cnt = cnt;
		this.solno = solno;
		this.riskno = riskno;
		this.ename = ename;
		this.solution_content = solution_content;
		this.solregdate = solregdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getSolno() {
		return solno;
	}

	public void setSolno(int solno) {
		this.solno = solno;
	}

	public int getRiskno() {
		return riskno;
	}

	public void setRiskno(int riskno) {
		this.riskno = riskno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getSolution_content() {
		return solution_content;
	}

	public void setSolution_content(String solution_content) {
		this.solution_content = solution_content;
	}

	public String getSolregdate() {
		return solregdate;
	}

	public void setSolregdate(String solregdate) {
		this.solregdate = solregdate;
	}
	
}
