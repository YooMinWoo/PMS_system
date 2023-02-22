package superPms.vo;

public class SuperDept {
	private String deptid;
	private String dname;
	private String parentDept;
	private int level;
	private int cnt;
	
	public SuperDept() {
		// TODO Auto-generated constructor stub
	}

	public SuperDept(String deptid, String dname, String parentDept, int level, int cnt) {
		this.deptid = deptid;
		this.dname = dname;
		this.parentDept = parentDept;
		this.level = level;
		this.cnt = cnt;
	}

	public String getDeptid() {
		return deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getParentDept() {
		return parentDept;
	}

	public void setParentDept(String parentDept) {
		this.parentDept = parentDept;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
