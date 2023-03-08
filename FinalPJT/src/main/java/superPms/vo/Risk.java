package superPms.vo;

public class Risk {
	private int cnt;
	private int riskno;
	private String risklevel;
	private String riskpriority;
	private String riskmoniter;
	private String riskstate;
	private String riskname;
	private String id;
	private int prjno;
	private String solno;
	public Risk() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Risk(int riskno, String risklevel, String riskpriority, String riskmoniter, String riskstate,
			String riskname, String id, int prjno, String solno) {
		super();
		this.riskno = riskno;
		this.risklevel = risklevel;
		this.riskpriority = riskpriority;
		this.riskmoniter = riskmoniter;
		this.riskstate = riskstate;
		this.riskname = riskname;
		this.id = id;
		this.prjno = prjno;
		this.solno = solno;
	}


	public Risk(int cnt, int riskno, String risklevel, String riskpriority, String riskmoniter, String riskstate,
			String riskname, String id, int prjno) {
		super();
		this.cnt = cnt;
		this.riskno = riskno;
		this.risklevel = risklevel;
		this.riskpriority = riskpriority;
		this.riskmoniter = riskmoniter;
		this.riskstate = riskstate;
		this.riskname = riskname;
		this.id = id;
		this.prjno = prjno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getRiskno() {
		return riskno;
	}
	public void setRiskno(int riskno) {
		this.riskno = riskno;
	}
	public String getRisklevel() {
		return risklevel;
	}
	public void setRisklevel(String risklevel) {
		this.risklevel = risklevel;
	}
	public String getRiskpriority() {
		return riskpriority;
	}
	public void setRiskpriority(String riskpriority) {
		this.riskpriority = riskpriority;
	}
	public String getRiskmoniter() {
		return riskmoniter;
	}
	public void setRiskmoniter(String riskmoniter) {
		this.riskmoniter = riskmoniter;
	}
	public String getRiskstate() {
		return riskstate;
	}
	public void setRiskstate(String riskstate) {
		this.riskstate = riskstate;
	}
	public String getRiskname() {
		return riskname;
	}
	public void setRiskname(String riskname) {
		this.riskname = riskname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPrjno() {
		return prjno;
	}
	public void setPrjno(int prjno) {
		this.prjno = prjno;
	}
	public String getSolno() {
		return solno;
	}
	public void setSolno(String solno) {
		this.solno = solno;
	}
	
	
}
