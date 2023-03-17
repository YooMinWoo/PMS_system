package superPms.vo;

public class Strategycare {
	private int careno;
	private int strategyno;
	private String care_content;
	private String id;
	private String caredate;
	private String ename;
	public Strategycare() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Strategycare(int careno, int strategyno, String care_content, String id, String caredate, String ename) {
		super();
		this.careno = careno;
		this.strategyno = strategyno;
		this.care_content = care_content;
		this.id = id;
		this.caredate = caredate;
		this.ename = ename;
	}
	public int getCareno() {
		return careno;
	}
	public void setCareno(int careno) {
		this.careno = careno;
	}
	public int getStrategyno() {
		return strategyno;
	}
	public void setStrategyno(int strategyno) {
		this.strategyno = strategyno;
	}
	public String getCare_content() {
		return care_content;
	}
	public void setCare_content(String care_content) {
		this.care_content = care_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCaredate() {
		return caredate;
	}
	public void setCaredate(String caredate) {
		this.caredate = caredate;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
}
