package superPms.vo;

public class SuperEmpDept {
	private String id;
	private String pass;
	private String ename;
	private String sename; // 검색용 속성
	private String newPass; // 비밀번호 변경용 속성
	private String cell;
	private int auth;
	private String deptid;
	private String hiredate;
	private String job;
	private String dname;
	private String parentDept;
	private int level;
	private int cnt;
	
	public SuperEmpDept() {
		// TODO Auto-generated constructor stub
	}
	
	public SuperEmpDept(String id, String pass, String ename, String cell, int auth, String deptid, String hiredate,
			String job, String dname, String parentDept) {
		this.id = id;
		this.pass = pass;
		this.ename = ename;
		this.cell = cell;
		this.auth = auth;
		this.deptid = deptid;
		this.hiredate = hiredate;
		this.job = job;
		this.dname = dname;
		this.parentDept = parentDept;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
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

	public String getSename() {
		return sename;
	}

	public void setSename(String sename) {
		this.sename = sename;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
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
