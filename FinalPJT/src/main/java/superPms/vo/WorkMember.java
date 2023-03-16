package superPms.vo;

public class WorkMember {
	private String id;
	private String workno;
	private String id1;
	private String id2;
	private int prjno;

	public WorkMember(int prjno, String id1, String id2) {
		this.prjno = prjno;
		this.id1 = id1;
		this.id2 = id2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWorkno() {
		return workno;
	}
	public void setWorkno(String workno) {
		this.workno = workno;
	}
	public String getId1() {
		return id1;
	}
	public void setId1(String id1) {
		this.id1 = id1;
	}
	public String getId2() {
		return id2;
	}
	public void setId2(String id2) {
		this.id2 = id2;
	}
	public int getPrjno() {
		return prjno;
	}
	public void setPrjno(int prjno) {
		this.prjno = prjno;
	}

}
