package superPms.vo;

public class ProjectMember {
	private int prjno;
	private String owner;
	private String part;
	private String[] owners;
	private String[] parts;

	
	public String[] getOwners() {
		return owners;
	}
	public void setOwners(String[] owners) {
		this.owners = owners;
	}
	public String[] getParts() {
		return parts;
	}
	public void setParts(String[] parts) {
		this.parts = parts;
	}
	public int getPrjno() {
		return prjno;
	}
	public void setPrjno(int prjno) {
		this.prjno = prjno;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
}
