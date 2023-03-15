package superPms.vo;

public class Strategy {
	private int strategyno;
	private int riskno;
	private String risk_strategy;
	
	public Strategy() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Strategy(int strategyno, int riskno, String risk_strategy) {
		super();
		this.strategyno = strategyno;
		this.riskno = riskno;
		this.risk_strategy = risk_strategy;
	}

	public int getStrategyno() {
		return strategyno;
	}

	public void setStrategyno(int strategyno) {
		this.strategyno = strategyno;
	}

	public int getRiskno() {
		return riskno;
	}

	public void setRiskno(int riskno) {
		this.riskno = riskno;
	}

	public String getRisk_strategy() {
		return risk_strategy;
	}

	public void setRisk_strategy(String risk_strategy) {
		this.risk_strategy = risk_strategy;
	}

	
}
